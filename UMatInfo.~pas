unit UMatInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UBaseForm, DB, DBAccess, Uni, StdCtrls, Grids, DBGrids, MemDS,
  ImgList, ComCtrls, ToolWin, ExtCtrls, UniProvider, MySQLUniProvider,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, cxDBData, cxDropDownEdit, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGrid;

type
  TFrmMatInfo = class(TFrmBase)
    pnl1: TPanel;
    pnl2: TPanel;
    lbl1: TLabel;
    edtCode: TEdit;
    lbl2: TLabel;
    edtValue: TEdit;
    TblMainMAT_CODE: TStringField;
    TblMainMAT_NAME: TStringField;
    TblMainMAT_UNIT: TStringField;
    TblMainMAT_TYPE: TStringField;
    TblMainMEMO: TStringField;
    TblMainMAT_GAUGE: TStringField;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1MatNo: TcxGridDBColumn;
    cxGrid1DBTableView1MatName: TcxGridDBColumn;
    cxGrid1DBTableView1MatGauge: TcxGridDBColumn;
    cxGrid1DBTableView1MatUnit: TcxGridDBColumn;
    cxGrid1DBTableView1MatType: TcxGridDBColumn;
    cxGrid1DBTableView1Memo: TcxGridDBColumn;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    procedure btnserchClick(Sender: TObject);
    procedure btnExportClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMatInfo: TFrmMatInfo;

implementation

{$R *.dfm}

procedure TFrmMatInfo.btnserchClick(Sender: TObject);
var
  code,value,filterStr:string;
begin
  inherited;
  code:=edtCode.Text;
  value:=edtValue.Text;
  filterStr:=' 1=1 ';
  if code<>'' then
  begin
     filterStr:=filterStr+' and MAT_CODE='+QuotedStr('*'+code+'*');
  end;
  if value<>'' then
  begin
     filterStr:=filterStr+' and  MAT_NAME='+QuotedStr('*'+value+'*');
  end;
     with TblMain do
     begin
       active:=False;
       Filtered:=false;
       Filter:=filterStr;
       Filtered:=true;
       active:=true;
     end;
end;

procedure TFrmMatInfo.btnExportClick(Sender: TObject);
begin
  // dbgridName:=dbgrd1;
   //SaveFileName:='物料信息表';
  inherited;
end;

end.
