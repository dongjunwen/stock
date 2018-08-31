unit ULoginPassModi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UBaseForm, DB, MemDS, DBAccess, Uni, ImgList, ComCtrls, ToolWin,
  ExtCtrls, cxControls, cxContainer, cxEdit, cxTextEdit, cxDBEdit, StdCtrls,
  Menus, cxLookAndFeelPainters, cxButtons,ULoginUser;

type
  TFrmPassModi = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    cxButton1: TcxButton;
    cxTextEdit1: TcxTextEdit;
    cxTextEdit2: TcxTextEdit;
    cxTextEdit3: TcxTextEdit;
    Panel1: TPanel;
    procedure cxButton1Click(Sender: TObject);
    procedure cxTextEdit3KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }

  public
    { Public declarations }
      userInfo:TUserInfo;
  end;

var
  FrmPassModi: TFrmPassModi;

implementation

uses UDataCommon;

{$R *.dfm}

procedure TFrmPassModi.cxButton1Click(Sender: TObject);
const saveSql='update kc_login_base set PASS_WORD=''%s'' where login_no=''%s'' ';
var
 synSql:String;
begin

  //inherited;
  if(cxTextEdit1.Text<>userInfo.UserPass) then
  begin
      Application.MessageBox('原始密码错误!','提示信息!',MB_OK);
      Exit;
  end;
   if(cxTextEdit2.Text<>cxTextEdit3.Text) then
  begin
      Application.MessageBox('输入的两次密码不同!','提示信息!',MB_OK);
      Exit;
  end;
   if(cxTextEdit1.Text=cxTextEdit2.Text) then
  begin
      Application.MessageBox('新密码不能与原始密码一致!','提示信息!',MB_OK);
      Exit;
  end;

  synSql:=format(saveSql,[cxTextEdit2.Text,userInfo.UserId]);

  try
     with DataCommon.FCommonQry do
     begin
       close;
       sql.text:= synSql;
       Execute;
     end;
  except on  e:Exception do
      begin
      Application.MessageBox('修改密码错误!','提示信息!',MB_OK);
      Exit;
      end;
  end;
   Application.MessageBox('修改密码成功!','提示信息!',MB_OK);
end;

procedure TFrmPassModi.cxTextEdit3KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
   if Key=#13 then
      cxButton1Click(nil);
   
end;

end.
