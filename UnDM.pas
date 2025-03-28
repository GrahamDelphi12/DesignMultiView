unit UnDM;

interface

uses
  System.SysUtils, System.Classes, FMX.Types, FMX.Controls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.IB, FireDAC.Phys.IBDef, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.FMXUI.Wait, FireDAC.Comp.UI,
  FireDAC.Phys.IBBase, FireDAC.Comp.DataSet, FireDAC.Comp.Client, IBX.IBQuery,
  Data.DB, IBX.IBCustomDataSet, IBX.IBTable, IBX.IBDatabase, IOUtils;

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
    procedure FDConnection1BeforeConnect(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

procedure TDM.FDConnection1BeforeConnect(Sender: TObject);
begin

{$IF DEFINED(ANDROID)}
 FDConnection1.Params.Database  :=
                    TPath.Combine(TPath.GetDocumentsPath, 'MOBILEDB.IB');
{$ENDIF}

end;

end.
