unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, StdCtrls, jpeg;

type
  TForm2 = class(TForm)
    StringGrid2: TStringGrid;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Button2: TButton;
    Image1: TImage;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses Unit1;

{$R *.dfm}

procedure TForm2.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  Form1.Show;
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
  Close;
end;

end.
