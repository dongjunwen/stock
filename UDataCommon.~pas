unit UDataCommon;

interface

uses
  SysUtils, Classes, DB, ADODB, DBAccess, Uni,Dialogs, UniProvider,
  MySQLUniProvider, MemDS,IniFiles;

type
  TDataCommon = class(TDataModule)
    FConnection: TUniConnection;
    MySQLUniProvider1: TMySQLUniProvider;
    FCommonQry: TUniQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
      FQuery:TUniQuery;
     function  ConnectToServer():Boolean;
  end;

var
  DataCommon: TDataCommon;

implementation

{$R *.dfm}
function  TDataCommon.ConnectToServer():Boolean;
var
  isconnect:Boolean;
begin
    try
       FConnection.Connected:=true;
       FQuery:=FCommonQry;
       isconnect:=True;
    except on e:Exception   do
       begin
         showmessage(e.Message);
       isconnect:=false;
       end;
      end;
     result:=isconnect;
end;

procedure TDataCommon.DataModuleCreate(Sender: TObject);
    var
  dataIni:TIniFile;
  Filename:String;
begin
    Filename:=ExtractFilePath(Paramstr(0))+'dataBase.ini';
   dataIni:=Tinifile.Create(filename);
   FConnection.Server:=dataIni.ReadString('DATABSE','IP','127.0.0.1');
   FConnection.Port:=dataIni.ReadInteger('DATABSE','PORT',3306);
   FConnection.Database:=dataIni.ReadString('DATABSE','DATABSE','KCDB');
   FConnection.Username:=dataIni.ReadString('DATABSE','USER_NAME','admin');
   FConnection.Password:=dataIni.ReadString('DATABSE','USER_PASS','admin');
end;

end.
