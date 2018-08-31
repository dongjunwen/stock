unit UAcctManage;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UBaseForm, DB, MemDS, DBAccess, Uni, ImgList, ComCtrls, ToolWin,
  ExtCtrls, cxControls, cxContainer, cxEdit, cxTextEdit, cxDBEdit, StdCtrls,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  UniProvider, MySQLUniProvider, cxGroupBox, cxRadioGroup,
  cxDBLookupComboBox, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit;

type
  TFrmAcctManage = class(TFrmBase)
    Panel2: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    cxDBTextLoginNo: TcxDBTextEdit;
    cxDBTextLoginPass: TcxDBTextEdit;
    cxDBTextNicName: TcxDBTextEdit;
    Panel1: TPanel;
    Panel4: TPanel;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid2DBTableView1: TcxGridDBTableView;
    cxGrid2Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    TblMainLOGIN_NO: TStringField;
    TblMainPASS_WORD: TStringField;
    TblMainNICK_NAME: TStringField;
    TblMainSTATUS: TStringField;
    TblMainLAST_LOGIN_TIME: TDateTimeField;
    TblMainMEMO: TStringField;
    TblEmpRole: TUniTable;
    dsEmpRole: TUniDataSource;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxGrid1DBTableView1SelNo: TcxGridDBColumn;
    cxGrid1DBTableRoleNo: TcxGridDBColumn;
    qryRoleInfo: TUniQuery;
    cxDBRadioStatus: TcxDBRadioGroup;
    Label4: TLabel;
    cxGrid2DBTableView1LoginNo: TcxGridDBColumn;
    cxGrid2DBTableView1NicName: TcxGridDBColumn;
    cxGrid2DBTableView1Status: TcxGridDBColumn;
    TblEmpRoleLOGIN_NO: TStringField;
    TblEmpRoleROLE_NO: TStringField;
    TblEmpRoleMEMO: TStringField;
    cxGrid1DBTableView1RoleName: TcxGridDBColumn;
    dsRoleInfo: TUniDataSource;
    TblEmpRoleROLE_NAME: TStringField;
    Label5: TLabel;
    cxDBLookupComboBox1: TcxDBLookupComboBox;
    cxDBTextEdit1: TcxDBTextEdit;
    TblMainROLE_NO: TStringField;
    TblMainROLE_NAME: TStringField;
    dsLoginInfo: TUniDataSource;
    qryLoginInfo: TUniQuery;
    qryLoginInfoLOGIN_NO: TStringField;
    qryLoginInfoNICK_NAME: TStringField;
    qryLoginInfoSTATUS: TStringField;
    qryLoginInfoROLE_NO: TStringField;
    qryLoginInfoROLE_NAME: TStringField;
    qryLoginInfoSTATUS_NAME: TStringField;
    procedure cxGrid1DBTableRoleNoPropertiesCloseUp(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure TblMainNewRecord(DataSet: TDataSet);
    procedure btndeleteClick(Sender: TObject);
    procedure TblMainBeforePost(DataSet: TDataSet);
    procedure qryLoginInfoAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAcctManage: TFrmAcctManage;

implementation

{$R *.dfm}

procedure TFrmAcctManage.cxGrid1DBTableRoleNoPropertiesCloseUp(
  Sender: TObject);
begin
  inherited;
   qryRoleInfo.Locate('ROLE_NO',TblEmpRole.FIELDBYName('ROLE_NO').AsString,[]);
   TblEmpRole.FIELDBYName('ROLE_NO').Value:=qryRoleInfo.FIELDBYname('ROLE_NAME').AsString;
end;

procedure TFrmAcctManage.FormCreate(Sender: TObject);
begin
  inherited;

    TblEmpRole.Connection:=FConnection;
    qryRoleInfo.Connection:=FConnection;
    qryRoleInfo.Active:=true;
    TblMain.Active:=TRUE;
    qryLoginInfo.Connection:=FConnection;
    qryLoginInfo.Close;
    qryLoginInfo.Open;

end;

procedure TFrmAcctManage.btnSaveClick(Sender: TObject);
var
 loginNo:String;
begin
  inherited;
  //
  loginNo:=cxDBTextLoginNo.Text;
  qryLoginInfo.Refresh;
  qryLoginInfo.Locate('LOGIN_NO',loginNo,[]);

end;

procedure TFrmAcctManage.TblMainNewRecord(DataSet: TDataSet);
begin
  inherited;
   TblMain.FieldByName('status').AsString:='1';
end;

procedure TFrmAcctManage.btndeleteClick(Sender: TObject);
begin
  inherited;
    qryLoginInfo.Refresh;
end;

procedure TFrmAcctManage.TblMainBeforePost(DataSet: TDataSet);
begin
  //inherited;
   {if TblMain.FieldByName('ROLE_NO').AsString<>cxDBLookupComboBox1.Text then
   begin
       showMessage('管理员的不能更改!');
   end; }
end;

procedure TFrmAcctManage.qryLoginInfoAfterScroll(DataSet: TDataSet);
var
  manageNo:String;
begin
  inherited;
   manageNo:= qryLoginInfo.FieldByName('LOGIN_NO').AsString;
    if ((manageNo='ADMIN') or (manageNo='admin')) then
       cxDBLookupComboBox1.Enabled:=false
    else
      cxDBLookupComboBox1.Enabled:=true;

end;

end.
