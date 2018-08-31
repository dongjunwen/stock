unit UDataCfg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,IniFiles, UniProvider, MySQLUniProvider, DB, DBAccess,
  Uni;

type
  TFrmDataCfg = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    BtnOk: TButton;
    EdtIpAddr: TEdit;
    EdtIpPort: TEdit;
    Label3: TLabel;
    EdtDataName: TEdit;
    Label4: TLabel;
    EdtUserName: TEdit;
    Label5: TLabel;
    EdtUserPass: TEdit;
    Button1: TButton;
    UniConnection1: TUniConnection;
    MySQLUniProvider1: TMySQLUniProvider;
    procedure BtnOkClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmDataCfg: TFrmDataCfg;

implementation

{$R *.dfm}

procedure TFrmDataCfg.BtnOkClick(Sender: TObject);
var
  dataIni:TIniFile;
  Filename:String;
begin
  try
    Filename:=ExtractFilePath(Paramstr(0))+'dataBase.ini';
   dataIni:=Tinifile.Create(filename);
   dataIni.WriteString('DATABSE','IP',EdtIpAddr.Text);
   dataIni.WriteInteger('DATABSE','PORT',StrToInt(EdtIpPort.Text));
   dataIni.WriteString('DATABSE','DATABSE',EdtDataName.Text);
   dataIni.WriteString('DATABSE','USER_NAME',EdtUserName.Text);
   dataIni.WriteString('DATABSE','USER_PASS',EdtUserPass.Text);
    showMessage('设置成功!');
  Except
    showMessage('设置失败!');
  end;

end;

procedure TFrmDataCfg.BtnCancelClick(Sender: TObject);
begin
     close;
end;

procedure TFrmDataCfg.FormCreate(Sender: TObject);
  var
  dataIni:TIniFile;
  Filename:String;
begin
    Filename:=ExtractFilePath(Paramstr(0))+'dataBase.ini';
   dataIni:=Tinifile.Create(filename);
   EdtIpAddr.Text:=dataIni.ReadString('DATABSE','IP','127.0.0.1');
   EdtIpPort.Text:=inttostr(dataIni.ReadInteger('DATABSE','PORT',3306));
   EdtDataName.Text:=dataIni.ReadString('DATABSE','DATABSE','KCDB');
   EdtUserName.Text:=dataIni.ReadString('DATABSE','USER_NAME','root');
   EdtUserPass.Text:=dataIni.ReadString('DATABSE','USER_PASS','');

end;

procedure TFrmDataCfg.Button1Click(Sender: TObject);
begin
     UniConnection1.Server:=EdtIpAddr.Text;
     UniConnection1.Port:=StrToInt(EdtIpPort.Text);
     UniConnection1.Database:=EdtDataName.Text;
     UniConnection1.Username:= EdtUserName.Text;
     UniConnection1.Password:=EdtUserPass.Text;
     try
        UniConnection1.Connected:=false;
        UniConnection1.Connected:=true;
        showMessage('连接成功！');
     Except
        showMessage('连接失败！');
     end;
end;

end.
