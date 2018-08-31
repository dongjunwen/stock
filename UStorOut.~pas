unit UStorOut;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UBaseForm, DB, MemDS, DBAccess, Uni, ImgList, ComCtrls, ToolWin,
  ExtCtrls, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, cxDBData, cxCalendar, cxSplitter, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, cxCheckBox, cxMaskEdit,
  cxDropDownEdit, cxContainer, cxTextEdit, StdCtrls, UniProvider,
  MySQLUniProvider,ULoginUser,MMSystem,ComObj, OleServer, ExcelXP;

type
  TFrmStorOut = class(TFrmBase)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    LablSN: TLabel;
    cxTextFormType: TcxTextEdit;
    cxTextFormNo: TcxTextEdit;
    cxTextMatCode: TcxTextEdit;
    cxTextTotalNum: TcxTextEdit;
    cxTextMatName: TcxTextEdit;
    cxTextSN: TcxTextEdit;
    cxCheckBox1: TcxCheckBox;
    cxCheckBox2: TcxCheckBox;
    Panel2: TPanel;
    Panel4: TPanel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1Column1: TcxGridDBColumn;
    cxGrid1DBTableView1Degree: TcxGridDBColumn;
    cxGrid1DBTableView1BSNO: TcxGridDBColumn;
    cxGrid1DBTableView1ValDate: TcxGridDBColumn;
    cxGrid1DBTableView1Num: TcxGridDBColumn;
    cxGrid1DBTableView1Memo: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    QryTemp: TUniQuery;
    QryStorIn: TUniQuery;
    QryMatInfo: TUniQuery;
    Memo1: TMemo;
    OpenDialog1: TOpenDialog;
    TblMainSTOR_OUT_NO: TStringField;
    TblMainBSN_NO: TStringField;
    TblMainSTOR_IN_NO: TStringField;
    TblMainMAT_CODE: TStringField;
    TblMainMAT_NAME: TStringField;
    TblMainMAT_GAUGE: TStringField;
    TblMainMAT_UNIT: TStringField;
    TblMainOUT_NUM: TFloatField;
    TblMainDEGREE: TFloatField;
    TblMainVALIDATE_DATE: TDateTimeField;
    TblMainMEMO: TStringField;
    ExcelApp: TExcelApplication;
    procedure cxGrid1DBTableView1Column1GetDataText(
      Sender: TcxCustomGridTableItem; ARecordIndex: Integer;
      var AText: String);
    procedure FormShow(Sender: TObject);
    procedure TblMainNewRecord(DataSet: TDataSet);
    procedure TblMainBeforePost(DataSet: TDataSet);
    procedure TblMainAfterPost(DataSet: TDataSet);
    procedure btnExportClick(Sender: TObject);
    procedure TblMainAfterDelete(DataSet: TDataSet);
    procedure cxTextSNKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure btnImportClick(Sender: TObject);
   private
    { Private declarations }
     _storInfo:TStorInfo;
  public
    { Public declarations }
   published
       property StorInfo:TStorInfo   read _storInfo write _storInfo;
  end;

var
  FrmStorOut: TFrmStorOut;

implementation



{$R *.dfm}

procedure TFrmStorOut.cxGrid1DBTableView1Column1GetDataText(
  Sender: TcxCustomGridTableItem; ARecordIndex: Integer;
  var AText: String);
 var
  recordcount:integer;
begin
    RecordCount := cxGrid1DBTableView1.ViewData.RecordCount;
    AText := Format('%.' + IntToStr(Length(IntToStr(RecordCount))) + 'd', [ARecordIndex + 1]);
end;

procedure TFrmStorOut.FormShow(Sender: TObject);
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
         LablSN.Caption:='SN';
          cxGrid1DBTableView1Num.Visible:=false;
      end else if StorInfo.MatType='批号' then      //批号录入
      begin
         cxGrid1DBTableView1Degree.Visible:=false;
         cxGrid1DBTableView1BSNO.Caption:='批号';
         LablSN.Caption:='批号';
          cxGrid1DBTableView1Num.Visible:=true;
      end;



    filterStr:=' 1=1 ';
    filterStr:=filterStr+' and STOR_OUT_NO='+QuotedStr(StorInfo.StorNo);
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

