unit USaleReport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UBaseForm, DB, MemDS, DBAccess, Uni, ImgList, ComCtrls, ToolWin,
  ExtCtrls, cxGraphics, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxMaskEdit, cxCalendar, cxContainer, cxTextEdit,
  StdCtrls,ComObj;

type
  TFrmSaleReport = class(TFrmBase)
    Panel1: TPanel;
    Panel2: TPanel;
    Label3: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    cxTextSupName: TcxTextEdit;
    cxDateEnd: TcxDateEdit;
    cxDateBegin: TcxDateEdit;
    cxCmpSupCode: TcxLookupComboBox;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1SelNo: TcxGridDBColumn;
    cxGrid1DBTableView1OrderDate: TcxGridDBColumn;
    cxGrid1DBTableView1OrderNo: TcxGridDBColumn;
    cxGrid1DBTableView1MatCode: TcxGridDBColumn;
    cxGrid1DBTableView1MatName: TcxGridDBColumn;
    cxGrid1DBTableView1MatGauge: TcxGridDBColumn;
    cxGrid1DBTableView1OrderNum: TcxGridDBColumn;
    cxGrid1DBTableView1Amount: TcxGridDBColumn;
    cxGrid1DBTableView1SupName: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    dsSaleReport: TUniDataSource;
    QrySaleReport: TUniQuery;
    dsQrySupCode: TUniDataSource;
    QrySupCode: TUniQuery;
    cxGrid1DBTableView1Profit: TcxGridDBColumn;
    Label4: TLabel;
    LblTotalPayAmount: TLabel;
    QryTemp: TUniQuery;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    procedure cxCmpSupCodePropertiesCloseUp(Sender: TObject);
    procedure cxCmpSupCodePropertiesChange(Sender: TObject);
    procedure btnserchClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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
  FrmSaleReport: TFrmSaleReport;

implementation

{$R *.dfm}

procedure TFrmSaleReport.cxCmpSupCodePropertiesCloseUp(Sender: TObject);
const dynmSql='SELECT SUM(ACT_AMOUNT) AS actAmount FROM pur_sale_base a join  pur_sale_dtl b on a.ORDER_NO=b.SALE_NO WHERE a.cust_code=''%s'' ';
var
 qrySql:String;
begin
  inherited;
    QrySupCode.Locate('COMP_NO',cxCmpSupCode.Text,[]);
    cxTextSupName.Text:=QrySupCode.fieldByName('COMP_NAME').AsString;
    qrySql:=format(dynmSql,[cxCmpSupCode.Text]);
   with  QryTemp do
   begin
      close;
      sql.Text:=qrySql;
      open;
      LblTotalPayAmount.Caption:=fieldByName('actAmount').AsString;
      LblTotalPayAmount.Visible:=true;
   end;

end;

procedure TFrmSaleReport.cxCmpSupCodePropertiesChange(Sender: TObject);
begin
  inherited;
  IF cxCmpSupCode.Text='' THEN
   cxTextSupName.Text:='';
end;

procedure TFrmSaleReport.btnserchClick(Sender: TObject);
var
  supCode:String;
   OrderDateBegin,OrderDateEnd:TDate;
begin
  //inherited;
    QrySaleReport.Close;
    if cxCmpSupCode.Text='' then
    begin
       Application.MessageBox('客户必须选择!','提示信息',MB_OK);
        Exit;
    end;
    supCode:= cxCmpSupCode.Text;
    QrySaleReport.ParamByName('supCode').AsString:=supCode;
    if cxDateBegin.Date<>null then
      begin
         QrySaleReport.ParamByName('orderDateBegin').AsDate:=cxDateBegin.Date;
      end;
      if cxDateEnd.Date<>null then
      begin
         QrySaleReport.ParamByName('orderDateEnd').AsDate:=cxDateEnd.Date;
      end;
     QrySaleReport.Open;
end;

