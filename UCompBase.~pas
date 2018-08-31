unit UCompBase;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UBaseForm, DB, MemDS, DBAccess, Uni, ImgList, ComCtrls, ToolWin,
  ExtCtrls, UniProvider, MySQLUniProvider, StdCtrls, Grids, DBGrids,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, cxDBData, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGrid;

type
  TFrmCompBase = class(TFrmBase)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    EdtCompCode: TEdit;
    Label2: TLabel;
    EdtCompName: TEdit;
    TblMainCOMP_NO: TStringField;
    TblMainCOMP_NAME: TStringField;
    TblMainHOME_PAGE: TStringField;
    TblMainCOMP_PRESENT: TStringField;
    TblMainCOMP_TYPE: TStringField;
    TblMainADDRESS: TStringField;
    TblMainTEL: TStringField;
    TblMainCONTACT: TStringField;
    TblMainMOBILE: TStringField;
    TblMainCOMP_MAIL_ADDR: TStringField;
    TblMainOPEN_BANK: TStringField;
    TblMainCOMP_ACCT: TStringField;
    TblMainMEMO: TStringField;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxGrid1DBTableView1Column1: TcxGridDBColumn;
    cxGrid1DBTableView1Column2: TcxGridDBColumn;
    cxGrid1DBTableView1Column3: TcxGridDBColumn;
    cxGrid1DBTableView1Column4: TcxGridDBColumn;
    cxGrid1DBTableView1Column5: TcxGridDBColumn;
    cxGrid1DBTableView1Column6: TcxGridDBColumn;
    cxGrid1DBTableView1Column7: TcxGridDBColumn;
    cxGrid1DBTableView1Column8: TcxGridDBColumn;
    cxGrid1DBTableView1Column9: TcxGridDBColumn;
    cxGrid1DBTableView1Column10: TcxGridDBColumn;
    cxGrid1DBTableView1Column11: TcxGridDBColumn;
    cxGrid1DBTableView1Column12: TcxGridDBColumn;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    procedure btnserchClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCompBase: TFrmCompBase;

implementation

{$R *.dfm}

procedure TFrmCompBase.btnserchClick(Sender: TObject);
var
  code,value,filterStr:string;
begin
  inherited;
  code:=EdtCompCode.Text;
  value:=EdtCompName.Text;
  filterStr:=' 1=1 ';
  if code<>'' then
  begin
     filterStr:=filterStr+' and COMP_NO='+QuotedStr('*'+code+'*');
  end;
  if value<>'' then
  begin
     filterStr:=filterStr+' and  COMP_NAME='+QuotedStr('*'+value+'*');
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

end.