procedure TFrmStorOut.TblMainNewRecord(DataSet: TDataSet);
begin
  inherited;
   TblMain.FieldByName('STOR_OUT_NO').Value:=StorInfo.StorNo;
   TblMain.FieldByName('MAT_CODE').Value:=StorInfo.MatNo;
   TblMain.FieldByName('OUT_NUM').Value:=1;

   with QryMatInfo do
   begin
      close;
      QryMatInfo.ParamByName('matCode').Value:= StorInfo.MatNo;
      open;
      QryMatInfo.First;
       TblMain.FieldByName('MAT_NAME').Value:=QryMatInfo.fieldByName('MAT_NAME').value;
       TblMain.FieldByName('MAT_GAUGE').Value:=QryMatInfo.fieldByName('MAT_GAUGE').value;
       TblMain.FieldByName('MAT_UNIT').Value:=QryMatInfo.fieldByName('MAT_UNIT').value;
   end;



end;

procedure TFrmStorOut.TblMainBeforePost(DataSet: TDataSet);
var
 bsNo,strOutNo,ErrMsg,strInNo:String;
 inNum,outNum,actNum:Integer;
begin
  inherited;
  bsNo:= TblMain.fieldbyName('BSN_NO').AsString;
  strOutNo:=TblMain.FieldByName('STOR_OUT_NO').AsString;
  strInNo:=TblMain.FieldByName('STOR_IN_NO').AsString;
   with QryTemp do
   begin
      active:=false;
      Connection:=FConnection;
      sql.Text:='select * from v_act_stor where BSN_NO ='+QuotedStr(bsNo) +' and MAT_CODE='+QuotedStr(StorInfo.MatNo);
     // active:=true;
      Memo1.Lines.Add('sql=['+ sql.Text+']');
      Execute;
       if QryTemp.RecordCount<=0 then
      begin
         cxTextSN.Text:='';
         // PlaySound(PChar('wrong.wav'),0, SND_ASYNC);
           Application.MessageBox('请先入库,再出库！','警告信息!',MB_OK);
         abort;
      end;
      sql.Text:='select * from v_act_stor where BSN_NO ='+QuotedStr(bsNo) +' and MAT_CODE='+QuotedStr(StorInfo.MatNo)+' and act_num>=1 limit 0,1';
     // active:=true;
      Memo1.Lines.Add('sql=['+ sql.Text+']');
      Execute;
      actNum:=QryTemp.fieldbyName('act_num').AsInteger;
      Memo1.Lines.Add('剩余库存=['+inttostr(actNum)+']');
      if actNum<=0 then
      begin
         // PlaySound(PChar('wrong.wav'),0, SND_ASYNC);
        // Application.MessageBox('库存不足,不能继续操作!','警告信息!',MB_OK);
        // abort;
      end; 
      if(strInNo='') then
      begin
         strInNo:=QryTemp.fieldbyName('stor_in_no').AsString;
          with QryTemp do
         begin
            active:=false;
            Connection:=FConnection;
            sql.Text:='select count(1) as count_num from kc_stor_out where BSN_NO ='+QuotedStr(bsNo)+' and STOR_OUT_NO='+QuotedStr(strOutNo) +' and stor_in_no='+QuotedStr(strInNo);
           // active:=true;
            open;
            if (QryTemp.FieldByName('count_num').AsInteger>=1) then
            begin
                Application.MessageBox('同一笔出库记录中不允许拆单!','警告信息!',MB_OK);
                abort;
            end;

         end;
      end;
   end;


   with QryTemp do
   begin
      active:=false;
      Connection:=FConnection;
      sql.Text:='select sum(OUT_NUM) as num from kc_stor_out where BSN_NO ='+QuotedStr(bsNo)+' and STOR_OUT_NO='+QuotedStr(strOutNo) +' and stor_in_no='+QuotedStr(strInNo);
     // active:=true;
      Execute;
       Memo1.Lines.Add('减去本笔销售单库存数=['+inttostr(QryTemp.fieldbyName('num').AsInteger)+']');
      actNum:=actNum+QryTemp.fieldbyName('num').AsInteger;
   end;
     actNum:=actNum-TblMain.FieldByName('OUT_NUM').AsInteger;

      if actNum<0 then
        begin
           actNum:=0-actNum;
          // PlaySound(PChar('wrong.wav'),0, SND_ASYNC);
           Application.MessageBox(PAnsiChar(AnsiString('库存不足,不能继续操作,超出数目=['+inttostr(actNum)+']!')),'警告信息!',MB_OK);
           //TblMain.FieldByName('OUT_NUM').AsInteger:=0;
           abort;
        end;

   {
    //1.先计算出已经入库的库存数
    with QryStorIn do
     begin
        active:=false;
        Connection:=FConnection;
        sql.Text:='select mat_code,SUM(in_num) AS in_num  from KC_STOR_IN where BSN_NO ='+QuotedStr(bsNo) +' and MAT_CODE='+QuotedStr(StorInfo.MatNo) +' group by mat_code';
       // active:=true;
        open;
        if QryStorIn.RecordCount<=0 then
        begin
           //PlaySound(PChar('wrong.wav'),0, SND_ASYNC);
           ErrMsg:='SN/批次号为【'+bsNo+'】库存不足,请先入库！';
           Application.MessageBox(PChar(ErrMsg),'警告信息!',MB_OK);
           abort;
        end;
        inNum:=QryStorIn.fieldbyName('in_num').AsInteger;
     end;
     Memo1.Lines.Clear;
     Memo1.Lines.Add('1.已入库的库存数=['+inttostr(inNum)+']');
       //2.再计算出已经出库的数量
      with QryTemp do
           begin
              active:=false;
              Connection:=FConnection;
              sql.Text:='select sum(OUT_NUM) as num from kc_stor_out where BSN_NO ='+QuotedStr(bsNo) +' and MAT_CODE='+QuotedStr(StorInfo.MatNo);
             // active:=true;
              Execute;
              outNum:=QryTemp.fieldbyName('num').AsInteger;
        end;
         Memo1.Lines.Add('2.已出库的库存数=['+inttostr(outNum)+']');
        //3.再计算出本笔销售单里的库存数
         with QryTemp do
           begin
              active:=false;
              Connection:=FConnection;
              sql.Text:='select sum(OUT_NUM) as num from kc_stor_out where BSN_NO ='+QuotedStr(bsNo)+' and STOR_OUT_NO='+QuotedStr(strOutNo);
             // active:=true;
              Execute;
               Memo1.Lines.Add('3.减去本笔销售单库存数=['+inttostr(QryTemp.fieldbyName('num').AsInteger)+']');
              outNum:=outNum-QryTemp.fieldbyName('num').AsInteger;
        end;
          //4.再减去出本笔销售单里的要修改的数量
         outNum:=outNum+TblMain.FieldByName('OUT_NUM').AsInteger;
          Memo1.Lines.Add('4.最后欲出库的库存数=['+inttostr(outNum)+']已入库的库存数=['+inttostr(inNum)+']');
         inNum:=inNum-outNum;

        if inNum<0 then
        begin
           actNum:=0-inNum;
          // PlaySound(PChar('wrong.wav'),0, SND_ASYNC);
           Application.MessageBox(PAnsiChar(AnsiString('库存不足,不能继续操作,超出数目=['+inttostr(actNum)+']!')),'警告信息!',MB_OK);
           //TblMain.FieldByName('OUT_NUM').AsInteger:=0;
           abort;
        end;
        }
