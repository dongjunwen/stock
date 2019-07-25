unit UStorInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UBaseForm, DB, MemDS, DBAccess, Uni, ImgList, ComCtrls, ToolWin,
  ExtCtrls, cxGraphics, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, cxTextEdit, cxDropDownEdit, cxCalendar,
  cxContainer, cxMaskEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, StdCtrls, UniProvider, MySQLUniProvider,UCommonUtil,
  TeeProcs, TeEngine, Chart, DbChart, Series, cxSpinEdit;

type
  TFrmStorInfo = class(TFrmBase)
    Panel1: TPanel;
    Label1: TLabel;
    cxLookupMatCode: TcxLookupComboBox;
    cxTextMatName: TcxTextEdit;
    cxTextMatGauge: TcxTextEdit;
    Panel2: TPanel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1SelNo: TcxGridDBColumn;
    cxGrid1DBTableView1MatCode: TcxGridDBColumn;
    cxGrid1DBTableView1MatName: TcxGridDBColumn;
    cxGrid1DBTableView1MatGauge: TcxGridDBColumn;
    cxGrid1DBTableView1MatUnit: TcxGridDBColumn;
    cxGrid1DBTableView1Degree: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    dsMatInfo: TUniDataSource;
    QryMatInfo: TUniQuery;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxGrid1DBTableView1InNum: TcxGridDBColumn;
    cxGrid1DBTableView1OutNum: TcxGridDBColumn;
    cxGrid1DBTableView1ActNum: TcxGridDBColumn;
    TblMainMAT_CODE: TStringField;
    TblMainMAT_NAME: TStringField;
    TblMainMAT_GAUGE: TStringField;
    TblMainMAT_UNIT: TStringField;
    TblMainDEGREE: TFloatField;
    TblMainACT_NUM: TFloatField;
    TblMainIN_NUM: TFloatField;
    TblMainOUT_NUM: TFloatField;
    dsStorInfo: TUniDataSource;
    QryStorInfo: TUniQuery;
    Panel3: TPanel;
    procedure btnserchClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnExportClick(Sender: TObject);
    procedure cxLookupMatCodePropertiesCloseUp(Sender: TObject);
    procedure cxLookupMatCodePropertiesChange(Sender: TObject);
    procedure cxGrid1DBTableView1SelNoGetDataText(
      Sender: TcxCustomGridTableItem; ARecordIndex: Integer;
      var AText: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmStorInfo: TFrmStorInfo;

implementation

{$R *.dfm}

procedure TFrmStorInfo.btnserchClick(Sender: TObject);
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
   QryStorInfo.Execute;

end;

procedure TFrmStorInfo.FormCreate(Sender: TObject);
begin
  inherited;
   QryStorInfo.Connection:=FConnection;
   QryMatInfo.Connection:=FConnection;
   QryMatInfo.Active:=true;
end;

procedure TFrmStorInfo.btnExportClick(Sender: TObject);
var
  fileName:String;
begin
  //inherited;
  if not dlgSave1.Execute then
      Exit;
    fileName:=dlgSave1.FileName;
    
  ExportCxGrid(cxGrid1,fileName);
end;

procedure TFrmStorInfo.cxLookupMatCodePropertiesCloseUp(Sender: TObject);
begin
  inherited;
    QryMatInfo.Locate('MAT_CODE',cxLookupMatCode.Text,[]);
    cxTextMatName.Text:=QryMatInfo.fieldByName('MAT_NAME').AsString;
    cxTextMatGauge.Text:=QryMatInfo.fieldByName('MAT_GAUGE').AsString;
end;

procedure TFrmStorInfo.cxLookupMatCodePropertiesChange(Sender: TObject);
begin
  inherited;
   if cxLookupMatCode.Text='' then
  begin
     cxTextMatName.Text:='';
     cxTextMatGauge.Text:='';
  end;
end;

procedure TFrmStorInfo.cxGrid1DBTableView1SelNoGetDataText(
  Sender: TcxCustomGridTableItem; ARecordIndex: Integer;
  var AText: String);
 var
  recordcount:integer;
begin
    RecordCount := cxGrid1DBTableView1.ViewData.RecordCount;
    AText := Format('%.' + IntToStr(Length(IntToStr(RecordCount))) + 'd', [ARecordIndex + 1]);
end;

end.
