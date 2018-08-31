unit UStorManage;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UBaseForm, DB, MemDS, DBAccess, Uni, ImgList, ComCtrls, ToolWin,
  ExtCtrls, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, cxDBData, cxContainer, cxTextEdit, StdCtrls,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  cxSplitter, UniProvider, MySQLUniProvider, cxCalendar,ULoginUser,
  cxCheckBox, cxMaskEdit, cxDropDownEdit,MMSystem,UCommonUtil,comObj;

type
  TFrmStorManage = class(TFrmBase)
    Panel1: TPanel;
    Panel2: TPanel;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    Label1: TLabel;
    cxTextFormType: TcxTextEdit;
    cxTextFormNo: TcxTextEdit;
    cxTextMatCode: TcxTextEdit;
    cxTextTotalNum: TcxTextEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    cxTextMatName: TcxTextEdit;
    Label5: TLabel;
    cxGrid1DBTableView1Column1: TcxGridDBColumn;
    cxGrid1DBTableView1BSNO: TcxGridDBColumn;
    cxGrid1DBTableView1ValDate: TcxGridDBColumn;
    cxGrid1DBTableView1Memo: TcxGridDBColumn;
    Panel4: TPanel;
    cxGrid1DBTableView1Degree: TcxGridDBColumn;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxGrid1DBTableView1Num: TcxGridDBColumn;
    QryTemp: TUniQuery;
    cxTextDegree: TcxTextEdit;
    cxTextSN: TcxTextEdit;
    LablDegree: TLabel;
    LablSN: TLabel;
    LablValDate: TLabel;
    cxDateVal: TcxDateEdit;
    cxCheckBox1: TcxCheckBox;
    cxCheckBox2: TcxCheckBox;
    QryMatInfo: TUniQuery;
    cxGrid1DBTableView1Column2: TcxGridDBColumn;
    procedure FormShow(Sender: TObject);
    procedure TblMainNewRecord(DataSet: TDataSet);
    procedure cxGrid1DBTableView1Column1GetDataText(
      Sender: TcxCustomGridTableItem; ARecordIndex: Integer;
      var AText: String);
    procedure cxGrid2DBTableView1ColNumGetDataText(
      Sender: TcxCustomGridTableItem; ARecordIndex: Integer;
      var AText: String);
    procedure TblMainAfterPost(DataSet: TDataSet);
    procedure cxTextSNKeyPress(Sender: TObject; var Key: Char);
    procedure btnExportClick(Sender: TObject);
    procedure TblMainAfterDelete(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure TblMainBeforeDelete(DataSet: TDataSet);
  private
    { Private declarations }
     _storInfo:TStorInfo;
  public
    { Public declarations }
   published
       property StorInfo:TStorInfo   read _storInfo write _storInfo;
  end;

var
  FrmStorManage: TFrmStorManage;

implementation



{$R *.dfm}

procedure TFrmStorManage.FormShow(Sender: TObject);
var
 filterStr:String;
begin
  inherited;
    cxTextFormType.Text:=StorInfo.FormType;
    cxTextFormNo.Text:=StorInfo.FormNo;
    cxTextMatCode.Text:=StorInfo.MatNo;
    cxTextMatName.Text:=StorInfo.MatName;
    cxTextTotalNum.Text:=inttostr(StorInfo.StorNum);

      if StorInfo.MatType='SN' then    //SN号录入
      begin
        cxGrid1DBTableView1Degree.Visible:=true;
        cxGrid1DBTableView1BSNO.Caption:='SN号';
        cxGrid1DBTableView1Num.Visible:=false;
         cxTextDegree.Visible:=true;
         LablDegree.Visible:=true;
         LablSN.Caption:='SN';
      end else if StorInfo.MatType='批号' then      //批号录入
      begin
         cxGrid1DBTableView1Degree.Visible:=false;
         cxGrid1DBTableView1BSNO.Caption:='批号';
         cxGrid1DBTableView1Num.Visible:=true;
         cxTextDegree.Visible:=false;
         LablDegree.Visible:=false;
         LablSN.Caption:='批号';
      end;

    filterStr:=' 1=1 ';
    filterStr:=filterStr+' and STOR_IN_NO='+QuotedStr(StorInfo.StorNo);
    filterStr:=filterStr+' and MAT_CODE='+QuotedStr(StorInfo.MatNo);

     with TblMain do
     begin
       active:=False;
       Filtered:=false;
       Filter:=filterStr;
       Filtered:=true;
       active:=true;
     end;
end;

procedure TFrmStorManage.TblMainNewRecord(DataSet: TDataSet);
begin
  inherited;
   TblMain.FieldByName('STOR_IN_NO').Value:=StorInfo.StorNo;
   TblMain.FieldByName('MAT_CODE').Value:=StorInfo.MatNo;
   TblMain.FieldByName('IN_NUM').Value:=1;
   with QryMatInfo do
   begin
      close;
      QryMatInfo.ParamByName('matCode').Value:=StorInfo.MatNo;
      open;
       TblMain.FieldByName('MAT_NAME').Value:=QryMatInfo.fieldByName('MAT_NAME').value;
       TblMain.FieldByName('MAT_GAUGE').Value:=QryMatInfo.fieldByName('MAT_GAUGE').value;
       TblMain.FieldByName('MAT_UNIT').Value:=QryMatInfo.fieldByName('MAT_UNIT').value;
   end;
end;

procedure TFrmStorManage.cxGrid1DBTableView1Column1GetDataText(
  Sender: TcxCustomGridTableItem; ARecordIndex: Integer;
  var AText: String);
 var
  recordcount:integer;
begin
    RecordCount := cxGrid1DBTableView1.ViewData.RecordCount;
    AText := Format('%.' + IntToStr(Length(IntToStr(RecordCount))) + 'd', [ARecordIndex + 1]);
end;

procedure TFrmStorManage.cxGrid2DBTableView1ColNumGetDataText(
  Sender: TcxCustomGridTableItem; ARecordIndex: Integer;
  var AText: String);
 var
  recordcount:integer;
begin
    RecordCount := cxGrid1DBTableView1.ViewData.RecordCount;
    AText := Format('%.' + IntToStr(Length(IntToStr(RecordCount))) + 'd', [ARecordIndex + 1]);
end;

procedure TFrmStorManage.TblMainAfterPost(DataSet: TDataSet);
const qryNumSql='select sum(in_num) as num from kc_stor_in WHERE stor_in_no=''%s'' AND mat_code=''%s'' ';
const uptDtlSql='UPDATE pur_order_dtl SET order_num=%d,amount=%d*price WHERE stor_in_no=''%s'' AND mat_code=''%s'' ';
const uptMainSql='UPDATE pur_order_base SET amount=(SELECT SUM(amount) FROM pur_order_dtl WHERE order_no=''%s'' GROUP BY order_no) WHERE order_no=''%s'' ';
var
  totalNum:Integer;
  dynSql:String;
begin
  inherited;
   dynSql:=format(qryNumSql,[StorInfo.StorNo,StorInfo.MatNo]);
     with QryTemp do
     begin
        active:=false;
        Connection:=FConnection;
        sql.Text:=dynSql;
        Execute;
        totalNum:=QryTemp.fieldByName('num').AsInteger;
     end;


   cxTextTotalNum.Text:=inttostr(totalNum);
   try
     FConnection.StartTransaction;
       dynSql:=format(uptDtlSql,[totalNum,totalNum,StorInfo.StorNo,StorInfo.MatNo]);
      // Memo1.Lines.Add(dynSql);
     with QryTemp do
     begin
        active:=false;
        Connection:=FConnection;
        sql.Text:=dynSql;
        //active:=true;
        Execute;
     end;
        dynSql:=format(uptMainSql,[StorInfo.FormNo,StorInfo.FormNo]);
       // Memo1.Lines.Add(dynSql);
      with QryTemp do
     begin
        active:=false;
        Connection:=FConnection;
        sql.Text:=dynSql;
       // active:=true;
        Execute;
     end;

     FConnection.Commit;
   Except
      FConnection.Rollback;       
   end;
   //TblMain.Insert;
end;

procedure TFrmStorManage.cxTextSNKeyPress(Sender: TObject; var Key: Char);
const qrySql=' SELECT b.* FROM pur_order_dtl a JOIN pur_order_base b ON a.ORDER_NO=b.ORDER_NO   '+
' JOIN kc_stor_in c ON a.STOR_IN_NO=c.STOR_IN_NO and  BSN_NO =''%s''  ';
var
  degreeNum,errMessage:String;
  valDate:TDate;
begin
  inherited;
    if Key=#13 then
    begin
        if StorInfo.MatType='SN' then
         begin
             //判断度数
            {  if cxTextDegree.Text='' then
             begin
               PlaySound(PChar('wrong.wav'),0, SND_ASYNC);
               Application.MessageBox('默认度数尚未输入!','提示信息',MB_OK);
                cxTextSN.Text:='';
                Exit;
             end;}

              with QryTemp do
           begin
              active:=false;
              Connection:=FConnection;
              sql.Text:=format(qrySql,[cxTextSN.Text]);
             // active:=true;
              open;
              if QryTemp.RecordCount>=1 then
              begin
                  errMessage:= '该SN已经入库入库单号=['+QryTemp.fieldByName('ORDER_NO').asString+'],是否确定再次入库?';
                //  Application.MessageBox(Pchar(errMessage),'提示信息',MB_OK);
                 if (MessageDlg(Pchar(errMessage), mtWarning, [mbYes, mbNo], 0) = mrNo) then Exit;
              end;
           end; 

             
         end;

          //判断SN或批号
             if cxTextSN.Text='' then
             begin
              // PlaySound(PChar('wrong.wav'),0, SND_ASYNC);
               Application.MessageBox('SN/批号输入为空!','提示信息',MB_OK);
                cxTextSN.Text:='';
                Exit;
             end;


            with QryTemp do
           begin
              active:=false;
              Connection:=FConnection;
              sql.Text:='select * from kc_stor_in where 1=1 and stor_in_no='+QuotedStr(StorInfo.StorNo) +' and  bsn_no ='+QuotedStr(cxTextSN.Text);
             // active:=true;
              open;
              if QryTemp.RecordCount>=1 then
              begin
                 cxTextSN.Text:='';
                // PlaySound(PChar('wrong.wav'),0, SND_ASYNC);
                  Application.MessageBox('本笔入库单里该SN/批号已经入库,无需操作!','提示信息',MB_OK);
                 Exit;
              end;
           end; 


         //入库操作
         try
           with TblMain do
           begin
              // Connection:=FConnection;
              append;
               if (cxTextDegree.Text<>'') then 
               TblMain.FieldByName('DEGREE').Value:=cxTextDegree.Text;
               if (cxDateVal.Text<>'' )  then
              TblMain.FieldByName('VALIDATE_DATE').Value:=cxDateVal.Date;
              TblMain.FieldByName('BSN_NO').Value:=cxTextSN.Text;
              post;
           end;
           cxTextSN.Text:='';
           //PlaySound(PChar('right.wav'),0, SND_ASYNC);
         Except on e:Exception do
            begin
              cxTextSN.Text:='';
              //PlaySound(PChar('wrong.wav'),0, SND_ASYNC);
              showmessage(e.message);
              Exit;
            end;
         end;
    end;

end;

     //ExportCxGrid1(cxGrid1);
procedure TFrmStorManage.btnExportClick(Sender: TObject);
const qryDtlSql='select * from kc_stor_in where stor_in_no=''%s'' ' ;
var
 saleNo,dynSql,fileName:String;
 appExcel:Variant;
 m,n,i:Integer;
begin
  inherited;
  ExportCxGrid1(cxGrid1);

//导出Excel   购货单据
  {  dynSql:=format(qryDtlSql,[StorInfo.StorNo]);
    with qryTemp do
    begin
      close;
       Connection:=FConnection;
      sql.Text:=dynSql;
      open;
      if qryTemp.RecordCount<=0 then
      begin
        Application.MessageBox('尚未录入数据!','提示信息',MB_OK);
        Exit;
      end;
   end;


   if not  dlgSave1.Execute then
      Exit;
   fileName:= dlgSave1.FileName;


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
        appExcel.ActiveSheet.Rows[1].Font.Name := '宋体';
        appExcel.ActiveSheet.Rows[1].Font.Size:=10;
        appExcel.ActiveSheet.Rows[1].HorizontalAlignment := -4108; // xlCenter

        appExcel.ActiveSheet.Rows[2].Font.Name := '宋体';
        appExcel.ActiveSheet.Rows[2].Font.Size:=10;
         appExcel.ActiveSheet.Rows[2].HorizontalAlignment := -4108; // xlCenter

        appExcel.cells[1, 1]:= '单据类型';
        appExcel.cells[1, 2]:= '单据编号';
        appExcel.cells[1, 3]:= '商品代码';
        appExcel.cells[1, 4]:= '商品名称';
        if StorInfo.MatType='批号' then
        begin
        appExcel.cells[1, 5]:= '批号';
        appExcel.cells[1, 6]:= '有效期';
        appExcel.cells[1, 7]:= '数量';
        end else
        begin
        appExcel.cells[1, 5]:= 'S/N号';
        appExcel.cells[1, 6]:= '有效期';
        appExcel.cells[1, 7]:= '度数';
        end;
        appExcel.cells[2, 1]:= StorInfo.FormType;
        appExcel.cells[2, 2]:= StorInfo.FormNo;
        appExcel.cells[2, 3]:= StorInfo.MatNo;
        appExcel.cells[2, 4]:= StorInfo.MatName; 
        m:= 2;
        n:= 2;
        i:=2;
        qryTemp.First;
       while not qryTemp.Eof do
        begin
             appExcel.ActiveSheet.Rows[i].Font.Name := '宋体';
              appExcel.ActiveSheet.Rows[i].Font.Size:=10;
             appExcel.ActiveSheet.Rows[i].HorizontalAlignment := -4108; // xlCenter

            if StorInfo.MatType='批号' then
            begin   
                appExcel.cells[m, 5]:= ''''+qryTemp.FieldByName('BSN_NO').AsString;
                appExcel.cells[m, 6]:= qryTemp.FieldByName('VALIDATE_DATE').AsString;
                appExcel.cells[m, 7]:= qryTemp.FieldByName('IN_NUM').AsString;
                inc(m);
            end else
            begin
                appExcel.cells[n, 5]:= ''''+qryTemp.FieldByName('BSN_NO').AsString;
                appExcel.cells[n, 6]:= qryTemp.FieldByName('VALIDATE_DATE').AsString;
                appExcel.cells[n, 7]:= qryTemp.FieldByName('DEGREE').AsString;
                inc(n);
            end;
            inc(i);
           Application.ProcessMessages;
          qryTemp.Next;
        end;
        // appExcel.Activeworkbook.saveas(FileName);
        appExcel.ActiveSheet.Range[ 'A1:G'+inttostr(i)].Borders[1].Weight := 2;
        appExcel.ActiveSheet.Range[ 'A1:G'+inttostr(i)].Borders[2].Weight := 2;
        appExcel.ActiveSheet.Range[ 'A1:G'+inttostr(i)].Borders[3].Weight := 2;
        appExcel.ActiveSheet.Range[ 'A1:G'+inttostr(i)].Borders[4].Weight := 2;
         //1-左     2-右    3-顶     4-底    5-斜( / )      6-斜( / )

         appExcel.Columns.AutoFit;
        // appExcel.visible:= true;
         appExcel.Activeworkbook.saveas(fileName);
         appExcel.Quit;
         appExcel := Unassigned;
      except
        on E: Exception do
        begin
          appExcel.Quit;
         appExcel := Unassigned;
          raise Exception.Create(E.Message);
        end;
      end;   }

end;

procedure TFrmStorManage.TblMainAfterDelete(DataSet: TDataSet);
begin
  inherited;
    TblMainAfterPost(DataSet);
end;

procedure TFrmStorManage.FormCreate(Sender: TObject);
begin
  inherited;
   QryTemp.Connection:=FConnection;
   QryMatInfo.Connection:=FConnection;
end;

procedure TFrmStorManage.TblMainBeforeDelete(DataSet: TDataSet);
Const storInSql='select count(1) as num from kc_stor_out where BSN_NO=''%s'' and STOR_IN_NO=''%s'' ';
var
 dnySql,bsNo,strInNo:String;
 row,col:Integer;
begin
  inherited;
   row:=cxGrid1DBTableView1.DataController.GetSelectedRowIndex(0);
   bsNo:=VarToStr(cxGrid1DBTableView1.DataController.GetValue(row, 2));
   strInNo:=VarToStr(cxGrid1DBTableView1.DataController.GetValue(row, 6));
  dnySql:=format(storInSql,[bsNo,strInNo]);
      with QryTemp do
      begin
          close;
          sql.Text:=dnySql;
          open;
          if fieldByName('num').AsInteger>=1 then
          begin
            Application.MessageBox('已经存在出库单记录，不允许删除！','提示信息!',MB_OK);
            abort;
          end;
      end;
end;

end.
