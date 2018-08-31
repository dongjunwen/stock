unit UBaseData;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UBaseForm, DB, MemDS, DBAccess, Uni, ImgList, ComCtrls, ToolWin,
  ExtCtrls,UCommonUtil, StdCtrls;

type
  TFrmData = class(TFrmBase)
    TblDtl: TUniTable;
    dsDtl: TUniDataSource;
    procedure FormCreate(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure TblDtlBeforePost(DataSet: TDataSet);
    procedure TblDtlAfterPost(DataSet: TDataSet);
    procedure btndeleteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmData: TFrmData;

implementation

{$R *.dfm}

procedure TFrmData.FormCreate(Sender: TObject);
begin
  inherited;
   TblDtl.Connection := FConnection;
end;

procedure TFrmData.btnSaveClick(Sender: TObject);
begin
  //inherited;
    if FConnection.Connected = false then Exit;  
  if not TblMain.Active then
  begin
    Exit;
  end;

  try
     FConnection.StartTransaction;
    if (TblMain.State in [dsInsert, dsEdit]) then
    begin
      TblMain.Post;
     // TblMain.ApplyUpdates;
    end;
    if (tblDtl.State in [dsInsert, dsEdit]) then
    begin
      tblDtl.Post;
    //  tblDtl.ApplyUpdates;
    end;
    FConnection.Commit;
    ButtonStateChange(SAVE);
  except
    FConnection.Rollback;
    MessageDlg('数据保存异常！', mtError, [mbOK], 0);
  end;
end;

procedure TFrmData.TblDtlBeforePost(DataSet: TDataSet);

begin
  inherited;

  //FConnection.StartTransaction;
end;

procedure TFrmData.TblDtlAfterPost(DataSet: TDataSet);
begin
  inherited;
  //FConnection.Commit;
end;

procedure TFrmData.btndeleteClick(Sender: TObject);
var
  i,dtlcount:Integer;
begin
  //inherited;
  if FConnection.Connected = false then Exit;
    if (MessageDlg('确定要删除吗？', mtWarning, [mbYes, mbNo], 0) = mrNo) then Exit;
   try
     FConnection.StartTransaction;
       dtlcount:=TblDtl.RecordCount;
       for i:=1 to dtlcount do
       begin
          TblDtl.Delete;
          TblDtl.Next;
       end;
       TblMain.Delete;
     FConnection.Commit;
     // close;
   except
     FConnection.Rollback;
   end;

end;

end.
