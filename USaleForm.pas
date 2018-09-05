unit USaleForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UBaseData, DB, MemDS, DBAccess, Uni, ImgList, ComCtrls, ToolWin,
  ExtCtrls, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, cxDBData, cxDBLookupComboBox, cxCalendar,
  cxTextEdit, StdCtrls, cxDropDownEdit, cxDBEdit, cxMaskEdit, cxLookupEdit,
  cxDBLookupEdit, cxContainer, cxSplitter, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, UniProvider, MySQLUniProvider,UCommonUtil,ULoginUser;

type
  TFrmSaleForm = class(TFrmData)
    PnlLeft: TPanel;
    cxGrid2: TcxGrid;
    cxGrid2DBTableView1: TcxGridDBTableView;
    cxGrid2DBTableView1OrderDate: TcxGridDBColumn;
    cxGrid2DBTableView1OrderNo: TcxGridDBColumn;
    cxGrid2DBTableView1SupCode: TcxGridDBColumn;
    cxGrid2DBTableView1SupName: TcxGridDBColumn;
    cxGrid2Level1: TcxGridLevel;
    PnlRight: TPanel;
    cxSplitter1: TcxSplitter;
    Panel2: TPanel;
    Panel3: TPanel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1ColNum: TcxGridDBColumn;
    cxGrid1DBTableView1MatCode: TcxGridDBColumn;
    cxGrid1DBTableView1MatName: TcxGridDBColumn;
    cxGrid1DBTableView1MatGauge: TcxGridDBColumn;
    cxGrid1DBTableView1MatUnit: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    PnlData: TPanel;
    Label9: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    Label16: TLabel;
    Label15: TLabel;
    Label14: TLabel;
    Label13: TLabel;
    Label10: TLabel;
    Label1: TLabel;
    cxDBTextContact: TcxDBTextEdit;
    cxDBTextEdit4: TcxDBTextEdit;
    cxDBTextAddr: TcxDBTextEdit;
    cxDBTextTel: TcxDBTextEdit;
    cxDBTextOrderNo: TcxDBTextEdit;
    cxDBLookupSupCode: TcxDBLookupComboBox;
    cxDBDateEdit1: TcxDBDateEdit;
    Memo1: TMemo;
    PanelSearchTop: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    cxTextSupName: TcxTextEdit;
    cxTextOrderNo: TcxTextEdit;
    cxDateOrderDateBegin: TcxDateEdit;
    cxDateOrderDateEnd: TcxDateEdit;
    cxCmpSupCode: TcxLookupComboBox;
    cxDBTextLogistNum: TcxDBTextEdit;
    Label2: TLabel;
    Label11: TLabel;
    cxDBTextEdit2: TcxDBTextEdit;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    TblMainORDER_NO: TStringField;
    TblMainORDER_DATE: TDateField;
    TblMainCUST_CODE: TStringField;
    TblMainADDRESS: TStringField;
    TblMainTEL: TStringField;
    TblMainCONTACT: TStringField;
    TblMainSALER: TStringField;
    TblMainAMOUNT: TFloatField;
    TblMainPROFIT: TFloatField;
    TblMainLOGIST_NUM: TStringField;
    TblMainINSERT_TIME: TDateTimeField;
    TblMainLAST_UPT_TIME: TDateTimeField;
    TblMainMEMO: TStringField;
    dsQryMain: TUniDataSource;
    QryMain: TUniQuery;
    QryMainORDER_NO: TStringField;
    QryMainORDER_DATE: TDateField;
    QryMainCOMP_NAME: TStringField;
    QryMainCUST_CODE: TStringField;
    dsQrySupCode: TUniDataSource;
    QrySupCode: TUniQuery;
    DsQryMat: TUniDataSource;
    QryMatCode: TUniQuery;
    QryMatCodeMAT_CODE: TStringField;
    QryMatCodeMAT_NAME: TStringField;
    QryMatCodeMAT_GAUGE: TStringField;
    QryMatCodeMAT_UNIT: TStringField;
    QryMatCodeMAT_TYPE: TStringField;
    QryMatCodeMEMO: TStringField;
    TblDtlSALE_NO: TStringField;
    TblDtlSTOR_OUT_NO: TStringField;
    TblDtlMAT_CODE: TStringField;
    TblDtlMAT_NAME: TStringField;
    TblDtlMAT_UNIT: TStringField;
    TblDtlORDER_NUM: TFloatField;
    TblDtlSTOR_PRICE: TFloatField;
    TblDtlSALE_PRICE: TFloatField;
    TblDtlAMOUNT: TFloatField;
    TblDtlSALE_PROFIT: TFloatField;
    TblDtlINVOICE_NUM: TFloatField;
    TblDtlACT_AMOUNT: TFloatField;
    TblDtlMEMO: TStringField;
    TblDtlmatType: TStringField;
    cxGrid1DBTableView1OrderNum: TcxGridDBColumn;
    cxGrid1DBTableView1StorPrice: TcxGridDBColumn;
    cxGrid1DBTableView1SalePrice: TcxGridDBColumn;
    cxGrid1DBTableView1Amout: TcxGridDBColumn;
    cxGrid1DBTableView1Profit: TcxGridDBColumn;
    cxGrid1DBTableView1InvoiceNum: TcxGridDBColumn;
    cxGrid1DBTableView1ActAmount: TcxGridDBColumn;
    cxGrid1DBTableView1MatType: TcxGridDBColumn;
    btnStorOut: TToolButton;
    TblDtlMAT_GAUGE: TStringField;
    cxGrid1DBTableView1StorOutNo: TcxGridDBColumn;
    QryTemp: TUniQuery;
    cxDBLookupEmpCode: TcxDBLookupComboBox;
    QryEmp: TUniQuery;
    dsEmp: TUniDataSource;
    cxDBTextEdit1: TcxDBTextEdit;
    TblMainCUST_NAME: TStringField;
    procedure cxDBLookupSupCodePropertiesCloseUp(Sender: TObject);
    procedure cxCmpSupCodePropertiesCloseUp(Sender: TObject);
    procedure cxCmpSupCodePropertiesChange(Sender: TObject);
    procedure TblMainNewRecord(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure btnserchClick(Sender: TObject);
    procedure btnLastClick(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure btnBeforeClick(Sender: TObject);
    procedure btnFirstClick(Sender: TObject);
    procedure cxGrid1DBTableView1ColNumGetDataText(
      Sender: TcxCustomGridTableItem; ARecordIndex: Integer;
      var AText: String);
    procedure TblDtlNewRecord(DataSet: TDataSet);
    procedure cxGrid1DBTableView1MatCodePropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    procedure btnStorOutClick(Sender: TObject);
    procedure btndeleteClick(Sender: TObject);
    procedure btnModiClick(Sender: TObject);
    procedure TblDtlAfterPost(DataSet: TDataSet);
    procedure TblDtlBeforePost(DataSet: TDataSet);
    procedure TblDtlBeforeDelete(DataSet: TDataSet);
    procedure btnSaveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSaleForm: TFrmSaleForm;

implementation

uses UStorManage, UStorOut, UStorBatchOut;

{$R *.dfm}

procedure TFrmSaleForm.cxDBLookupSupCodePropertiesCloseUp(Sender: TObject);
begin
  inherited;
   QrySupCode.Locate('COMP_NO',cxDBLookupSupCode.Text,[loCaseInsensitive, loPartialKey]);
  TblMain.FieldByName('CUST_CODE').Value:=QrySupCode.fieldByName('COMP_NO').Value;
 // TblMain.FieldByName('COMP_ACCT').Value:=QrySupCode.fieldByName('COMP_ACCT').AsString;
  TblMain.FieldByName('CONTACT').Value:=QrySupCode.fieldByName('CONTACT').AsString;
  TblMain.FieldByName('TEL').Value:=QrySupCode.fieldByName('TEL').AsString;
  TblMain.FieldByName('ADDRESS').Value:=QrySupCode.fieldByName('ADDRESS').AsString;
end;

procedure TFrmSaleForm.cxCmpSupCodePropertiesCloseUp(Sender: TObject);
begin
  inherited;
   QrySupCode.Locate('COMP_NO',cxCmpSupCode.Text,[]);
  cxTextSupName.Text:=QrySupCode.fieldByName('COMP_NAME').AsString;
end;

procedure TFrmSaleForm.cxCmpSupCodePropertiesChange(Sender: TObject);
begin
  inherited;
   IF cxCmpSupCode.Text='' THEN
   cxTextSupName.Text:='';
end;

procedure TFrmSaleForm.TblMainNewRecord(DataSet: TDataSet);
var
  orderNo:String;
begin
  inherited;
     orderNo:=GetSeqId('S');
   TblMain.FieldByName('ORDER_NO').Value:=orderNo;
end;

procedure TFrmSaleForm.FormCreate(Sender: TObject);
begin
  inherited;
   cxDateOrderDateBegin.Text:=FormatDateTime('YYYY/MM/DD',now-15);
   cxDateOrderDateEnd.Text:=FormatDateTime('YYYY/MM/DD',now+7);
    QryMain.Connection:=FConnection;
   QryMatCode.Connection:=FConnection;
   QrySupCode.Connection:=FConnection;
   QrySupCode.Close;
   QrySupCode.Open;
   QryTemp.Connection:=FConnection;
   QryEmp.Connection:=FConnection;
   QryEmp.Close;
   QryEmp.Open;
   btnserch.Click();
    cxSplitter1.CloseSplitter;
end;

procedure TFrmSaleForm.btnserchClick(Sender: TObject);
Const qrySql='SELECT a.ORDER_NO,a.ORDER_DATE,a.CUST_CODE,b.COMP_NAME  '+
 ' FROM pur_sale_base a left JOIN  kc_comp_base b ON a.CUST_CODE=b.COMP_NO WHERE 1=1 ';
var
  dynmSql,filterStr:String;
  OrderNo,SupCode:String;
  OrderDateBegin,OrderDateEnd:TDate;
begin
  //inherited;
   OrderNo:=cxTextOrderNo.Text;
   OrderDateBegin:=cxDateOrderDateBegin.Date;
   OrderDateEnd:=cxDateOrderDateEnd.Date;
   SupCode:=cxCmpSupCode.Text;
   filterStr:=' ';
  if OrderNo<>'' then
  begin
     filterStr:=filterStr+format(' and a.ORDER_NO like ''%s'' ',[OrderNo]);
  end;
  if OrderDateBegin<>null then
  begin
     filterStr:=filterStr+' and  a.ORDER_DATE>='+QuotedStr(DateToStr(OrderDateBegin));
  end;
   if OrderDateEnd<>null then
  begin
     filterStr:=filterStr+' and  a.ORDER_DATE<='+QuotedStr(DateToStr(OrderDateEnd));
  end;
   if SupCode<>'' then
  begin
     filterStr:=filterStr+' and a.CUST_CODE ='+QuotedStr(SupCode);
  end;
    filterStr:=filterStr+' order by a.order_date desc LIMIT 0, 1000';
    dynmSql:=qrySql+ filterStr;
    //Memo1.Lines.Clear;
    //Memo1.Lines.Text:= dynmSql;
    with QryMain  do
    begin
       close;
       sql.Text:= dynmSql;
       open;
       if not TblMain.Active then     TblMain.Active:=true;
       if not TblDtl.Active then     TblDtl.Active:=true;
    end;

    

end;

procedure TFrmSaleForm.btnLastClick(Sender: TObject);
begin
  //inherited;
     if QryMain.Active then
      QryMain.Last;
end;

procedure TFrmSaleForm.btnNextClick(Sender: TObject);
begin
 // inherited;
     if QryMain.Active then
      QryMain.Next;
end;

procedure TFrmSaleForm.btnBeforeClick(Sender: TObject);
begin
  //inherited;
     if QryMain.Active then
      QryMain.Prior;
end;

procedure TFrmSaleForm.btnFirstClick(Sender: TObject);
begin
  //inherited;
    if QryMain.Active then
      QryMain.First;
end;

procedure TFrmSaleForm.cxGrid1DBTableView1ColNumGetDataText(
  Sender: TcxCustomGridTableItem; ARecordIndex: Integer;
  var AText: String);
 var
  recordcount:integer;
begin
    RecordCount := cxGrid1DBTableView1.ViewData.RecordCount;
    AText := Format('%.' + IntToStr(Length(IntToStr(RecordCount))) + 'd', [ARecordIndex + 1]);
end;

procedure TFrmSaleForm.TblDtlNewRecord(DataSet: TDataSet);
var
  storNo:String;
begin
  inherited;
      storNo:=GetSeqId('STROUT');
     TblDtl.FieldByName('SALE_NO').Value:=TblMain.FieldByName('ORDER_NO').Value;
     TblDtl.FieldByName('STOR_OUT_NO').Value:=storNo;
     TblDtl.FieldByName('ORDER_NUM').Value:=0;
     TblDtl.FieldByName('AMOUNT').Value:=0;
     TblDtl.FieldByName('SALE_PROFIT').Value:=0;
     TblDtl.FieldByName('INVOICE_NUM').Value:=0;
     TblDtl.FieldByName('ACT_AMOUNT').Value:=0;

end;
procedure TFrmSaleForm.cxGrid1DBTableView1MatCodePropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  inherited;
   QryMatCode.Locate('MAT_CODE', DisplayValue,[loCaseInsensitive, loPartialKey]);
  TblDtl.FieldByName('MAT_CODE').Value:=QryMatCode.fieldByName('MAT_CODE').Value;
  TblDtl.FieldByName('MAT_NAME').Value:=QryMatCode.fieldByName('MAT_NAME').AsString;
  TblDtl.FieldByName('MAT_GAUGE').Value:=QryMatCode.fieldByName('MAT_GAUGE').AsString;
  TblDtl.FieldByName('MAT_UNIT').Value:=QryMatCode.fieldByName('MAT_UNIT').AsString;
end;

procedure TFrmSaleForm.cxGrid1DBTableView1DblClick(Sender: TObject);
var
  rowNo:Integer;
  StorOutForm:TFrmStorOut;
  StorBatchOutForm:TFrmStorBatchOut;
   StorInfo:TStorInfo;
begin
  inherited;
  StorInfo:= TStorInfo.Create();
    //双击后弹出入库单录入界面      在OptionBehaviours里有个ImmiateEdit设置为False
 rowNo:=cxGrid1DBTableView1.DataController.GetSelectedRowIndex(0);
 if(rowNo<0) then
 begin
     Application.MessageBox('请选中某一行','提示信息',MB_OK);
 end;
  //Memo1.Lines.Clear;
  Memo1.Lines.Add('单据编号='+TblMain.FieldByName('ORDER_NO').Value);
  Memo1.Lines.Add('物料编号='+ VarToStr(cxGrid1DBTableView1.DataController.GetValue(rowNo,1)));
  Memo1.Lines.Add('物料名称='+ VarToStr(cxGrid1DBTableView1.DataController.GetValue(rowNo,2)));
  Memo1.Lines.Add('出入库编号='+VarToStr(cxGrid1DBTableView1.DataController.GetValue(rowNo,13)));
  Memo1.Lines.Add('单据类型=购货单');
  Memo1.Lines.Add('单据类型=0');
  Memo1.Lines.Add('单据数量='+VarToStr(cxGrid1DBTableView1.DataController.GetValue(rowNo,5)));
  StorInfo.FormNo:= TblMain.FieldByName('ORDER_NO').AsString;
  StorInfo.MatNo:= VarToStr(cxGrid1DBTableView1.DataController.GetValue(rowNo,1));
  StorInfo.MatName:= VarToStr(cxGrid1DBTableView1.DataController.GetValue(rowNo,2));
  StorInfo.StorNo:= VarToStr(cxGrid1DBTableView1.DataController.GetValue(rowNo,13));
  StorInfo.FormType:='销售单';
  StorInfo.StorNum:= StrToInt(VarToStr(cxGrid1DBTableView1.DataController.GetValue(rowNo,5)));
  StorInfo.MatType:=VarToStr(cxGrid1DBTableView1.DataController.GetValue(rowNo,12));
  if StorInfo.MatType='SN' then
  begin
    IF StorOutForm=nil then
    StorOutForm:=TFrmStorOut.create(self);

    StorOutForm.StorInfo:= StorInfo;
    StorOutForm.ShowModal;
    StorOutForm:=nil;
  end else
  begin
    IF StorBatchOutForm=nil then
    StorBatchOutForm:=TFrmStorBatchOut.create(self);

    StorBatchOutForm.StorInfo:= StorInfo;
    StorBatchOutForm.ShowModal;
    StorBatchOutForm:=nil;
  end;

  QryMain.RefreshRecord;
  TblMain.Refresh;
  TblDtl.Refresh;
  QryMain.Locate('ORDER_NO',StorInfo.FormNo,[]);

end;

procedure TFrmSaleForm.btnStorOutClick(Sender: TObject);
begin
  inherited;
 cxGrid1DBTableView1DblClick(sender);
end;

procedure TFrmSaleForm.btndeleteClick(Sender: TObject);
const delMainSql='delete from pur_sale_base where ORDER_NO=''%s'' ';
 delDtlSql='delete from pur_sale_dtl where SALE_NO=''%s'' ';
 delStorSql='delete from kc_stor_out where STOR_OUT_NO in (select STOR_OUT_NO from pur_sale_dtl where SALE_NO=''%s'') ';
 delStorBatchSql='delete from kc_storbatch_out where STOR_OUT_NO in (select STOR_OUT_NO from pur_sale_dtl where SALE_NO=''%s'') ';
var
  errMsg:String;
begin
  //inherited;
    if (MessageDlg('该笔销售单的所有数据都会清除,是否确定要删除?', mtWarning, [mbYes, mbNo], 0) = mrNo) then Exit;

      FConnection.StartTransaction;
    try
        with QryTemp do
        begin
           close;
           sql.Text:=format(delStorBatchSql,[cxDBTextOrderNo.Text]);
           Execute; 
        end;
        with QryTemp do
        begin
           close;
           sql.Text:=format(delStorSql,[cxDBTextOrderNo.Text]);
           Execute; 
        end;

         with QryTemp do
        begin
           close;
           sql.Text:=format(delDtlSql,[cxDBTextOrderNo.Text]);
           Execute; 
        end;

         with QryTemp do
        begin
           close;
           sql.Text:=format(delMainSql,[cxDBTextOrderNo.Text]);
           Execute; 
        end;
      FConnection.Commit;
    Except on e:Exception do
       begin
         FConnection.Rollback;
         errMsg:='删除异常,请重新尝试!'+e.Message;
         Application.MessageBox(PChar(errMsg),'提示信息',MB_OK);
         Exit;
       end;
    end;

   QryMain.Refresh;
end;

procedure TFrmSaleForm.btnModiClick(Sender: TObject);
begin
  inherited;
   QryMain.Refresh;
end;

procedure TFrmSaleForm.TblDtlAfterPost(DataSet: TDataSet);
const uptMainSql='UPDATE pur_sale_base SET amount=(SELECT SUM(amount) FROM pur_sale_dtl WHERE sale_no=''%s'' GROUP BY order_no) , '+
' PROFIT=(SELECT SUM(SALE_PROFIT) FROM pur_sale_dtl WHERE sale_no=''%s'' GROUP BY order_no) '
+' WHERE order_no=''%s'' ';
var
  totalNum:Integer;
  dynSql,saleNo:String;
begin
  inherited;
    saleNo:=TblMain.FieldByName('order_no').AsString;
  //提交后,计算总价
    dynSql:=format(uptMainSql,[saleNo,saleNo,saleNo]);
       // Memo1.Lines.Add(dynSql);
      with QryTemp do
     begin
        active:=false;
        Connection:=FConnection;
        sql.Text:=dynSql;
       // active:=true;
        Execute;
        TblMain.RefreshRecord;
     end;

end;

procedure TFrmSaleForm.TblDtlBeforePost(DataSet: TDataSet);
begin
  inherited;
      //提交之前,重新计算
      TblDtl.FieldByName('AMOUNT').Value:= TblDtl.FieldByName('SALE_PRICE').AsFloat* TblDtl.FieldByName('ORDER_NUM').AsFloat;
      TblDtl.FieldByName('SALE_PROFIT').Value:= (TblDtl.FieldByName('SALE_PRICE').AsFloat-TblDtl.FieldByName('STOR_PRICE').AsFloat)* TblDtl.FieldByName('ORDER_NUM').AsFloat;
end;

procedure TFrmSaleForm.TblDtlBeforeDelete(DataSet: TDataSet);
Const storInSql='select count(1) as num from kc_stor_out where STOR_OUT_NO=''%s'' ';
 delStorSql='delete from kc_stor_out where STOR_OUT_NO=''%s''';
  delStorBatchSql='delete from kc_storbatch_out where STOR_OUT_NO=''%s''';
var
 dnySql,strOutNo:String;
 row,col:Integer;
begin
  inherited;
   row:=cxGrid1DBTableView1.DataController.GetSelectedRowIndex(0);
   strOutNo:=VarToStr(cxGrid1DBTableView1.DataController.GetValue(row, 13));
  dnySql:=format(storInSql,[strOutNo]);
      with QryTemp do
      begin
          close;
          sql.Text:=dnySql;
          open;
          if fieldByName('num').AsInteger>=1 then
          begin
            //Application.MessageBox('请先清除出库单记录！','提示信息!',MB_OK);
            //abort;
             if (MessageDlg('存在的出库单记录会一块删除,是否确认?', mtWarning, [mbYes, mbNo], 0) = mrNo) then abort;
          end ELSE
          begin
              if (MessageDlg('是否确认删除?', mtWarning, [mbYes, mbNo], 0) = mrNo) then abort;
          end;
      end;
      with QryTemp do
      begin
          close;
          sql.Text:=format(delStorSql,[strOutNo]);
          execute; 
      end;
       with QryTemp do
      begin
          close;
          sql.Text:=format(delStorBatchSql,[strOutNo]);
          execute; 
      end;


end;

procedure TFrmSaleForm.btnSaveClick(Sender: TObject);
var
saleNo:String;
begin
 // saleNo:=cxDBTextOrderNo.Text;
   saleNo:=GetSeqId('S');
   TblMain.FieldByName('ORDER_NO').Value:=orderNo;
  inherited;
  QryMain.Refresh;
  QryMain.Locate('ORDER_NO',saleNo,[]);
end;

end.
