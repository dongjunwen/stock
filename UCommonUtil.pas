unit UCommonUtil;

interface
uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ADODB, DB, DBCtrls, Grids, DBGrids, ExtCtrls, StdCtrls,
  ComCtrls, ToolWin, ImgList, DBXpress, SqlExpr, DBAccess, Uni, MemDS, ComObj,
  cxGrid,cxExportGrid4Link;

  
type DBSTAT = (NEW, DEL, MODI, SAVE, SERCH, REF, CANCEL);

function ExportDBGrid(DBGrid: TDBGrid; SaveFileName: string): Boolean;
function ExportCxGrid(cxGrid: TcxGrid; SaveFileName: string): Boolean;
function ExportCxGrid1(cxGrid: TcxGrid) : Boolean;
function GetSeqId(seqType:String):String;
implementation


//DBGrid:指定的DBGrid;SaveFileName:要保存的文件名

function ExportDBGrid(DBGrid: TDBGrid; SaveFileName: string): Boolean;
var
  c, r, i, j,totalcount: integer;
  app: Olevariant;
  //ResultFileName: string;
begin
    totalcount:= DBGrid.DataSource.DataSet.RecordCount;
    if totalcount=0 then Exit;
  try
    result := True;
    app := CreateOLEObject('Excel.application');
//app.WorkBooks.Add(xlWBatWorkSheet);
  except
    Application.MessageBox('Excel没有正确安装！', '警告', MB_OK);
    result := False;
    exit;
  end;

  app.Workbooks.add;
  app.Visible := false;
  Screen.Cursor := crHourGlass;

  DBGrid.DataSource.DataSet.First;
  c := DBGrid.DataSource.DataSet.FieldCount;
  r := DBGrid.DataSource.DataSet.RecordCount;

  Application.ProcessMessages;

  for i := 0 to c - 1 do
  begin
    app.ActiveSheet.Columns[i + 1].ColumnWidth := 15; //设置格宽度
    app.cells(1, 1 + i) := DBGrid.DataSource.DataSet.Fields[i].DisplayLabel;
  end;

  for j := 1 to r do
  begin
    for i := 0 to c - 1 do
    begin
      app.cells[j + 1, 1].numberformatlocal := '@'; //设置成文本
      app.cells(j + 1, 1 + i) := DBGrid.DataSource.DataSet.Fields[i].AsString;
    end;
    DBGrid.DataSource.DataSet.Next;
  end;
  DBGrid.DataSource.DataSet.First;
 // ResultFileName := TempFileName;

  //if ResultFileName = '' then
  //  ResultFileName := '数据导出';

  if FileExists(SaveFileName) then
    DeleteFile(SaveFileName);

  app.Activeworkbook.saveas(SaveFileName);
  app.Activeworkbook.close(false);
  app.quit;
  app := unassigned;
  Screen.Cursor:=crDefault;
  MessageDlg('Excel导出成功',mtInformation,[mbOK],0);

end;

function ExportCxGrid(cxGrid: TcxGrid; SaveFileName: string):Boolean;
begin
   ExportGrid4ToExcel(SaveFileName,cxGrid, true,true, true,'xls');
end;


function ExportCxGrid1(cxGrid: TcxGrid):Boolean;
var
  saveDialog:TSaveDialog;
  SaveFileName:String;
begin
   saveDialog:=TSaveDialog.Create(nil);
   saveDialog.Filter:='*.xls';
   if saveDialog.Execute then
   begin
      SaveFileName:=saveDialog.fileName;
       ExportGrid4ToExcel(SaveFileName,cxGrid, true,true, true,'xls');
   end;
end;


function GetSeqId(seqType:String):String;
begin
   Randomize;
   Result:=seqType+FormatDateTime('YYYYMMDDHHmmss',now)+IntToStr(Random(1000));
end;


end.

