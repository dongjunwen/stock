unit ULogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,ULoginUser, jpeg, ExtCtrls, Menus,
  cxLookAndFeelPainters, cxButtons, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxCheckBox,IniFiles;

type
  TFrmLogin = class(TForm)
    BtnLogin: TcxButton;
    uTop: TPanel;
    TopClient: TImage;
    TopRight: TImage;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    LabTitle: TLabel;
    uRight: TImage;
    uLeft: TImage;
    uBottom: TImage;
    PanelBack: TPanel;
    Panel1: TPanel;
    Image6: TImage;
    Label5: TLabel;
    Image7: TImage;
    Label6: TLabel;
    Label7: TLabel;
    EdtUserId: TcxTextEdit;
    chkRemPsd: TcxCheckBox;
    chkRemUname: TcxCheckBox;
    EdtPass: TcxTextEdit;
    msgshow: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure BtnLogin1Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Image7Click(Sender: TObject);
    procedure EdtPassKeyPress(Sender: TObject; var Key: Char);
    procedure EdtPassKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtUserIdKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Label3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
      userInfo:TUserInfo;
    function LoginCheck(user:TUserInfo):Boolean;

  end;

var
  FrmLogin: TFrmLogin;

implementation

uses UMain, UDataCommon;

{$R *.dfm}
function TFrmLogin.LoginCheck(user:TUserInfo):Boolean;
var
  strsql:string;
begin
  Result:=true;
   strsql:=Format('select * from kc_login_base where LOGIN_NO=''%s'' and PASS_WORD=''%s'' and status=1 ',[user.UserId,user.UserPass]);
   with UDataCommon.DataCommon.FQuery do
   begin
     sql.clear;
     sql.add(strsql);
     Open;
     if RecordCount<=0 then
     begin
          Result:=false;
     end else
     begin
         userInfo.UserName:=fieldByName('NICK_NAME').AsString;
     end;
   end;
end;

procedure TFrmLogin.BtnLogin1Click(Sender: TObject);

begin
      userInfo:=TUserInfo.create;
      userInfo.UserId:=EdtUserId.Text;
      userInfo.UserPass:=EdtPass.Text;
      if(LoginCheck(userInfo)) then
      begin
           msgshow.Caption:='系统登录中...';
           msgshow.Visible:=true;
           FrmMain.userInfo:=userInfo;
           self.Close;
          // self.Free;
           BtnLogin.ModalResult:=mrOk;
           FrmLogin.ModalResult:=mrOk;
           FrmMain.Show;
      end else
      begin
           //EdtUserId.Clear;
           //EdtPass.Clear;
           msgshow.Caption:='用户号或密码错误,请重新输入！';
           msgshow.Visible:=true;
           BtnLogin.ModalResult:=mrNone;
           FrmLogin.ModalResult:=mrNone;
          // msgshow.Visible:=false;  
      end;
end;

procedure TFrmLogin.Image1Click(Sender: TObject);
begin
     self.Close;
     Application.Terminate;
end;

procedure TFrmLogin.FormCreate(Sender: TObject);
var
  FileName:String;
  MyIniFile:Tinifile;
begin
    FileName := ExtractFilePath(Paramstr(0))+'KCSTOR.ini';
  if FileExists(FileName) then
  begin
    try
      MyIniFile := TInifile.Create(FileName);
        chkRemUname.Checked := MyIniFile.ReadBool('UserID', 'RemId', True);
      if chkRemUname.Checked then
        EdtUserId.Text := MyIniFile.ReadString('UserID', 'UId', '');
      chkRemPsd.Checked := MyIniFile.ReadBool('PassWord', ' RemPwd', True);
      if chkRemPsd.Checked then
        EdtPass.Text := MyIniFile.ReadString('PassWord', 'UPwd', '');
    finally
      MyIniFile.Free;
    end;
  end;
end;

procedure TFrmLogin.FormDestroy(Sender: TObject);
var FileName: string;
  MyIniFile: Tinifile;
begin
  inherited;
    FileName := ExtractFilePath(Paramstr(0))+'KCSTOR.ini';
  if FileExists(FileName) then
  begin
    try
      MyIniFile := TInifile.Create(FileName);
       MyIniFile.WriteBool('UserID', 'RemId',  chkRemUname.Checked);
      if chkRemUname.Checked then
         MyIniFile.WriteString('UserID', 'UId', EdtUserId.Text);
      MyIniFile.WriteBool('PassWord', ' RemPwd',  chkRemPsd.Checked);
      if chkRemPsd.Checked then
         MyIniFile.WriteString('PassWord', 'UPwd', EdtPass.Text);
    finally
      MyIniFile.Free;
    end;
  end;
end;

procedure TFrmLogin.Image7Click(Sender: TObject);
var
Date1,Date2 :TDateTime;
Dt:integer;
begin
   Date1:=strtoDate('2010/03/02');
   Date2:=now;
   Dt:=Trunc(Date2-Date1);
    if Dt>=35 then
  begin
     Application.MessageBox('试用期已过!','警告信息!',MB_OK);
     Application.Terminate;
  end;
end;

procedure TFrmLogin.EdtPassKeyPress(Sender: TObject; var Key: Char);
begin
    // if Key=#13 then
     //   BtnLogin1Click(Sender);
end;

procedure TFrmLogin.EdtPassKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key= VK_RETURN then
        BtnLogin1Click(Sender);
end;

procedure TFrmLogin.EdtUserIdKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key= VK_RETURN then
      EdtPass.SetFocus;
end;

procedure TFrmLogin.Label3Click(Sender: TObject);
begin
      //开始注册
      
end;

end.
