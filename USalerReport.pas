unit USalerReport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UBaseForm, cxGraphics, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, Uni, cxGridLevel, cxClasses,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxDropDownEdit, cxCalendar, cxContainer,
  cxTextEdit, cxMaskEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  StdCtrls, MemDS, DBAccess, ImgList, ComCtrls, ToolWin, ExtCtrls,
  UniProvider, MySQLUniProvider, cxCalc,comObj;

type
  TFrmSalerReport = class(TFrmBase)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    cxDateBegin: TcxDateEdit;
    Label3: TLabel;
    cxDateEnd: TcxDateEdit;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    QrySalerReport: TUniQuery;
    dsSalerReport: TUniDataSource;
    cxGrid1DBTableView1SelNo: TcxGridDBColumn;
    cxGrid1DBTableView1YM: TcxGridDBColumn;
    cxGrid1DBTableView1CustName: TcxGridDBColumn;
    cxGrid1DBTableView1TotalAmount: TcxGridDBColumn;
    cxGrid1DBTableView1TotalProfit: TcxGridDBColumn;
    cxGrid1DBTableView1ActAmount: TcxGridDBColumn;
    dsEmp: TUniDataSource;
    QryEmp: TUniQuery;
    cxLookupEmpNo: TcxLookupComboBox;
    cxGrid1DBTableView1SalerName: TcxGridDBColumn;
    cxTextEmpName: TcxTextEdit;
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure btnserchClick(Sender: TObject);
    procedure cxLookupEmpNoPropertiesCloseUp(Sender: TObject);
    procedure cxLookupEmpNoPropertiesChange(Sender: TObject);
    procedure btnExportClick(Sender: TObject);
    procedure cxGrid1DBTableView1SelNoGetDataText(
      Sender: TcxCustomGridTableItem; ARecordIndex: Integer;
      var AText: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSalerReport: TFrmSalerReport;

implementation

{$R *.dfm}

procedure TFrmSalerReport.FormCreate(Sender: TObject);
begin
  inherited;
  QrySalerReport.Connection:=FConnection;
  QryEmp.Connection:=FConnection;
  QryEmp.Active:=true;
   cxDateBegin.Text:=FormatDateTime('YYYY/MM/DD',now);
    cxDateEnd.Text:=FormatDateTime('YYYY/MM/DD',now);
end;

procedure TFrmSalerReport.btnserchClick(Sender: TObject);
const sql=' select  '+
  ' date_format(order_date,''%y%m'') as order_date,  '+
  'cust_code,'+
  ' (select comp_name from kc_comp_base where comp_no=a.cust_code) as sup_name,'+
  ' saler,'+
  ' (select emp_name from kc_emp_base where emp_no=a.saler) as saler_name, '+
  ' sum(a.amount) as total_amount,'+
  ' sum(a.profit) as total_profit,'+
  ' (select actamount from v_cust_total where cust_code=a.cust_code) as act_acmount_total'+
  ' from pur_sale_base a ';
var
 empNo,dateBegin,dateEnd:String;
 qrySql,filterSql:String;
begin
  //inherited;
    //销售人员业绩查询
    QrySalerReport.Close;
    qrySql:= sql;
    filterSql:='  where  1=1 ';
     if cxLookupEmpNo.Text<>'' then
     begin
      empNo:= cxLookupEmpNo.Text;
      filterSql:=filterSql+' and saler='+quotedstr(empNo);
     // QrySalerReport.ParamByName('saler').AsString:=empNo;
     end;
     if cxDateBegin.Text<>'' then
     begin
       dateBegin:=FormatDateTime('yyyyMM',cxDateBegin.Date);
        filterSql:=filterSql+' and DATE_FORMAT(ORDER_DATE, ''%Y%m'') >='+quotedstr(dateBegin);
     //  QrySalerReport.ParamByName('orderDateBegin').AsString:=dateBegin;
     end;
     if cxDateEnd.Text<>'' then
     begin
      dateEnd:=FormatDateTime('yyyyMM',cxDateEnd.Date);
       filterSql:=filterSql+' and DATE_FORMAT(ORDER_DATE, ''%Y%m'') >='+quotedstr(dateEnd);
     // QrySalerReport.ParamByName('orderDateEnd').AsString:=dateEnd;
     end;
     QrySalerReport.SQL.Text:=qrySql+filterSql+'  group by date_format(order_date,''%y%m''),cust_code,saler';
     Memo1.Lines.Add(QrySalerReport.SQL.Text);
     QrySalerReport.Open;
end;

procedure TFrmSalerReport.cxLookupEmpNoPropertiesCloseUp(Sender: TObject);
begin
  inherited;
   QryEmp.Locate('EMP_NO',cxLookupEmpNo.Text,[]);
   cxTextEmpName.Text:=QryEmp.fieldByName('EMP_NAME').AsString;
end;

procedure TFrmSalerReport.cxLookupEmpNoPropertiesChange(Sender: TObject);
begin
  inherited;
   IF cxLookupEmpNo.Text='' THEN
       cxTextEmpName.Text:='';
end;

procedure TFrmSalerReport.btnExportClick(Sender: TObject);
var
 saleNo,dynSql,fileName:String;
 appExcel:Variant;
 m,n,i:Integer;
 totalAmount,totalProfit,totalActAmount:Double;
begin
  inherited;
//导出Excel   业绩表

    if QrySalerReport.RecordCount<=0 then
    begin
        Application.MessageBox('尚无业绩数据!','提示信息',MB_OK);
        Exit;
    end;

   { with dlgSave1 do
       begin
         if dlgSave1.Execute then
         begin
          fileName:=dlgSave1.FileName;
         end;
       end;
       }
    try
     appExcel:=CreateOleObject('Excel.Application');
     Except
         Screen.Cursor := crDefault;
         Application.MessageBox('Excel尚未安装!','提示信息',MB_OK);
        Exit;
     end;

     Application.ProcessMessages;
      try
         //appExcel.visible:=true;
        appExcel.workbooks.add;
        appExcel.cells[1, 1]:= '销售人员姓名';
        appExcel.cells[1, 2]:= cxTextEmpName.Text;
       


        appExcel.ActiveSheet.Rows[1].Font.Color  := clBlack;
        appExcel.ActiveSheet.Rows[1].Font.Bold   := True;
         
        appExcel.cells[2, 1]:= '月份';
        appExcel.cells[2, 2]:= '客户名称';
        appExcel.cells[2, 3]:= '总货款';
        appExcel.cells[2, 4]:= '总利润';
        appExcel.cells[2, 5]:= '客户累计已付款';  
        m:= 3;
        totalAmount:=0;
        totalProfit:=0;
        totalActAmount:=0;
       QrySalerReport.First;
       while not QrySalerReport.Eof do
        begin   
            appExcel.cells[m, 1]:= ''''+QrySalerReport.FieldByName('ORDER_DATE').AsString;
            appExcel.cells[m, 2]:= ''''+QrySalerReport.FieldByName('SUP_NAME').AsString;
            appExcel.cells[m, 3]:= QrySalerReport.FieldByName('total_amount').AsString;
            appExcel.cells[m, 4]:= QrySalerReport.FieldByName('total_profit').AsString;
            appExcel.cells[m, 5]:= QrySalerReport.FieldByName('act_acmount_total').AsString;
            totalAmount:=totalAmount+QrySalerReport.FieldByName('total_amount').AsFloat;
            totalProfit:=totalProfit+QrySalerReport.FieldByName('total_profit').AsFloat;
            totalActAmount:=totalActAmount+QrySalerReport.FieldByName('act_acmount_total').AsFloat;
            inc(m);
           Application.ProcessMessages;
           QrySalerReport.Next;
        end;
           appExcel.cells[m, 3]:= '总计:';
          appExcel.cells[m, 3]:= floattoStr(totalAmount);
          appExcel.cells[m, 4]:= floattoStr(totalProfit);
          appExcel.cells[m, 5]:= floattoStr(totalActAmount);
        // appExcel.Activeworkbook.saveas(FileName);
         appExcel.visible:= true;
      except
        on E: Exception do
        begin
          raise Exception.Create(E.Message);
        end;
      end;


end;

procedure TFrmSalerReport.cxGrid1DBTableView1SelNoGetDataText(
  Sender: TcxCustomGridTableItem; ARecordIndex: Integer;
  var AText: String);
 var
  recordcount:integer;
begin
    RecordCount := cxGrid1DBTableView1.ViewData.RecordCount;
    AText := Format('%.' + IntToStr(Length(IntToStr(RecordCount))) + 'd', [ARecordIndex + 1]);
end;

end.