end;

procedure TFrmStorOut.TblMainAfterPost(DataSet: TDataSet);
 const qryNumSql='select sum(out_num) as num from kc_stor_out WHERE stor_out_no=''%s'' AND mat_code=''%s'' ';
const uptDtlSql='UPDATE pur_sale_dtl SET order_num=%d,amount=%d*SALE_PRICE,SALE_PROFIT=%d*(SALE_PRICE-STOR_PRICE) WHERE stor_out_no=''%s'' AND mat_code=''%s'' ';
const uptMainSql='UPDATE pur_sale_base SET amount=(SELECT SUM(amount) FROM pur_sale_dtl WHERE SALE_NO=''%s'' GROUP BY SALE_NO), ' +
' PROFIT=(SELECT SUM(SALE_PROFIT) FROM pur_sale_dtl WHERE sale_no=''%s'' GROUP BY SALE_NO) ' +
' WHERE order_no=''%s'' ';
var
  totalNum:Integer;
  dynSql:String;
begin
  inherited;
  {查询出库数量}
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
   {更新出库单明细总金额、总利润}
    {更新出库单总金额、总利润}
   try
     FConnection.StartTransaction;
       dynSql:=format(uptDtlSql,[totalNum,totalNum,totalNum,StorInfo.StorNo,StorInfo.MatNo]);
      // Memo1.Lines.Add(dynSql);
     with QryTemp do
     begin
        active:=false;
        Connection:=FConnection;
        sql.Text:=dynSql;
        //active:=true;
        Execute;
     end;
        dynSql:=format(uptMainSql,[StorInfo.FormNo,StorInfo.FormNo,StorInfo.FormNo]);
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

