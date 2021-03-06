unit UOrderForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UBaseData, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxContainer, cxTextEdit, cxDBEdit,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  StdCtrls, MemDS, DBAccess, Uni, ImgList, ComCtrls, ToolWin, ExtCtrls,
  cxMaskEdit, cxDropDownEdit, UniProvider, MySQLUniProvider, cxCalendar,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxSplitter;

type
  TFrmOrderForm = class(TFrmData)
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxDBTextBankAcct: TcxDBTextEdit;
    cxDBTextEdit4: TcxDBTextEdit;
    Label9: TLabel;
    cxDBTextContact: TcxDBTextEdit;
    Label10: TLabel;
    PnlRight: TPanel;
    PnlData: TPanel;
    cxDBTextAddr: TcxDBTextEdit;
    cxDBTextTel: TcxDBTextEdit;
    cxDBTextInvoiceNum: TcxDBTextEdit;
    cxDBTextOrderNo: TcxDBTextEdit;
    cxGrid1DBTableView1ColNum: TcxGridDBColumn;
    cxGrid1DBTableView1MatCode: TcxGridDBColumn;
    cxGrid1DBTableView1MatName: TcxGridDBColumn;
    cxGrid1DBTableView1MatGauge: TcxGridDBColumn;
    cxGrid1DBTableView1MatUnit: TcxGridDBColumn;
    cxGrid1DBTableView1OrderNum: TcxGridDBColumn;
    cxGrid1DBTableView1Price: TcxGridDBColumn;
    cxGrid1DBTableView1Amount: TcxGridDBColumn;
    cxGrid1DBTableView1Memo: TcxGridDBColumn;
    PanelSearchTop: TPanel;
    cxGrid2DBTableView1: TcxGridDBTableView;
    cxGrid2Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    QryMain: TUniQuery;
    dsQryMain: TUniDataSource;
    cxGrid2DBTableView1OrderDate: TcxGridDBColumn;
    cxGrid2DBTableView1OrderNo: TcxGridDBColumn;
    cxGrid2DBTableView1SupCode: TcxGridDBColumn;
    cxGrid2DBTableView1SupName: TcxGridDBColumn;
    Label5: TLabel;
    cxTextSupName: TcxTextEdit;
    cxTextOrderNo: TcxTextEdit;
    Label6: TLabel;
    Label7: TLabel;
    cxDateOrderDateBegin: TcxDateEdit;
    cxDateOrderDateEnd: TcxDateEdit;
    Label8: TLabel;
    QrySupCode: TUniQuery;
    cxCmpSupCode: TcxLookupComboBox;
    dsQrySupCode: TUniDataSource;
    QryMainORDER_NO: TStringField;
    QryMainORDER_DATE: TDateField;
    QryMainSUP_CODE: TStringField;
    QryMainCOMP_NAME: TStringField;
    cxSplitter1: TcxSplitter;
    cxDBLookupSupCode: TcxDBLookupComboBox;
    Panel1: TPanel;
    cxDBDateEdit1: TcxDBDateEdit;
    DsQryMat: TUniDataSource;
    QryMatCode: TUniQuery;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    TblDtlORDER_NO: TStringField;
    TblDtlSTOR_IN_NO: TStringField;
    TblDtlMAT_CODE: TStringField;
    TblDtlMAT_NAME: TStringField;
    TblDtlMAT_UNIT: TStringField;
    TblDtlORDER_NUM: TFloatField;
    TblDtlPRICE: TFloatField;
    TblDtlAMOUNT: TFloatField;
    TblDtlMEMO: TStringField;
    Memo1: TMemo;
    BtnSN: TToolButton;
    cxGrid1DBTableView1StorInNo: TcxGridDBColumn;
    QryMatCodeMAT_CODE: TStringField;
    QryMatCodeMAT_NAME: TStringField;
    QryMatCodeMAT_GAUGE: TStringField;
    QryMatCodeMAT_UNIT: TStringField;
    QryMatCodeMAT_TYPE: TStringField;
    QryMatCodeMEMO: TStringField;
    TblDtlmatType: TStringField;
    cxGrid1DBTableView1matType: TcxGridDBColumn;
    TblDtlMAT_GAUGE: TStringField;
    QryTemp: TUniQuery;
    PnlLeft: TPanel;
    TblMainORDER_NO: TStringField;
    TblMainORDER_DATE: TDateField;
    TblMainSUP_CODE: TStringField;
    TblMainINVOICE_NUM: TStringField;
    TblMainAMOUNT: TFloatField;
    TblMainCOMP_ACCT: TStringField;
    TblMainADDRESS: TStringField;
    TblMainTEL: TStringField;
    TblMainCONTACT: TStringField;
    TblMainINSERT_TIME: TDateTimeField;
    TblMainLAST_UPT_TIME: TDateTimeField;
    TblMainMEMO: TStringField;
    TblMainSUP_NAME: TStringField;
    cxDBTextCompName: TcxDBTextEdit;
    procedure cxGrid1DBTableView1ColNumGetDataText(
      Sender: TcxCustomGridTableItem; ARecordIndex: Integer;
      var AText: String);
    procedure btnserchClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TblMainNewRecord(DataSet: TDataSet);
    procedure cxCmpSupCodePropertiesCloseUp(Sender: TObject);
    procedure cxCmpSupCodePropertiesChange(Sender: TObject);
    procedure cxDBLookupSupCodePropertiesCloseUp(Sender: TObject);
    procedure TblDtlNewRecord(DataSet: TDataSet);
    procedure cxGrid1DBTableView1MatCodePropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    procedure BtnSNClick(Sender: TObject);
    procedure btnFirstClick(Sender: TObject);
    procedure btnBeforeClick(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure btnLastClick(Sender: TObject);
    procedure btndeleteClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure TblDtlAfterPost(DataSet: TDataSet);
    procedure TblDtlPRICEChange(Sender: TField);
    procedure TblDtlBeforePost(DataSet: TDataSet);
    procedure TblDtlBeforeDelete(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmOrderForm: TFrmOrderForm;
implementation

uses UCommonUtil, UStorManage, ULoginUser;

{$R *.dfm}

procedure TFrmOrderForm.cxGrid1DBTableView1ColNumGetDataText(
  Sender: TcxCustomGridTableItem; ARecordIndex: Integer;
  var AText: String);
 var
  recordcount:integer;
begin
    RecordCount := cxGrid1DBTableView1.ViewData.RecordCount;
    AText := Format('%.' + IntToStr(Length(IntToStr(RecordCount))) + 'd', [ARecordIndex + 1]);
end;

procedure TFrmOrderForm.btnserchClick(Sender: TObject);
Const qrySql='select a.order_no,a.order_date,a.sup_code,b.comp_name  '+
 ' from pur_order_base a left join  kc_comp_base b on a.sup_code=b.comp_no where 1=1 ';
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
     filterStr:=filterStr+' and a.SUP_CODE ='+QuotedStr(SupCode);
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

procedure TFrmOrderForm.FormCreate(Sender: TObject);
begin
  inherited;
   cxDateOrderDateBegin.Text:=FormatDateTime('YYYY/MM/DD',now-15);
   cxDateOrderDateEnd.Text:=FormatDateTime('YYYY/MM/DD',now+7);
   QryMain.Connection:=FConnection;
   QryMatCode.Connection:=FConnection;
   QrySupCode.Connection:=FConnection;
   QrySupCode.Active:=true;
   QryTemp.Connection:=FConnection;
   btnserch.Click();
   cxSplitter1.CloseSplitter;
end;

procedure TFrmOrderForm.TblMainNewRecord(DataSet: TDataSet);
var
  orderNo:String;
begin
  inherited;  
   orderNo:=GetSeqId('p');
   TblMain.FieldByName('ORDER_NO').Value:=orderNo;
   cxDBTextOrderNo.Text:=orderNo;
  //  QryMain.Locate('ORDER_NO',orderNo,[loCaseInsensitive, loPartialKey]);

end;

procedure TFrmOrderForm.cxCmpSupCodePropertiesCloseUp(Sender: TObject);
begin
  inherited;
   QrySupCode.Locate('COMP_NO',cxCmpSupCode.Text,[]);
   cxTextSupName.Text:=QrySupCode.fieldByName('COMP_NAME').AsString;;
end;

procedure TFrmOrderForm.cxCmpSupCodePropertiesChange(Sender: TObject);
begin
  inherited;
   IF cxCmpSupCode.Text='' THEN
   cxTextSupName.Text:='';
end;

procedure TFrmOrderForm.cxDBLookupSupCodePropertiesCloseUp(
  Sender: TObject);
begin
  inherited;
  QrySupCode.Locate('COMP_NO',cxDBLookupSupCode.Text,[loCaseInsensitive, loPartialKey]);
  TblMain.FieldByName('SUP_CODE').Value:=QrySupCode.fieldByName('COMP_NO').Value;
  TblMain.FieldByName('COMP_ACCT').Value:=QrySupCode.fieldByName('COMP_ACCT').AsString;
  TblMain.FieldByName('CONTACT').Value:=QrySupCode.fieldByName('CONTACT').AsString;
  TblMain.FieldByName('TEL').Value:=QrySupCode.fieldByName('TEL').AsString;
  TblMain.FieldByName('ADDRESS').Value:=QrySupCode.fieldByName('ADDRESS').AsString;
end;

procedure TFrmOrderForm.TblDtlNewRecord(DataSet: TDataSet);
var
  storNo:String;
begin
  inherited;
      storNo:=GetSeqId('STRIN');
     TblDtl.FieldByName('ORDER_NO').Value:=TblMain.FieldByName('ORDER_NO').Value;
     TblDtl.FieldByName('STOR_IN_NO').Value:=storNo;
     TblDtl.FieldByName('ORDER_NUM').Value:=0;
     TblDtl.FieldByName('AMOUNT').Value:=0;
end;

procedure TFrmOrderForm.cxGrid1DBTableView1MatCodePropertiesValidate(
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

procedure TFrmOrderForm.cxGrid1DBTableView1DblClick(Sender: TObject);
var
  rowNo:Integer;
  StorManageForm:TFrmStorManage;
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
  Memo1.Lines.Add('出入库编号='+VarToStr(cxGrid1DBTableView1.DataController.GetValue(rowNo,9)));
  Memo1.Lines.Add('单据类型=购货单');
  Memo1.Lines.Add('单据类型=0');
  Memo1.Lines.Add('单据数量='+VarToStr(cxGrid1DBTableView1.DataController.GetValue(rowNo,5)));
  StorInfo.FormNo:= TblMain.FieldByName('ORDER_NO').AsString;
  StorInfo.MatNo:= VarToStr(cxGrid1DBTableView1.DataController.GetValue(rowNo,1));
  StorInfo.MatName:= VarToStr(cxGrid1DBTableView1.DataController.GetValue(rowNo,2));
  StorInfo.StorNo:= VarToStr(cxGrid1DBTableView1.DataController.GetValue(rowNo,9));
  StorInfo.FormType:='购货单';
  StorInfo.StorNum:= StrToInt(VarToStr(cxGrid1DBTableView1.DataController.GetValue(rowNo,5)));
  StorInfo.MatType:=VarToStr(cxGrid1DBTableView1.DataController.GetValue(rowNo,10));

  IF StorManageForm=nil then
  StorManageForm:=TFrmStorManage.create(self);

  StorManageForm.StorInfo:= StorInfo;
  StorManageForm.ShowModal;
  StorManageForm:=nil;

  QryMain.RefreshRecord;
  TblMain.Refresh;
  TblDtl.Refresh;
  QryMain.Locate('ORDER_NO',StorInfo.FormNo,[]);

end;

procedure TFrmOrderForm.BtnSNClick(Sender: TObject);
begin
  inherited;
     cxGrid1DBTableView1DblClick(sender);
end;

procedure TFrmOrderForm.btnFirstClick(Sender: TObject);
begin
 // inherited;
   if QryMain.Active then
      QryMain.First;
end;

procedure TFrmOrderForm.btnBeforeClick(Sender: TObject);
begin
  //inherited;
    if QryMain.Active then
      QryMain.Prior;
end;

procedure TFrmOrderForm.btnNextClick(Sender: TObject);
begin
  //inherited;
    if QryMain.Active then
      QryMain.Next;
end;

procedure TFrmOrderForm.btnLastClick(Sender: TObject);
begin
 // inherited;
     if QryMain.Active then
      QryMain.Last;
end;

procedure TFrmOrderForm.btndeleteClick(Sender: TObject);
const delMainSql='delete from pur_order_base where ORDER_NO=''%s'' ';
 delDtlSql='delete from pur_order_dtl where ORDER_NO=''%s'' ';
 delStorSql='delete from kc_stor_in where STOR_IN_NO in (select STOR_IN_NO from pur_order_dtl where ORDER_NO=''%s'') ';
 selSaleSql='  SELECT COUNT(1) AS num FROM   (SELECT a.STOR_IN_NO FROM pur_order_dtl a '+
            ' JOIN kc_stor_in b ON a.STOR_IN_NO=b.STOR_IN_NO AND a.ORDER_NO=''%s'' ) AS c  '+
            ' JOIN kc_stor_out d ON c.STOR_IN_NO=d.STOR_IN_NO  ' ;
begin
  //inherited;
    if FConnection.Connected = false then Exit;
    with QryTemp do
    begin
       close;
       sql.Text:=format(selSaleSql,[cxDBTextOrderNo.Text]);
       open;
       if QryTemp.FieldByName('num').AsInteger>=1 then
       begin
          Application.MessageBox('存在销售单数据,请先清除后再删除购货单!','提示信息',MB_OK);
          Exit;
       end;
    end;

    if (MessageDlg('该笔购货单的所有入库都会清除,是否确定要删除?', mtWarning, [mbYes, mbNo], 0) = mrNo) then Exit;

      FConnection.StartTransaction;
    try
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
         Application.MessageBox('删除异常,请重新尝试!','提示信息',MB_OK);
         Exit;
       end;
    end;


  QryMain.Refresh;
end;

procedure TFrmOrderForm.btnSaveClick(Sender: TObject);
var
  orderNo:String;
begin
   orderNo:=cxDBTextOrderNo.Text;
   if (TblMain.State in [dsInsert]) then
    begin
      orderNo:=GetSeqId('p');
    end;
   TblMain.FieldByName('ORDER_NO').Value:=orderNo;
  inherited;
  
  QryMain.Refresh;
  QryMain.Locate('ORDER_NO',orderNo,[]);
end;

procedure TFrmOrderForm.TblDtlAfterPost(DataSet: TDataSet);
const uptMainSql='UPDATE pur_order_base SET amount=(SELECT SUM(amount) FROM pur_order_dtl WHERE order_no=''%s'' GROUP BY order_no) WHERE order_no=''%s'' ';
var
  totalNum:Integer;
  dynSql:String;
begin
  inherited;

  //提交后,计算总价


    dynSql:=format(uptMainSql,[TblMain.FieldByName('order_no').AsString,TblMain.FieldByName('order_no').AsString]);
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

procedure TFrmOrderForm.TblDtlPRICEChange(Sender: TField);
begin
  inherited;
   //提交后

end;

procedure TFrmOrderForm.TblDtlBeforePost(DataSet: TDataSet);

begin
  inherited;
      //提交之前,重新计算
   TblDtl.FieldByName('AMOUNT').Value:= TblDtl.FieldByName('PRICE').AsFloat* TblDtl.FieldByName('ORDER_NUM').AsFloat;

end;

procedure TFrmOrderForm.TblDtlBeforeDelete(DataSet: TDataSet);
Const storInSql='select count(1) as num from kc_stor_in where STOR_IN_NO=''%s'' ';
 delStorSql='delete from kc_stor_in where STOR_IN_NO=''%s''';
var
 dnySql,strInNo:String;
 row,col:Integer;
begin
  inherited;
   row:=cxGrid1DBTableView1.DataController.GetSelectedRowIndex(0);
   strInNo:=VarToStr(cxGrid1DBTableView1.DataController.GetValue(row, 9));
    dnySql:=format(storInSql,[strInNo]);
      with QryTemp do
      begin
          close;
          sql.Text:=dnySql;
          open;
          if fieldByName('num').AsInteger>=1 then
          begin
            //Application.MessageBox('请先清除入库单记录！','提示信息!',MB_OK);
           // abort;
             if (MessageDlg('存在的入库单记录会一块删除,是否确认?', mtWarning, [mbYes, mbNo], 0) = mrNo) then abort;
          end ELSE
          begin
              if (MessageDlg('是否确认删除?', mtWarning, [mbYes, mbNo], 0) = mrNo) then abort;
          end;
      end;


      with QryTemp do
      begin
          close;
          sql.Text:=format(delStorSql,[strInNo]);
          execute; 
      end;
end;

end.
