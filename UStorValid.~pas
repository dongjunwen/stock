unit UStorValid;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UBaseForm, DB, MemDS, DBAccess, Uni, ImgList, ComCtrls, ToolWin,
  ExtCtrls, cxGraphics, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, cxTextEdit, cxContainer, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  StdCtrls, cxSpinEdit,UCommonUtil;

type
  TFrmStorValid = class(TFrmBase)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    cxLookupMatCode: TcxLookupComboBox;
    cxTextMatName: TcxTextEdit;
    cxTextMatGauge: TcxTextEdit;
    Panel3: TPanel;
    Panel4: TPanel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1SelNo: TcxGridDBColumn;
    cxGrid1DBTableView1MatCode: TcxGridDBColumn;
    cxGrid1DBTableView1MatName: TcxGridDBColumn;
    cxGrid1DBTableView1MatGauge: TcxGridDBColumn;
    cxGrid1DBTableView1MatUnit: TcxGridDBColumn;
    cxGrid1DBTableView1Degree: TcxGridDBColumn;
    cxGrid1DBTableView1BSnNo: TcxGridDBColumn;
    cxGrid1DBTableView1Memo: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    QryStorInfo: TUniQuery;
    dsMatInfo: TUniDataSource;
    QryMatInfo: TUniQuery;
    dsStorInfo: TUniDataSource;
    cxSpinEdit1: TcxSpinEdit;
    Label2: TLabel;
    cxGrid1DBTableView1ValidDate: TcxGridDBColumn;
    procedure btnserchClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxLookupMatCodePropertiesCloseUp(Sender: TObject);
    procedure cxLookupMatCodePropertiesChange(Sender: TObject);
    procedure cxGrid1DBTableView1SelNoGetDataText(
      Sender: TcxCustomGridTableItem; ARecordIndex: Integer;
      var AText: String);
    procedure btnExportClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmStorValid: TFrmStorValid;

implementation

{$R *.dfm}

procedure TFrmStorValid.btnserchClick(Sender: TObject);
var
   matCode:String;
begin
  inherited;
   //≤È—Ø
   QryStorInfo.Close;
    if cxLookupMatCode.Text<>'' then
    begin
       matCode:=cxLookupMatCode.Text;
        QryStorInfo.ParamByName('matCode').Value:= matCode;
    end;
    QryStorInfo.ParamByName('validMonth').Value:= cxSpinEdit1.Value;
   QryStorInfo.Execute;

end;

procedure TFrmStorValid.FormCreate(Sender: TObject);
begin
  inherited;
    QryStorInfo.Connection:=FConnection;
    QryMatInfo.Connection:=FConnection;
    QryMatInfo.Active:=true;
end;

procedure TFrmStorValid.cxLookupMatCodePropertiesCloseUp(Sender: TObject);
begin
  inherited;
    QryMatInfo.Locate('MAT_CODE',cxLookupMatCode.Text,[]);
    cxTextMatName.Text:=QryMatInfo.fieldByName('MAT_NAME').AsString;
    cxTextMatGauge.Text:=QryMatInfo.fieldByName('MAT_GAUGE').AsString;
end;

procedure TFrmStorValid.cxLookupMatCodePropertiesChange(Sender: TObject);
begin
  inherited;
   if cxLookupMatCode.Text='' then
  begin
     cxTextMatName.Text:='';
     cxTextMatGauge.Text:='';
  end;
end;

procedure TFrmStorValid.cxGrid1DBTableView1SelNoGetDataText(
  Sender: TcxCustomGridTableItem; ARecordIndex: Integer;
  var AText: String);
 var
  recordcount:integer;
begin
    RecordCount := cxGrid1DBTableView1.ViewData.RecordCount;
    AText := Format('%.' + IntToStr(Length(IntToStr(RecordCount))) + 'd', [ARecordIndex + 1]);
end;

procedure TFrmStorValid.btnExportClick(Sender: TObject);
var
  fileName:String;
begin
  //inherited;
  if not dlgSave1.Execute then
      Exit;
    fileName:=dlgSave1.FileName;
    
  ExportCxGrid(cxGrid1,fileName);
end;

end.
