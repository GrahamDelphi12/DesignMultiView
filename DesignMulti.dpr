program DesignMulti;

uses
  System.StartUpCopy,
  FMX.Forms,
  Unit1 in 'Unit1.pas' {Form1},
  UnDM in 'UnDM.pas' {DM: TDataModule},
  UnLocation in 'UnLocation.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
