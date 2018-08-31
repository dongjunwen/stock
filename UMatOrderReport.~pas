unit UMatOrderReport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UBaseForm, DB, MemDS, DBAccess, Uni, ImgList, ComCtrls, ToolWin,
  ExtCtrls, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, cxDBData, cxContainer, cxTextEdit, StdCtrls,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  cxDropDownEdit, cxCalendar, cxMaskEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, UniProvider, MySQLUniProvider,comObj;

type
  TFrmMatOrderReport = class(TFrmBase)
    Panel1: TPanel;
    Panel2: TPanel;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    Label1: TLabel;
    qryOrderMat: TUniQuery;
    qryOrderMatORDER_NO: TStringField;
    qryOrderMatORDER_DATE: TDateField;
    qryOrderMatSUP_CODE: TStringField;
    qryOrderMatsup_name: TStringField;
    qryOrderMatMAT_CODE: TStringField;
    qryOrderMatMAT_NAME: TStringField;
    qryOrderMatMAT_GAUGE: TStringField;
    qryOrderMatMAT_UNIT: TStringField;
    qryOrderMatORDER_NUM: TFloatField;
    qryOrderMatPRICE: TFloatField;
    qryOrderMatAMOUNT: TFloatField;
    dsQryOrderMat: TUniDataSource;
    cxLookupMatCode: TcxLookupComboBox;
    cxDateBegin: TcxDateEdit;
    Label2: TLabel;
    cxGrid1DBTableView1Column1: TcxGridDBColumn;
    cxGrid1DBTableView1Column2: TcxGridDBColumn;
    cxGrid1DBTableView1OrderNum: TcxGridDBColumn;
    cxGrid1DBTableView1InPrice: TcxGridDBColumn;
    cxGrid1DBTableView1Amount: TcxGridDBColumn;
    cxGrid1DBTableView1SelNo: TcxGridDBColumn;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxTextMatName: TcxTextEdit;
    cxTextMatGauge: TcxTextEdit;
    QryMatInfo: TUniQuery;
    dsMatInfo: TUniDataSource;
    Label3: TLabel;
    cxDateEnd: TcxDateEdit;
    procedure cxGrid1DBTableView1SelNoGetDataText(
      Sender: TcxCustomGridTableItem; ARecordIndex: Integer;
      var AText: String);
    procedure btnserchClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnExportClick(Sender: TObject);
    procedure cxLookupComboBox1PropertiesCloseUp(Sender: TObject);
    procedure cxLookupMatCodePropertiesChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMatOrderReport: TFrmMatOrderReport;

implementation

{$R *.dfm}

procedure TFrmMatOrderReport.cxGrid1DBTableView1SelNoGetDataText(
  Sender: TcxCustomGridTableItem; ARecordIndex: Integer;
  var AText: String);
 var
  recordcount:integer;
begin
    RecordCount := cxGrid1DBTableView1.ViewData.RecordCount;
    AText := Format('%.' + IntToStr(Length(IntToStr(RecordCount))) + 'd', [ARecordIndex + 1]);
end;

procedure TFrmMatOrderReport.btnserchClick(Sender: TObject);
const sql=' SELECT  '+
  'a.ORDER_NO,'+
  'a.ORDER_DATE, '+
  'a.SUP_CODE, '+
  '(SELECT COMP_NAME FROM kc_comp_base WHERE comp_no=a.SUP_CODE) AS sup_name,'+
  'b.MAT_CODE,'+
  'b.MAT_NAME,'+
  'b.MAT_GAUGE,'+
 ' b.MAT_UNIT, '+
 ' b.ORDER_NUM,'+
  'b.PRICE,'+
  'b.AMOUNT '+
  ' FROM pur_order_base a  JOIN pur_order_dtl b ON  '+
  '  a.ORDER_NO=b.ORDER_NO  '+
  ' WHERE 1=1 ';
var
 empNo,dateBegin,dateEnd:String;
 qrySql,filterSql:String;
