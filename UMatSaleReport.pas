unit UMatSaleReport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UBaseForm, DB, MemDS, DBAccess, Uni, ImgList, ComCtrls, ToolWin,
  ExtCtrls, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, cxDBData, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxTextEdit, cxDropDownEdit, cxCalendar,
  cxContainer, cxMaskEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, StdCtrls,comObj;

type
  TFrmMatSaleRepot = class(TFrmBase)
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    Panel2: TPanel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1SelNo: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    cxLookupMatCode: TcxLookupComboBox;
    cxDateBegin: TcxDateEdit;
    cxTextMatName: TcxTextEdit;
    cxTextMatGauge: TcxTextEdit;
    QryMatInfo: TUniQuery;
    dsMatInfo: TUniDataSource;
    qrySaleMat: TUniQuery;
    dsQrySaleMat: TUniDataSource;
    cxGrid1DBTableView1CompName: TcxGridDBColumn;
    cxGrid1DBTableView1MatUnit: TcxGridDBColumn;
    cxGrid1DBTableView1OrderNum: TcxGridDBColumn;
    cxGrid1DBTableView1InPrice: TcxGridDBColumn;
    cxGrid1DBTableView1SalePrice: TcxGridDBColumn;
    cxGrid1DBTableView1Profit: TcxGridDBColumn;
    cxGrid1DBTableView1InvoiceNum: TcxGridDBColumn;
    cxGrid1DBTableView1Amount: TcxGridDBColumn;
    Label3: TLabel;
    cxDateEnd: TcxDateEdit;
    procedure cxLookupMatCodePropertiesCloseUp(Sender: TObject);
    procedure cxLookupMatCodePropertiesChange(Sender: TObject);
    procedure cxGrid1DBTableView1SelNoGetDataText(
      Sender: TcxCustomGridTableItem; ARecordIndex: Integer;
      var AText: String);
    procedure btnserchClick(Sender: TObject);
    procedure btnExportClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMatSaleRepot: TFrmMatSaleRepot;

implementation

{$R *.dfm}

procedure TFrmMatSaleRepot.cxLookupMatCodePropertiesCloseUp(
  Sender: TObject);
begin
  inherited;
  //商品名称
   QryMatInfo.Locate('MAT_CODE',cxLookupMatCode.Text,[]);
    cxTextMatName.Text:=QryMatInfo.fieldByName('MAT_NAME').AsString;
    cxTextMatGauge.Text:=QryMatInfo.fieldByName('MAT_GAUGE').AsString;
end;

procedure TFrmMatSaleRepot.cxLookupMatCodePropertiesChange(
  Sender: TObject);
begin
  inherited;
  if cxLookupMatCode.Text='' then
  begin
     cxTextMatName.Text:='';
     cxTextMatGauge.Text:='';
  end;
end;

procedure TFrmMatSaleRepot.cxGrid1DBTableView1SelNoGetDataText(
  Sender: TcxCustomGridTableItem; ARecordIndex: Integer;
  var AText: String);
 var
  recordcount:integer;
begin
    RecordCount := cxGrid1DBTableView1.ViewData.RecordCount;
    AText := Format('%.' + IntToStr(Length(IntToStr(RecordCount))) + 'd', [ARecordIndex + 1]);
end;

procedure TFrmMatSaleRepot.btnserchClick(Sender: TObject);
const sql='select '+
  'a.order_no, '+
  'a.order_date,'+
  'a.cust_code, '+
  'c.comp_name,'+
  'b.mat_code,'+
  'b.mat_name,'+
  'b.mat_gauge,'+
  'b.mat_unit,'+
  'b.order_num,'+
  'b.stor_price,'+
  'b.sale_price,'+
  'b.amount,'+
  'b.sale_profit, '+
  'b.invoice_num,'+
  'b.act_amount '+
  ' from pur_sale_base a    '+
  ' join pur_sale_dtl b on a.order_no=b.sale_no   '+
  ' join kc_comp_base c on c.comp_no=a.cust_code '+
  ' where 1=1 ';    
var
 empNo,dateBegin,dateEnd:String;
 qrySql,filterSql:String;
begin
 // inherited;
   qrySaleMat.Close;
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
   
  qrySaleMat.SQL.Text:=qrySql;
  qrySaleMat.Open;
end;

procedure TFrmMatSaleRepot.btnExportClick(Sender: TObject);
var
 saleNo,dynSql,fileName:String;
 appExcel:Variant;
 m,n,i:Integer;
 totalAmount,totalNum,totalProfit,totalInvoiceNum:Double;
begin
  inherited;
//商品销售单单报表
    if qrySaleMat.RecordCount<=0 then
    begin
        Application.MessageBox('尚无商品销售数据!','提示信息',MB_OK);
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
         
        appExcel.cells[2, 1]:= '客户名称';
        appExcel.cells[2, 2]:= '基本单位';
        appExcel.cells[2, 3]:= '总数量';
        appExcel.cells[2, 4]:= '进货价';
        appExcel.cells[2, 5]:= '销售价';
        appExcel.cells[2, 6]:= '金额';
        appExcel.cells[2, 7]:= '利润';
        appExcel.cells[2, 8]:= '开票数量';
        m:= 3;
        totalAmount:=0;
        totalNum:=0;
        totalProfit:=0;
        totalInvoiceNum:=0;
       qrySaleMat.First;
       while not qrySaleMat.Eof do
        begin
          
            appExcel.cells[m, 1]:= ''''+qrySaleMat.FieldByName('sup_name').AsString;
            appExcel.cells[m, 2]:= ''''+qrySaleMat.FieldByName('MAT_UNIT').AsString;
            appExcel.cells[m, 3]:= qrySaleMat.FieldByName('ORDER_NUM').AsString;
            appExcel.cells[m, 4]:= qrySaleMat.FieldByName('STOR_PRICE').AsString;
            appExcel.cells[m, 5]:= qrySaleMat.FieldByName('SALE_PRICE').AsString;
            appExcel.cells[m, 6]:= qrySaleMat.FieldByName('AMOUNT').AsString;
            appExcel.cells[m, 7]:= qrySaleMat.FieldByName('SALE_PROFIT').AsString;
            appExcel.cells[m, 8]:= qrySaleMat.FieldByName('INVOICE_NUM').AsString;

            totalNum:=totalNum+qrySaleMat.FieldByName('ORDER_NUM').AsFloat;
            totalAmount:=totalAmount+qrySaleMat.FieldByName('AMOUNT').AsFloat;
            totalProfit:=totalProfit+qrySaleMat.FieldByName('SALE_PROFIT').AsFloat;
            totalInvoiceNum:=totalInvoiceNum+qrySaleMat.FieldByName('INVOICE_NUM').AsFloat;
            inc(m);
           Application.ProcessMessages;
           qrySaleMat.Next;
        end;
           appExcel.cells[m, 1]:= '总计:';
          appExcel.cells[m, 3]:= floattoStr(totalNum);
          appExcel.cells[m, 6]:= floattoStr(totalAmount);
          appExcel.cells[m, 7]:= floattoStr(totalProfit);
          appExcel.cells[m, 8]:= floattoStr(totalInvoiceNum);
        // appExcel.Activeworkbook.saveas(FileName);
         appExcel.visible:= true;
      except
        on E: Exception do
        begin
          raise Exception.Create(E.Message);
        end;
      end;


end;

procedure TFrmMatSaleRepot.FormCreate(Sender: TObject);
begin
  inherited;
 qrySaleMat.Connection:=FConnection;
   QryMatInfo.Connection:=FConnection;
   QryMatInfo.Active:=true;
end;

end.