procedure TFrmStorOut.btnExportClick(Sender: TObject);
const qryDtlSql='SELECT BSN_NO,OUT_NUM,VALIDATE_DATE,DEGREE FROM kc_stor_out WHERE STOR_OUT_NO=''%s'' ' ;
var
 saleNo,dynSql,fileName:String;
 appExcel:Variant;
 m,n,i:Integer;
begin
  inherited;
//导出Excel   销售单据
    dynSql:=format(qryDtlSql,[StorInfo.StorNo]);
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

   {if not dlgSave1.Execute then
      Exit;
    fileName:=dlgSave1.FileName;
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
                appExcel.cells[m, 7]:= qryTemp.FieldByName('OUT_NUM').AsString;
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
         appExcel.visible:= true;
         {appExcel.Activeworkbook.saveas(fileName);
          appExcel.Quit;
         appExcel := Unassigned;  }
      except
        on E: Exception do
        begin
         { appExcel.Quit;
         appExcel := Unassigned;  }
          raise Exception.Create(E.Message);
        end;
      end;


end;

procedure TFrmStorOut.TblMainAfterDelete(DataSet: TDataSet);
begin
  inherited;
//删除后更新

      TblMainAfterPost(DataSet);
end;

procedure TFrmStorOut.cxTextSNKeyPress(Sender: TObject; var Key: Char);
var
  outNum,inNum,actNum:Integer;
begin
  inherited;
    IF cxTextSN.Text='' THEN
       Exit;
     if Key=#13 then
    begin
           with QryTemp do
           begin
              active:=false;
              Connection:=FConnection;
              sql.Text:='select * from v_act_stor where BSN_NO ='+QuotedStr(cxTextSN.Text) +' and MAT_CODE='+QuotedStr(StorInfo.MatNo);
             // active:=true;
              Memo1.Lines.Add('sql=['+ sql.Text+']');
              Execute;
              if QryTemp.RecordCount<=0 then
              begin
                 cxTextSN.Text:='';
                // PlaySound(PChar('wrong.wav'),0, SND_ASYNC);
                 Application.MessageBox('请先入库,再出库！','警告信息!',MB_OK);
                 Exit;
              end;
               sql.Text:='select * from v_act_stor where BSN_NO ='+QuotedStr(cxTextSN.Text) +' and MAT_CODE='+QuotedStr(StorInfo.MatNo)+' and act_num>=1 limit 0,1';
             // active:=true;
              Memo1.Lines.Add('sql=['+ sql.Text+']');
              Execute;
              actNum:=QryTemp.fieldbyName('act_num').AsInteger;
              Memo1.Lines.Add('剩余库存=['+inttostr(actNum)+']');
              if actNum<=0 then
              begin
                 cxTextSN.Text:='';
                 // PlaySound(PChar('wrong.wav'),0, SND_ASYNC);
                 Application.MessageBox('库存不足,不能继续操作!','警告信息!',MB_OK);
                 Exit;
              end;
           end;

         //出库操作
         try
           with TblMain do
           begin
              append;
              TblMain.FieldByName('BSN_NO').Value:=cxTextSN.Text;
              TblMain.FieldByName('STOR_IN_NO').Value:=QryTemp.fieldByName('STOR_IN_NO').Value;
              TblMain.FieldByName('MAT_CODE').Value:=QryTemp.fieldByName('MAT_CODE').Value;
              TblMain.FieldByName('DEGREE').Value:=QryTemp.fieldByName('DEGREE').Value;
              TblMain.FieldByName('VALIDATE_DATE').Value:=QryTemp.fieldByName('VALIDATE_DATE').Value;
              post;
           end;
           cxTextSN.Text:='';
           //PlaySound(PChar('right.wav'),0, SND_ASYNC);
         Except
              cxTextSN.Text:='';
           //  PlaySound(PChar('wrong.wav'),0, SND_ASYNC);
             Exit;
         end;
    end;
end;

procedure TFrmStorOut.FormCreate(Sender: TObject);
begin
  inherited;
     QryTemp.Connection:=FConnection;
     QryMatInfo.Connection:=FConnection;
     QryStorIn.Connection:=FConnection;
end;

procedure TFrmStorOut.btnImportClick(Sender: TObject);
var
 saleNo,dynSql,fileName,snNo,valDate,ErrMsg:String;
 ExcelApp,WorkBook:Variant;
 i,n,ExcelRowCount:Integer;
begin
  //inherited;

   try
     ExcelApp:=CreateOleObject('Excel.Application');
     Except
         Screen.Cursor := crDefault;
         Application.MessageBox('Excel尚未安装!','提示信息',MB_OK);
         Exit;
     end;  
    // ExcelApp.Connect();

      if not OpenDialog1.Execute then Exit;
      fileName:=OpenDialog1.FileName;
      
      try
         //appExcel.visible:=true;
        { WorkBook:=ExcelApp.WorkBooks.Open(fileName,
         EmptyParam,EmptyParam,EmptyParam,EmptyParam,
        EmptyParam,EmptyParam,EmptyParam,EmptyParam,
        EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,0); }
        WorkBook:=ExcelApp.WorkBooks.Open(fileName);
         ExcelRowCount := WorkBook.WorkSheets[1].UsedRange.Rows.Count;
        for i := 2 to ExcelRowCount + 1 do
        begin
          snNo := ExcelApp.Cells[i,2].value;
          if (snNo= '') then//指定excel档的第 i 行 ,第 1,2(看情况而定)行如果为空就退出,这样的设定,最好是你的档案力这两行//对应数据库中不能为空的数据
              break;
          valDate:=ExcelApp.Cells[i,3].Value;
          with TblMain do
          begin
            append;
            FieldByName('BSN_NO').value:=snNo;
             if (valDate<>'') then
            FieldByName('VALIDATE_DATE').value:=StrToDatetime(valDate);
            if StorInfo.MatType='批号' then
            begin
            FieldByName('OUT_NUM').value:=ExcelApp.Cells[i,4].Value;
            end
            else begin  
            FieldByName('DEGREE').value:=ExcelApp.Cells[i,4].Value;
            FieldByName('OUT_NUM').value:=1;
            end;
            post;
          end;
        end;
        WorkBook.Close;
        ExcelApp.Quit;
        //ExcelApp.Disconnect;
         WorkBook := Unassigned;
        ExcelApp := Unassigned;

      Except on E:Exception do
      begin
        WorkBook.Close;
        ExcelApp.Quit;
         // ExcelApp.Disconnect;
           WorkBook := Unassigned;
        ExcelApp := Unassigned;

         ErrMsg:='导入异常!'+e.Message;
         Application.MessageBox(PChar(ErrMsg),'提示信息',MB_OK);
      end;



   end;

end;

end.