begin
  //inherited;
  qryOrderMat.Close;
  if cxLookupMatCode.Text<>'' then
  begin
     filterSql:=filterSql+' and MAT_CODE='+QuotedStr(cxLookupMatCode.Text);
  end;
   if cxDateBegin.Text<>'' then
  begin
     filterSql:=filterSql+' and ORDER_DATE>='+QuotedStr(cxDateBegin.Text);
  end;
    if cxDateEnd.Text<>'' then
  begin
     filterSql:=filterSql+' and ORDER_DATE<='+QuotedStr(cxDateEnd.Text);
  end;
   qrySql:= sql+filterSql;
   
  qryOrderMat.SQL.Text:=qrySql;
  qryOrderMat.Open;

end;

procedure TFrmMatOrderReport.FormCreate(Sender: TObject);
begin
  inherited;
   qryOrderMat.Connection:=FConnection;
   QryMatInfo.Connection:=FConnection;
   QryMatInfo.Active:=true;
end;

procedure TFrmMatOrderReport.btnExportClick(Sender: TObject);
var
 saleNo,dynSql,fileName:String;
 appExcel:Variant;
 m,n,i:Integer;
 totalAmount,totalNum:Double;
begin
  inherited;
//商品购入单报表
    if qryOrderMat.RecordCount<=0 then
    begin
        Application.MessageBox('尚无商品购入数据!','提示信息',MB_OK);
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
        appExcel.cells[1, 1]:= '商品名称';
        appExcel.cells[1, 2]:= cxTextMatName.Text;

        appExcel.cells[1, 3]:= '规格型号';
        appExcel.cells[1, 4]:= cxTextMatGauge.Text;

        appExcel.cells[1, 5]:= '日期';
        appExcel.cells[1, 6]:= cxDateBegin.Text+'至'+cxDateEnd.Text;




        appExcel.ActiveSheet.Rows[1].Font.Color  := clBlack;
        appExcel.ActiveSheet.Rows[1].Font.Bold   := True;
         
        appExcel.cells[2, 1]:= '供应商';
        appExcel.cells[2, 2]:= '基本单位';
        appExcel.cells[2, 3]:= '总数量';
        appExcel.cells[2, 4]:= '进货价';
        appExcel.cells[2, 5]:= '金额';
        m:= 3;
        totalAmount:=0;
        totalNum:=0;
       qryOrderMat.First;
       while not qryOrderMat.Eof do
        begin   
            appExcel.cells[m, 1]:= ''''+qryOrderMat.FieldByName('sup_name').AsString;
            appExcel.cells[m, 2]:= ''''+qryOrderMat.FieldByName('MAT_UNIT').AsString;
            appExcel.cells[m, 3]:= qryOrderMat.FieldByName('ORDER_NUM').AsString;
            appExcel.cells[m, 4]:= qryOrderMat.FieldByName('PRICE').AsString;
            appExcel.cells[m, 5]:= qryOrderMat.FieldByName('AMOUNT').AsString;
            totalAmount:=totalAmount+qryOrderMat.FieldByName('AMOUNT').AsFloat;
            totalNum:=totalNum+qryOrderMat.FieldByName('ORDER_NUM').AsFloat;             
            inc(m);
           Application.ProcessMessages;
           qryOrderMat.Next;
        end;
           appExcel.cells[m, 1]:= '总计:';
          appExcel.cells[m, 3]:= floattoStr(totalNum);
          appExcel.cells[m, 5]:= floattoStr(totalAmount);
        // appExcel.Activeworkbook.saveas(FileName);
         appExcel.visible:= true;
      except
        on E: Exception do
        begin
          raise Exception.Create(E.Message);
        end;
      end;


end;

procedure TFrmMatOrderReport.cxLookupComboBox1PropertiesCloseUp(
  Sender: TObject);
begin
  inherited;
  //商品名称
   QryMatInfo.Locate('MAT_CODE',cxLookupMatCode.Text,[]);
    cxTextMatName.Text:=QryMatInfo.fieldByName('MAT_NAME').AsString;
    cxTextMatGauge.Text:=QryMatInfo.fieldByName('MAT_GAUGE').AsString;
end;

procedure TFrmMatOrderReport.cxLookupMatCodePropertiesChange(
  Sender: TObject);
begin
  inherited;
  if cxLookupMatCode.Text='' then
  begin
     cxTextMatName.Text:='';
     cxTextMatGauge.Text:='';
  end;
end;

end.