procedure TFrmSaleReport.FormCreate(Sender: TObject);
begin
  inherited;
      QrySupCode.Connection:=FConnection;
      QrySupCode.Active:=true;
      QrySaleReport.Connection:=FConnection;
       QryTemp.Connection:=FConnection;
     cxDateBegin.Text:=FormatDateTime('YYYY/MM/DD',now);
     cxDateEnd.Text:=FormatDateTime('YYYY/MM/DD',now);
end;

procedure TFrmSaleReport.btnExportClick(Sender: TObject);
var
 saleNo,dynSql,fileName:String;
 appExcel:Variant;
 m,n,i:Integer;
 totalAmount,totalProfit:Double;
begin
  inherited;
//导出Excel   购货单

    if QrySaleReport.RecordCount<=0 then
    begin
        Application.MessageBox('尚无销售单数据!','提示信息',MB_OK);
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
        appExcel.cells[1, 1]:= '供应商名称';

        appExcel.cells[1, 2]:= cxTextSupName.Text;
        appExcel.cells[1, 3]:= '总金额';
        appExcel.cells[1, 4]:= '';

        appExcel.cells[1, 5]:= '总利润';
        appExcel.cells[1, 6]:= '';


       { appExcel.cells[1, 7]:= '已付款';
        appExcel.cells[1, 8]:= '';  }


        appExcel.ActiveSheet.Rows[1].Font.Color  := clBlack;
        appExcel.ActiveSheet.Rows[1].Font.Bold   := True;
         
        appExcel.cells[2, 1]:= '单据日期';
        appExcel.cells[2, 2]:= '单据编号';
        appExcel.cells[2, 3]:= '简码';
        appExcel.cells[2, 4]:= '商品名称';
        appExcel.cells[2, 5]:= '规格型号';
        appExcel.cells[2, 6]:= '数量';
        appExcel.cells[2, 7]:= '金额';
        appExcel.cells[2, 8]:= '利润';

        m:= 3;
        totalAmount:=0;
        totalProfit:=0;
       QrySaleReport.First;
       while not QrySaleReport.Eof do
        begin   
            appExcel.cells[m, 1]:= ''''+QrySaleReport.FieldByName('ORDER_DATE').AsString;
            appExcel.cells[m, 2]:= ''''+QrySaleReport.FieldByName('ORDER_NO').AsString;
            appExcel.cells[m, 3]:= ''''+QrySaleReport.FieldByName('MAT_CODE').AsString;
            appExcel.cells[m, 4]:= ''''+QrySaleReport.FieldByName('MAT_NAME').AsString;
            appExcel.cells[m, 5]:= ''''+QrySaleReport.FieldByName('MAT_GAUGE').AsString;
            appExcel.cells[m, 6]:= QrySaleReport.FieldByName('ORDER_NUM').AsString;
            appExcel.cells[m, 7]:= QrySaleReport.FieldByName('AMOUNT').AsString;
            appExcel.cells[m, 8]:= QrySaleReport.FieldByName('SALE_PROFIT').AsString;
            totalAmount:=totalAmount+QrySaleReport.FieldByName('AMOUNT').AsFloat;
            totalProfit:=totalProfit+QrySaleReport.FieldByName('SALE_PROFIT').AsFloat;
            inc(m);
           Application.ProcessMessages;
           QrySaleReport.Next;
        end;
        appExcel.cells[1, 4]:= floattostr(totalAmount);
        appExcel.cells[1, 6]:= floattostr(totalProfit);
        // appExcel.Activeworkbook.saveas(FileName);
         appExcel.visible:= true;
      except
        on E: Exception do
        begin
          raise Exception.Create(E.Message);
        end;
      end;


end;

procedure TFrmSaleReport.cxGrid1DBTableView1SelNoGetDataText(
  Sender: TcxCustomGridTableItem; ARecordIndex: Integer;
  var AText: String);
 var
  recordcount:integer;
begin
    RecordCount := cxGrid1DBTableView1.ViewData.RecordCount;
    AText := Format('%.' + IntToStr(Length(IntToStr(RecordCount))) + 'd', [ARecordIndex + 1]);
end;

end.
