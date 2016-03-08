program Notepad;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  Unit2 in 'Unit2.pas' {about};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Notepad';
  Application.CreateForm(TForm1, Form1);

  Application.CreateForm(Tabout, about);
  Application.Run;
end.
