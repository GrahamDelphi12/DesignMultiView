unit UnDM;

interface

uses
  System.SysUtils, System.Classes, FMX.Types, FMX.Controls;

type
  TDataModule2 = class(TDataModule)
    StyleBook1: TStyleBook;
    StyleBook2: TStyleBook;
    StyleBook3: TStyleBook;
    StyleBook4: TStyleBook;
    StyleBook5: TStyleBook;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule2: TDataModule2;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

end.
