unit UOrderReport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UBaseForm, DB, MemDS, DBAccess, Uni, ImgList, ComCtrls, ToolWin,
  ExtCtrls, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, cxDBData, cxTextEdit, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxContainer,
  cxMaskEdit, cxCalendar, StdCtrls, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, UniProvider, MySQLUniProvider,comObj;

type
  TFrmOrderReport = class(TFrmBase)
    Panel1: TPanel;
    Panel2: TPanel;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    Label1: TLabel;
    Label2: TLabel;
    cxDateBegin: TcxDateEdit;
    cxDateEnd: TcxDateEdit;
    Label3: TLabel;
    dsOrderReport: TUniDataSource;
    QryOrderReport: TUniQuery;
    dsQrySupCode: TUniDataSource;
    QrySupCode: TUniQuery;
    cxTextSupName: TcxTextEdit;
    cxCmpSupCode: TcxLookupComboBox;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxGrid1DBTableView1OrderDate: TcxGridDBColumn;
    cxGrid1DBTableView1OrderNo: TcxGridDBColumn;
    cxGrid1DBTableView1MatCode: TcxGridDBColumn;
    cxGrid1DBTableView1MatName: TcxGridDBColumn;
    cxGrid1DBTableView1MatGauge: TcxGridDBColumn;
    cxGrid1DBTableView1OrderNum: TcxGridDBColumn;
    cxGrid1DBTableView1Amount: TcxGridDBColumn;
    cxGrid1DBTableView1SupName: TcxGridDBColumn;
    cxGrid1DBTableView1SelNo: TcxGridDBColumn;
    procedure btnserchClick(Sender: TObject);
    procedure cxGrid1DBTableView1SelNoGetDataText(
      Sender: TcxCustomGridTableItem; ARecordIndex: Integer;
      var AText: String);
    procedure FormCreate(Sender: TObject);
    procedure cxCmpSupCodePropertiesCloseUp(Sender: TObject);
    procedure cxCmpSupCodePropertiesChange(Sender: TObject);
    procedure btnExportClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmOrderReport: TFrmOrderReport;

implementation

{$R *.dfm}

procedure TFrmOrderReport.btnserchClick(Sender: TObject);
var
  supCode:String;
   OrderDateBegin,OrderDateEnd:TDate;
begin
  //inherited;
    QryOrderReport.Close;
    if cxCmpSupCode.Text='' then
    begin
       Application.MessageBox('厂商必须选择!','提示信息',MB_OK);
        Exit;
    end;
    supCode:= cxCmpSupCode.Text;
    QryOrderReport.ParamByName('supCode').AsString:=supCode;
    if cxDateBegin.Date<>null then
      begin
         QryOrderReport.ParamByName('orderDateBegin').AsDate:=cxDateBegin.Date;
      end;
      if cxDateEnd.Date<>null then
      begin
         QryOrderReport.ParamByName('orderDateEnd').AsDate:=cxDateEnd.Date;
      end;
     QryOrderReport.Open;
end;

procedure TFrmOrderReport.cxGrid1DBTableView1SelNoGetDataText(
  Sender: TcxCustomGridTableItem; ARecordIndex: Integer;
  var AText: String);
 var
  recordcount:integer;
begin
    RecordCount := cxGrid1DBTableView1.ViewData.RecordCount;
    AText := Format('%.' + IntToStr(Length(IntToStr(RecordCount))) + 'd', [ARecordIndex + 1]);
end;


procedure TFrmOrderReport.FormCreate(Sender: TObject);
begin
  inherited;
      QrySupCode.Connection:=FConnection;
      QrySupCode.Active:=true;
      QryOrderReport.Connection:=FConnection;
     
     cxDateBegin.Text:=FormatDateTime('YYYY/MM/DD',now);
     cxDateEnd.Text:=FormatDateTime('YYYY/MM/DD',now);
end;

procedure TFrmOrderReport.cxCmpSupCodePropertiesCloseUp(Sender: TObject);
begin
 //inherited;
    QrySupCode.Locate('COMP_NO',cxCmpSupCode.Text,[]);
    cxTextSupName.Text:=QrySupCode.fieldByName('COMP_NAME').AsString;
end;

procedure TFrmOrderReport.cxCmpSupCodePropertiesChange(Sender: TObject);
begin
  inherited;
  IF cxCmpSupCode.Text='' THEN
   cxTextSupName.Text:='';
end;

procedure TFrmOrderReport.btnExportClick(Sender: TObject);
var
 saleNo,dynSql,fileName:String;
 appExcel:Variant;
 m,n,i:Integer;
 totalAmount:Double;
begin
  inherited;
//导出Excel   购货单

    if QryOrderReport.RecordCount<=0 then
    begin
        Application.MessageBox('尚无购货单数据!','提示信息',MB_OK);
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

        appExcel.ActiveSheet.Rows[1].Font.Color  := clBlack;
        appExcel.ActiveSheet.Rows[1].Font.Bold   := True;
         
        appExcel.cells[2, 1]:= '单据日期';
        appExcel.cells[2, 2]:= '单据编号';
        appExcel.cells[2, 3]:= '简码';
        appExcel.cells[2, 4]:= '商品名称';
        appExcel.cells[2, 5]:= '规格型号';
        appExcel.cells[2, 6]:= '数量';
        appExcel.cells[2, 7]:= '金额';


        m:= 3;
        totalAmount:=0;
       QryOrderReport.First;
       while not QryOrderReport.Eof do
        begin   
            appExcel.cells[m, 1]:= ''''+QryOrderReport.FieldByName('ORDER_DATE').AsString;
            appExcel.cells[m, 2]:= ''''+QryOrderReport.FieldByName('ORDER_NO').AsString;
            appExcel.cells[m, 3]:= ''''+QryOrderReport.FieldByName('MAT_CODE').AsString;
            appExcel.cells[m, 4]:= ''''+QryOrderReport.FieldByName('MAT_NAME').AsString;
            appExcel.cells[m, 5]:= ''''+QryOrderReport.FieldByName('MAT_GAUGE').AsString;
            appExcel.cells[m, 6]:= QryOrderReport.FieldByName('ORDER_NUM').AsString;
            appExcel.cells[m, 7]:= QryOrderReport.FieldByName('AMOUNT').AsString;
            totalAmount:=totalAmount+QryOrderReport.FieldByName('AMOUNT').AsFloat;
            inc(m);
           Application.ProcessMessages;
           QryOrderReport.Next;
        end;
        appExcel.cells[1, 4]:= floattostr(totalAmount);
        // appExcel.Activeworkbook.saveas(FileName);
         appExcel.visible:= true;
      except
        on E: Exception do
        begin
          raise Exception.Create(E.Message);
        end;
      end;


end;

end.
