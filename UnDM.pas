unit UnDM;

interface

uses
  System.SysUtils, System.Classes, FMX.Types, FMX.Controls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.IB, FireDAC.Phys.IBDef, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.FMXUI.Wait, FireDAC.Comp.UI,
  FireDAC.Phys.IBBase, FireDAC.Comp.DataSet, FireDAC.Comp.Client, IOUtils,
  Data.DB, FMX.Grid.Style, FMX.Grid, FMX.Dialogs;


type
  TDM = class(TDataModule)
    StyleBook1: TStyleBook;
    StyleBook2: TStyleBook;
    StyleBook3: TStyleBook;
    StyleBook4: TStyleBook;
    StyleBook5: TStyleBook;
    FDConnection1: TFDConnection;
    FDQDetails: TFDQuery;
    FDPhysIBDriverLink1: TFDPhysIBDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDQOrganisation: TFDQuery;
    FDQLocations: TFDQuery;
    procedure FDConnection1BeforeConnect(Sender: TObject);
  private
    { Private declarations }
    procedure WriteToLog(const Msg: string);
  public
    { Public declarations }
    procedure PopulateStringGrid(Grid: TStringGrid; Query: TFDQuery);
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

procedure TDM.WriteToLog(const Msg: string);
var
  LogFile: TextFile;
  LogPath: string;
begin
  // Set the path for the log file
  LogPath := TPath.Combine(TPath.GetDocumentsPath, 'AppLog.txt');

  // Append the message to the log file
  AssignFile(LogFile, LogPath);
  if FileExists(LogPath) then
    Append(LogFile)
  else
    Rewrite(LogFile);

  try
    Writeln(LogFile, FormatDateTime('yyyy-mm-dd hh:nn:ss', Now) + ': ' + Msg);
  finally
    CloseFile(LogFile);
  end;
end;


procedure TDM.FDConnection1BeforeConnect(Sender: TObject);
begin

{$IF DEFINED(ANDROID)}
 FDConnection1.Params.Database  :=
                    TPath.Combine(TPath.GetDocumentsPath, 'MOBILEDB.IB');
{$ENDIF}

end;

procedure TDM.PopulateStringGrid(Grid: TStringGrid; Query: TFDQuery);
var
  ColIndex, RowIndex: Integer;
  NewColumn: TStringColumn;
begin
  Grid.ClearColumns;
  Query.Open;

  // Debug: Log query record count
  WritetoLog('Records Found: ' + IntToStr(Query.RecordCount));
  if Query.IsEmpty then Exit;  // Avoid proceeding if no data

  // Define column headers
  for ColIndex := 0 to Query.FieldCount - 1 do
  begin
    NewColumn := TStringColumn.Create(Grid);
    NewColumn.Header := Query.Fields[ColIndex].FieldName;
    If NewColumn.Header = 'IMAGE_NAME' then NewColumn.Width := NewColumn.Width + 70;
    Grid.AddObject(NewColumn);
  end;

  Grid.RowCount := Query.RecordCount + 1; // Set row count

  RowIndex := 1; // Start at row 1 for data (row 0 reserved for headers)

  Query.First;
  while not Query.Eof do
  begin
    for ColIndex := 0 to Query.FieldCount - 1 do
    begin
      WritetoLog('Populating Grid.Cells[' + IntToStr(ColIndex) + ', ' + IntToStr(RowIndex) + ']');
      Grid.Cells[ColIndex, RowIndex] := Query.Fields[ColIndex].AsString;
    end;

    Inc(RowIndex);
    Query.Next;
  end;
end;


end.
