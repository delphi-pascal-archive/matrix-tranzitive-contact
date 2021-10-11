unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Controls, Forms, Dialogs, StdCtrls, Grids, XPMan,
  ExtCtrls, Spin, Buttons, Jpeg;

type
  TForm1 = class(TForm)
    StringGrid1: TStringGrid;
    Panel1: TPanel;
    Button1: TButton;
    SpinEdit1: TSpinEdit;
    Label1: TLabel;
    Button2: TButton;
    StringGrid2: TStringGrid;
    StringGrid3: TStringGrid;
    Image1: TImage;
    procedure SpinEdit1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses Unit2;

{$R *.dfm}

procedure TForm1.SpinEdit1Change(Sender: TObject);
var i,j:Integer;
begin
  StringGrid1.Width:=SpinEdit1.Value*26+3;
  StringGrid1.ColCount:=SpinEdit1.Value;

  StringGrid1.Height:=SpinEdit1.Value*26+3;
  StringGrid1.RowCount:=SpinEdit1.Value;

  For i:=0 to StringGrid1.ColCount-1 do
    For j:=0 to StringGrid1.RowCount-1 do
      StringGrid1.Cells[i,j]:='0';

  StringGrid1.Left:=(Form1.Width div 2)-(StringGrid1.Width div 2);
  StringGrid1.Top:=(Form1.Height div 2)-(StringGrid1.Height div 2)-5;

  {---}

  Form2.StringGrid2.Width:=SpinEdit1.Value*26+3;
  Form2.StringGrid2.ColCount:=SpinEdit1.Value;

  Form2.StringGrid2.Height:=SpinEdit1.Value*26+3;
  Form2.StringGrid2.RowCount:=SpinEdit1.Value;

  For i:=0 to Form2.StringGrid2.ColCount-1 do
    For j:=0 to Form2.StringGrid2.RowCount-1 do
      Form2.StringGrid2.Cells[i,j]:='';

  Form2.StringGrid2.Left:=(Form2.Width div 2)-(Form2.StringGrid2.Width div 2);
  Form2.StringGrid2.Top:=(Form2.Height div 2)-(Form2.StringGrid2.Height div 2)-5;
end;

procedure TForm1.Button1Click(Sender: TObject);
var i,j:Integer;
begin
  For i:=0 to StringGrid1.ColCount-1 do
    For j:=0 to StringGrid1.RowCount-1 do
      StringGrid1.Cells[i,j]:=IntToStr(random(2));
end;

procedure TForm1.Button2Click(Sender: TObject);
var i,j,k,N,Iterat:Integer;
    res, Stop:Bool;
begin
  Form2.StringGrid2.ColCount:=SpinEdit1.Value;
  Form2.StringGrid2.RowCount:=SpinEdit1.Value;
  StringGrid2.ColCount:=SpinEdit1.Value;
  StringGrid2.RowCount:=SpinEdit1.Value;
  StringGrid3.ColCount:=SpinEdit1.Value;
  StringGrid3.RowCount:=SpinEdit1.Value;

  Iterat:=0;

  N:=StringGrid1.RowCount-1;

  For i:=0 to N do begin
    Form2.StringGrid2.Cols[i]:=StringGrid1.Cols[i];
    StringGrid2.Cols[i]:=StringGrid1.Cols[i];
  end;

  Stop:=false;
  While Stop=false do
  begin
    Stop:=true;     // Предпологаем что это последний цикл
    For j:=0 to N do
    begin
       For k:=0 to N do
       begin

         res:=false;
         i:=0;

         While i<=N do
         begin
           if (StringGrid2.Cells[i,j]='1') and (StringGrid1.Cells[k,i]='1') then res:=True;
           inc(i);
         end;{while}

         if res then StringGrid3.Cells[k,j]:='1' else StringGrid3.Cells[k,j]:='0';

       end; {k}
     end; {j}

     For i:=0 to N do begin
       For j:=0 to N do begin
         if StringGrid3.Cells[i,j]='1' then
           if Form2.StringGrid2.Cells[i,j]='0' then
           begin
             Form2.StringGrid2.Cells[i,j]:='1';
             Stop:=false;  // Нужен еще цикл
           end;
           StringGrid2.Cells[i,j]:=StringGrid3.Cells[i,j];
      end; {for j}
    end; {for i}

    inc(Iterat); 
  end; {While}

  Form2.Label1.Caption:='Колличество умножений: '+IntToStr(iterat);
  Form1.Hide;
  Form2.ShowModal;
end;

procedure TForm1.FormShow(Sender: TObject);
var i,j:integer;
begin
  Randomize;
  SpinEdit1.OnChange(Sender);
  For i:=0 to StringGrid1.ColCount-1 do
    For j:=0 to StringGrid1.RowCount-1 do
      StringGrid1.Cells[i,j]:=IntToStr(0);
end;

end.
