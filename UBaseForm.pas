unit UBaseForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ADODB, DB, DBCtrls, Grids, DBGrids, ExtCtrls, StdCtrls,
  ComCtrls, ToolWin, ImgList, DBXpress, SqlExpr, DBAccess, Uni, MemDS,UCommonUtil;
type
  TFrmBase = class(TForm)
    tlb1: TToolBar;
    btnnew: TToolButton;
    ImageList: TImageList;
    btndelete: TToolButton;
    btnModi: TToolButton;
    btnserch: TToolButton;
    btnfresh: TToolButton;
    btnprint: TToolButton;
    btnSave: TToolButton;
    btncancel: TToolButton;
    PnlMain: TPanel;
    dsMain: TUniDataSource;
    TblMain: TUniTable;
    pnltop: TPanel;
    btnImport: TToolButton;
    btnExport: TToolButton;
    dlgSave1: TSaveDialog;
    btnFirst: TToolButton;
    btnBefore: TToolButton;
    btnNext: TToolButton;
    btnLast: TToolButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnnewClick(Sender: TObject);
    procedure btndeleteClick(Sender: TObject);
    procedure btnModiClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnfreshClick(Sender: TObject);
    procedure btncancelClick(Sender: TObject);
    procedure btnExportClick(Sender: TObject);
    procedure btnFirstClick(Sender: TObject);
    procedure btnBeforeClick(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure btnLastClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    dbgridName: TDBGrid;
    SaveFileName: string;
     FConnection: TUniConnection;
    procedure ButtonStateChange(state: DBSTAT);
  end;

var
  FrmBase: TFrmBase;

implementation

uses UDataCommon;

{$R *.dfm}

procedure TFrmBase.FormCreate(Sender: TObject);
begin
      //1.setDataCommon
      //2.iniData
  FConnection := DataCommon.FConnection;
  TblMain.Connection := FConnection;
end;

procedure TFrmBase.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmBase.ButtonStateChange(state: DBSTAT);
begin
  if STATE = NEW then
  begin
    btnnew.Enabled := False;
    btndelete.Enabled := False;
    btnModi.Enabled := False;
    btnserch.Enabled := False;
    btnSave.Enabled := true;
    btncancel.Enabled := True;
    btnfresh.Enabled := False;
  end else if STATE = DEL then
  begin
    btnnew.Enabled := False;
    btndelete.Enabled := False;
    btnModi.Enabled := False;
    btnserch.Enabled := False;
    btnSave.Enabled := true;
    btncancel.Enabled := True;
    btnfresh.Enabled := False;
  end else if STATE = MODI then
  begin
    btnnew.Enabled := False;
    btndelete.Enabled := False;
    btnModi.Enabled := False;
    btnserch.Enabled := False;
    btnSave.Enabled := true;
    btncancel.Enabled := True;
    btnfresh.Enabled := False;
  end else if STATE = SERCH then
  begin
    btnnew.Enabled := False;
    btndelete.Enabled := False;
    btnModi.Enabled := False;
    btnserch.Enabled := True;
    btnSave.Enabled := FALSE;
    btncancel.Enabled := FALSE;
    btnfresh.Enabled := False;
  end else if STATE = SAVE then
  begin
    btnnew.Enabled := TRUE;
    btndelete.Enabled := TRUE;
    btnModi.Enabled := TRUE;
    btnserch.Enabled := True;
    btnSave.Enabled := FALSE;
    btncancel.Enabled := FALSE;
    btnfresh.Enabled := False;
  end else if STATE = CANCEL then
  begin
    btnnew.Enabled := TRUE;
    btndelete.Enabled := TRUE;
    btnModi.Enabled := TRUE;
    btnserch.Enabled := True;
    btnSave.Enabled := FALSE;
    btncancel.Enabled := FALSE;
    btnfresh.Enabled := False;
  end

end;

procedure TFrmBase.btnnewClick(Sender: TObject);
begin
  if FConnection.Connected = false then Exit;
  btnSaveClick(Sender);
  if TblMain.Active = false then
    TblMain.Active := True;
  TblMain.Insert;
  ButtonStateChange(NEW);
end;

procedure TFrmBase.btndeleteClick(Sender: TObject);
begin
  if FConnection.Connected = false then Exit;
  if TblMain.Active = false then Exit;
  if (MessageDlg('确定要删除吗？', mtWarning, [mbYes, mbNo], 0) = mrYes) then
  begin
    Try
      FConnection.StartTransaction;
      TblMain.Delete;
      FConnection.Commit;
    except
      FConnection.Rollback;
    end;
  end;
  ButtonStateChange(DEL);
  btnSaveClick(Sender);
end;

procedure TFrmBase.btnModiClick(Sender: TObject);
begin
  if FConnection.Connected = false then Exit;
  btnSaveClick(Sender);
  if TblMain.Active = false then TblMain.Active := true;
  TblMain.Edit;
  ButtonStateChange(MODI);
end;

procedure TFrmBase.btnSaveClick(Sender: TObject);
begin
  if FConnection.Connected = false then Exit;  
  if not TblMain.Active then
  begin
    Exit;
  end;

  try 
    if (TblMain.State in [dsInsert, dsEdit]) then
    begin
       FConnection.StartTransaction;
      TblMain.Post;
     // TblMain.ApplyUpdates;
      FConnection.Commit;   
    end;
    ButtonStateChange(SAVE);
  except
    FConnection.Rollback;
    MessageDlg('数据保存异常！', mtError, [mbOK], 0);
  end;
end;

procedure TFrmBase.btnfreshClick(Sender: TObject);
begin
  if FConnection.Connected = false then Exit;
  if (TblMain.State in [dsInsert, dsEdit]) then
    TblMain.Post;
  TblMain.Refresh;
//  ButtonStateChange(REF);
end;

procedure TFrmBase.btncancelClick(Sender: TObject);
begin
  if FConnection.Connected = false then Exit;
  if (TblMain.State in [dsInsert, dsEdit]) then
    TblMain.Cancel;
 // TblMain.Refresh;
  ButtonStateChange(CANCEL);
end;

procedure TFrmBase.btnExportClick(Sender: TObject);
//var
  //dlgSave1: TSaveDialog;
begin
  if dbgridName = nil then exit;
  if SaveFileName = '' then exit;
 if  dbgridName.DataSource.DataSet.RecordCount=0 then Exit;
 // if dlgSave1 = nil then
 // dlgSave1 := TSaveDialog.Create(Self);
  dlgSave1.DefaultExt := 'xls';
  dlgSave1.FileName := SaveFileName;
  if dlgSave1.Execute then
    SaveFileName := dlgSave1.FileName
  else
    Exit;

     //ExportCxGrid(dbgridName, SaveFileName);

      ExportDBGrid(dbgridName, SaveFileName);
 
end;

procedure TFrmBase.btnFirstClick(Sender: TObject);
begin
 if tblMain.Active=True then TblMain.First;
end;

procedure TFrmBase.btnBeforeClick(Sender: TObject);
begin
  if tblMain.Active=True then TblMain.Prior;
end;

procedure TFrmBase.btnNextClick(Sender: TObject);
begin
    if tblMain.Active=True then TblMain.Next;
end;

procedure TFrmBase.btnLastClick(Sender: TObject);
begin
 if tblMain.Active=True then TblMain.Last;
end;

end.

