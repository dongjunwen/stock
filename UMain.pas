unit UMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, ExtCtrls, StdCtrls, ImgList, Buttons, jpeg,
  cxControls, cxSplitter,ULoginUser, cxContainer, cxTreeView, CoolTrayIcon,ShellAPI,
  iniFiles,Uni;
type
  TPageControl = class(ComCtrls.TPageControl)
  private
    procedure WMLButtonDown(var Message: TWMLButtonDown); message WM_LBUTTONDOWN;
  end;

type TCustNode = class
  private
    _frmName:String;
    _frmCaption : String;
  public
   /// function writeFormClass(FForm:TFormClass);
    //function readFormClass(FForm:TFormClass);
  published
    property FrmCaption: String read _frmCaption write _frmCaption;
    property FrmName: String read _frmName write _frmName;
  end;
type
  TFrmMain = class(TForm)
    StatusBar1: TStatusBar;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N3: TMenuItem;
    pnlleft: TPanel;
    pnlRight: TPanel;
    ImageList: TImageList;
    pgcMain: TPageControl;
    pnlTop: TPanel;
    Image1: TImage;
    cxSplitter1: TcxSplitter;
    Timer1: TTimer;
    tvList: TcxTreeView;
    CoolTrayIcon1: TCoolTrayIcon;
    PopupMenu1: TPopupMenu;
    N4: TMenuItem;
    E1: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N2: TMenuItem;
    SaveDialog1: TSaveDialog;
    OpenDialog1: TOpenDialog;
    Memo1: TMemo;
    N8: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tvList1DblClick(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure E1Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure CoolTrayIcon1DblClick(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure tvListDeletion(Sender: TObject; Node: TTreeNode);
    procedure N8Click(Sender: TObject);
  private
    { Private declarations }
    tabList: TStringList;
    //tvList:TStringList;
    _userInfo:TUserInfo;
  public
    { Public declarations }
    procedure addTab(formClass: TFormClass);
    procedure showTab(index: Integer);
    function findFormClass(formName: string): Integer;
    procedure DoCloseClick(Sender: TObject);
    procedure setTvList();
    function getFormName(): String;
  property
    userInfo:TUserInfo read _userInfo write _userInfo;
  end;

var
  FrmMain: TFrmMain;

implementation

uses ULogin,  UBaseForm,UMatInfo, UCompBase, UEmpBase, UOrderForm,
  USaleForm, UDataCfg, UOrderReport, USaleReport, USalerReport,
  UMatOrderReport, UMatSaleReport, UStorInfo, UDataCommon, UAcctManage,
  ULoginPassModi;

//uses UAgreement;

{$R *.dfm}

procedure TPageControl.WMLButtonDown(var Message: TWMLButtonDown);
var
  I: Integer;
  R: TRect;
  tab: TTabSheet;
  index: Integer;
begin
  inherited;
  //Form1.Text := Format('X:%d, Y:%d', [Message.XPos, Message.YPos])
  for I := 0 to PageCount - 1 do
  begin
    R := TabRect(I);
    R.Left := R.Right - 20;
    if PtInRect(R, Point(Message.XPos, Message.YPos)) then
    begin
      tab := TTabSheet(Pages[I]);
      index := FrmMain.tabList.IndexOfObject(tab);
      if (index >= 0) then
        FrmMain.tabList.Delete(index);
      Pages[I].Destroy;
      //Pages[I].Visible:=false;
      Break;
    end;
  end;
end;

procedure TFrmMain.DoCloseClick(Sender: TObject);
begin
  pgcMain.Pages[TComponent(Sender).Tag].Hide;
 // Sender.;
end;





function TFrmMain.getFormName(): String;
var
  selectText: string;
  formName: string;
  custNode : TCustNode;
begin

     custNode:=TCustNode(tvList.Selected.Data);

      IF custNode<>nil then
         formName:=custNode.FrmName;
         //Memo1.lines.Add('data is not null->'+formName);
     //  Memo1.lines.Add( tvList.selected.Text+'->'+formName);
  {selectText := tvList.selected.Text;
  formName := '';
  if selectText = '������Ϣ' then
    formName := 'TFrmMatInfo'
  else if selectText = '��˾����' then
    formName := 'TFrmCompBase'
  else if selectText = 'Ա������' then
    formName := 'TFrmEmpBase'
  else if selectText = '������' then
    formName := 'TFrmOrderForm'
  else if selectText = '���۵�' then
   // showMessage('�����ڴ�!')
     formName := 'TFrmSaleForm'
  else if selectText = '����������' then
    //showMessage('�����ڴ�!')
    formName := 'TFrmOrderReport'
  else if selectText = '���۵�����' then
    //showMessage('�����ڴ�!')
   formName := 'TFrmSaleReport'
  else if selectText = '������Աҵ��' then
   //showMessage('�����ڴ�!')
   formName := 'TFrmSalerReport'
   else if selectText = '��Ʒ��ѯ(��)' then
   //showMessage('�����ڴ�!')
   formName :=  'TFrmMatOrderReport'
   else if selectText = '��Ʒ��ѯ(��)' then
   //showMessage('�����ڴ�!')
    formName :=  'TFrmMatSaleRepot'
   else if selectText = '����ѯ' then
   //showMessage('�����ڴ�!')
     formName :=  'TFrmStorInfo'
   else if selectText = 'Ȩ�޹���' then
   showMessage('�����ڴ�!');
   }
  Result := formName;  
end;

procedure TFrmMain.FormCreate(Sender: TObject);
var
  SpeedButton1: TSpeedButton;
begin
     //ע�ᴰ����
  RegisterClasses([TFrmMatInfo,TFrmCompBase,TFrmEmpBase,TFrmOrderForm,TFrmSaleForm,
  TFrmOrderReport,TFrmSaleReport,TFrmSalerReport,TFrmMatOrderReport,TFrmMatSaleRepot,
  TFrmStorInfo,TFrmAcctManage]);
  tabList := TStringList.Create;

     //tvList:=TStringList.Create;
    // setTvList();//�������˵��б�

end;

procedure TFrmMain.FormDestroy(Sender: TObject);
begin
    //���ٴ�����
  UnRegisterClasses([TFrmMatInfo,TFrmCompBase,TFrmEmpBase,TFrmOrderForm,TFrmSaleForm,
  TFrmOrderReport,TFrmSaleReport,TFrmSalerReport,TFrmMatOrderReport,TFrmMatSaleRepot,
  TFrmStorInfo,TFrmAcctManage]);
end;

procedure TFrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 // Action := caFree;
   if Messagedlg('�� ��ȷ���˳�ϵͳ��? �� ',mtConfirmation ,[mbYes,mbNo],0) = mrYes then
  begin
    Action := caFree;
    Application.Terminate;
  end
  else
    Action := caNone;
end;

procedure TFrmMain.tvList1DblClick(Sender: TObject);
var
  formClass: TFormClass;
  index: Integer;
  formName: string;
  form: TForm;
  node: TTreeNode;
begin
    formName:=getFormName;
  if formName = '' then
    Exit;
  try
    formClass := TFormClass(findClass(formName));
  except
     formClass:=nil;
     exit;
  end;
  //  Application.CreateForm(formClass,form);
  index := findFormClass(formName);
  if (index = -1) then
    addTab(formClass)
  else
    showTab(index);
end;

function TFrmMain.findFormClass(formName: string): Integer;
begin
  if ((tabList = nil) or (tabList.Count = 0)) then
    Result := -1
  else
    Result := tabList.IndexOf(formName)
end;

procedure TFrmMain.addTab(formClass: TFormClass);
var
  title: string;
  tempTab: TTabSheet;
  tempForm: TForm;
begin
  tempTab := TTabSheet.Create(pgcMain);
  tempTab.PageControl := pgcMain;
    //tempTab.Caption := tvList.Selected.Text+ '            X';
  tempTab.ImageIndex := 1;
  tempForm := formClass.Create(tempTab);
  tempForm.Align := alClient;
  tempForm.Parent := tempTab;
  tempTab.Caption := tempForm.Caption + '            X';
  tempForm.Show;
  tabList.AddObject(formClass.ClassName, tempTab);
  pgcMain.ActivePage := tempTab;
end;

procedure TFrmMain.showTab(index: Integer);
var
  tempTab: TTabSheet;
begin
  tempTab := TTabSheet(tabList.Objects[index]);
  pgcMain.ActivePage := tempTab;
end;

procedure TFrmMain.N3Click(Sender: TObject);
begin
     close;
end;

procedure TFrmMain.FormShow(Sender: TObject);
begin
    //ShowWindow(Application.Handle, SW_HIDE);  //����������ʾ
    Timer1.Enabled:=false;
    Timer1.Enabled:=true;
   // StatusBar1.Panels[0].Text:='�����������桿';
    StatusBar1.Panels[1].Text:='��'+userInfo.UserName+'��';
    StatusBar1.Panels[2].Text:='��'+FormatdateTime('c',now)+'��';
    StatusBar1.Panels[3].Text:='��̫�����ܿƼ����޹�˾��Ȩ����,ΥȨ�ؾ�����';
    StatusBar1.Panels[4].Text:='������֧��QQ��704434431 �绰:18217004632��';
    tvList.Items.Clear;
    setTvList();
end;

procedure TFrmMain.setTvList();
var
   custNode:TCustNode;
   firstNode,menuNode,tempNode:TTreenode;
   itemIndex:Integer;
   nodeQuery:TUniQuery;
   menuNo:String;
begin

    //��ʼ�����ڵ�

    tvList.Items.BeginUpdate;
    tvList.SetFocus;
    firstNode:=tvList.Items.AddChild(tvList.Items.GetFirstNode,'����������ϵͳ');
    firstNode.ImageIndex   :=   8;
    firstNode.SelectedIndex   :=   9;
    firstNode.Text:='������ϵͳ';
    nodeQuery:=TUniQuery.Create(self);
    nodeQuery.Connection:=DataCommon.FCommonQry.Connection;

    tempNode:= TTreenode.Create(nil);
    with DataCommon.FCommonQry do
    begin
      close;
      sql.Text:='SELECT * FROM v_login_permit WHERE FH_MENU_NO IS NULL and login_no='+quotedStr(userInfo.UserId);
      open;
      while not DataCommon.FCommonQry.eof do
      begin  
        //custNode.FrmCaption:=fieldByName('menu_name').asstring;
        //custNode.FrmName:='TFrmMatInfo';
        menuNode:=tvList.Items.AddChild(firstNode, fieldByName('menu_name').asstring);
        menuNode.ImageIndex   :=   8;
        menuNode.SelectedIndex   :=   9;
       // menuNode.Data:=custNode;
        menuNo:=DataCommon.FCommonQry.fieldByName('menu_no').asstring;

        with nodeQuery do
        begin
            close;
            sql.Text:='SELECT * FROM v_login_permit WHERE FH_MENU_NO ='+QuotedStr(menuNo) +' and login_no='+quotedStr(userInfo.UserId);;
            open;
            while not nodeQuery.eof do
            begin
                 custNode:= TCustNode.Create();
                custNode.FrmCaption:=nodeQuery.fieldByName('menu_name').asstring;
                custNode.FrmName:=nodeQuery.fieldByName('form_name').asstring;
                Memo1.lines.Add( custNode.FrmCaption+'->'+custNode.FrmName);
                tempNode:=tvList.Items.AddChild(menuNode,custNode.FrmCaption);
                tempNode.ImageIndex   :=   8;
                tempNode.SelectedIndex   :=   9;
                tempNode.Data:= custNode;
               //  Memo1.lines.Add(tempNode.Text+'->'+TCustNode(tempNode.Data).FormName);
                nodeQuery.next;
                 // custNode.Free;
            end;
        end;  
        DataCommon.FCommonQry.next;
      end;
      
    end; 

    tvList.Items.EndUpdate;
    tvList.FullExpand;
end;
procedure TFrmMain.Timer1Timer(Sender: TObject);
begin
    StatusBar1.Panels[2].Text:='��'+FormatdateTime('c',now)+'��';
end;

procedure TFrmMain.E1Click(Sender: TObject);
begin
   Close;
end;

procedure TFrmMain.N4Click(Sender: TObject);
begin
   if not FrmLogin.Visible then
   CoolTrayIcon1.ShowMainForm;
    {if FrmMain.WindowState = wsMinimized then
        FrmMain.WindowState := wsMaximized;    // Override minimized state
     FrmMain.Visible := True;
     SetForegroundWindow(Application.Handle);    }
end;

procedure TFrmMain.FormResize(Sender: TObject);
begin
  { if WindowState =  wsMaximized then
   begin
    CoolTrayIcon1.HideTaskbarIcon;
   end; }
end;

procedure TFrmMain.CoolTrayIcon1DblClick(Sender: TObject);
begin
    N4Click(nil);
end;

procedure TFrmMain.N6Click(Sender: TObject);
var
  fileName:String;
  dataIni:TIniFile;
  hostName,dataBaseName,userName,passName:String;
begin
    fileName:=ExtractFilePath(Paramstr(0))+'dataBase.ini';
   dataIni:=Tinifile.Create(filename);
   hostName:=dataIni.ReadString('DATABSE','IP','127.0.0.1');
   dataBaseName:=dataIni.ReadString('DATABSE','DATABSE','KCDB');
   userName:=dataIni.ReadString('DATABSE','USER_NAME','root');
   passName:=dataIni.ReadString('DATABSE','USER_PASS','');


    if SaveDialog1.Execute then
    begin
      fileName:=SaveDialog1.FileName;
      try
    //���ݿ��ֶ�����
      //ShellExecute(1,'open',PChar('cmd.exe '),pchar('/c mysqldump -h'+hostName+'  -u'+userName+' -p'+passName+'  -n -d -t -R  '+dataBaseName+'>'+fileName),nil,SW_SHOW);
      ShellExecute(1,'open',PChar('cmd.exe '),pchar('/c mysqldump -h'+hostName+'  -u'+userName+' -p'+passName+' '+dataBaseName+'>'+fileName),nil,SW_SHOW);
       Except on e:Exception do begin
        showMessage('����ʧ��!'+e.Message);
        Exit;
        end;
     end;
     //showMessage('���ݳɹ�!');
    end;
end;

procedure TFrmMain.N7Click(Sender: TObject);
begin
      //���ݿ�����
     if FrmDataCfg=nil then
        FrmDataCfg:= TFrmDataCfg.create(self);
      FrmDataCfg.ShowModal;
end;

procedure TFrmMain.N2Click(Sender: TObject);
var
  fileName:String;
  dataIni:TIniFile;
  hostName,dataBaseName,userName,passName:String;
begin
    Filename:=ExtractFilePath(Paramstr(0))+'dataBase.ini';
   dataIni:=Tinifile.Create(filename);
   hostName:=dataIni.ReadString('DATABSE','IP','127.0.0.1');
   dataBaseName:=dataIni.ReadString('DATABSE','DATABSE','KCDB');
   userName:=dataIni.ReadString('DATABSE','USER_NAME','root');
   passName:=dataIni.ReadString('DATABSE','USER_PASS','');
    if OpenDialog1.Execute then
    begin
      fileName:=OpenDialog1.FileName;
      try
    //���ݿ��ֶ���ԭ
     //ShellExecute(1,'open',PChar('cmd.exe '),pchar('/c mysql -h'+hostName+'  -u'+userName+' -p'+passName+'  -n -d -t -R  '+dataBaseName+'<'+fileName),nil,SW_SHOW);
     ShellExecute(1,'open',PChar('cmd.exe '),pchar('/c mysql -h'+hostName+'  -u'+userName+' -p'+passName+' '+dataBaseName+'<'+fileName),nil,SW_SHOW);
     Except on e:Exception do begin
        showMessage('��ԭʧ��!'+e.Message);
        Exit;
        end;
     end;
     //showMessage('��ԭ�ɹ�!');
    end;
end;


procedure TFrmMain.tvListDeletion(Sender: TObject; Node: TTreeNode);
begin
  // Dispose(Node.Data);
end;

procedure TFrmMain.N8Click(Sender: TObject);
begin
    //�޸�����
     if FrmPassModi=nil then
        FrmPassModi:=TFrmPassModi.Create(self);
     FrmPassModi.userInfo:=userInfo;
     FrmPassModi.Show;
    
end;

end.
