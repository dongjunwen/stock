unit UEmpBase;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UBaseForm, DB, MemDS, DBAccess, Uni, ImgList, ComCtrls, ToolWin,
  ExtCtrls, UniProvider, MySQLUniProvider, Grids, DBGrids, StdCtrls,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, cxDBData, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGrid, cxCalendar, cxDropDownEdit, cxContainer;

type
  TFrmEmpBase = class(TFrmBase)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    TblMainEMP_NO: TStringField;
    TblMainEMP_NAME: TStringField;
    TblMainGENDER: TStringField;
    TblMainBIRTH_DAY: TDateField;
    TblMainMOBILE: TStringField;
    TblMainADDR: TStringField;
    TblMainEMAIL: TStringField;
    TblMainID_NO: TStringField;
    TblMainBANK_NAME: TStringField;
    TblMainBANK_ACCT: TStringField;
    TblMainJOIN_DATE: TDateTimeField;
    TblMainIF_LEAVE: TStringField;
    TblMainLEAVE_DATE: TDateField;
    TblMainMEMO: TStringField;
    TblMainEMP_TYPE: TStringField;
    Label1: TLabel;
    EdtEmpNo: TEdit;
    Label2: TLabel;
    EdtEmpName: TEdit;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1EmpCode: TcxGridDBColumn;
    cxGrid1DBTableView1EmpName: TcxGridDBColumn;
    cxGrid1DBTableView1EmpGender: TcxGridDBColumn;
    cxGrid1DBTableView1BirthDay: TcxGridDBColumn;
    cxGrid1DBTableView1Mobile: TcxGridDBColumn;
    cxGrid1DBTableView1Addr: TcxGridDBColumn;
    cxGrid1DBTableView1Email: TcxGridDBColumn;
    cxGrid1DBTableView1IdNo: TcxGridDBColumn;
    cxGrid1DBTableView1BankName: TcxGridDBColumn;
    cxGrid1DBTableView1BankAcct: TcxGridDBColumn;
    cxGrid1DBTableView1JoinDate: TcxGridDBColumn;
    cxGrid1DBTableView1LeaveDate: TcxGridDBColumn;
    cxGrid1DBTableView1Memo: TcxGridDBColumn;
    cxEditStyleController1: TcxEditStyleController;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle9: TcxStyle;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    procedure btnserchClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmEmpBase: TFrmEmpBase;

implementation

{$R *.dfm}

procedure TFrmEmpBase.btnserchClick(Sender: TObject);
var
  code,value,filterStr:string;
begin
  inherited;
  code:=EdtEmpNo.Text;
  value:=EdtEmpName.Text;
  filterStr:=' 1=1 ';
  if code<>'' then
  begin
     filterStr:=filterStr+' and EMP_NO='+QuotedStr('*'+code+'*');
  end;
  if value<>'' then
  begin
     filterStr:=filterStr+' and  EMP_NAME='+QuotedStr('*'+value+'*');
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
  {
procedure TFrmEmpBase.cxGrid1DBTableView1Column1GetDataText(
  Sender: TcxCustomGridTableItem; ARecordIndex: Integer;
  var AText: String);
 var
  recordcount:integer;
begin
    RecordCount := cxGrid1DBTableView1.ViewData.RecordCount;
    AText := Format('%.' + IntToStr(Length(IntToStr(RecordCount))) + 'd', [ARecordIndex + 1]);
end;
 }
end.
