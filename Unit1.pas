unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, StdCtrls, ComCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    New1: TMenuItem;
    Open1: TMenuItem;
    Save1: TMenuItem;
    Saveas1: TMenuItem;
    N1: TMenuItem;
    PageSetup1: TMenuItem;
    Print1: TMenuItem;
    N2: TMenuItem;
    Exit1: TMenuItem;
    Edit1: TMenuItem;
    Undo1: TMenuItem;
    Cut1: TMenuItem;
    Copy1: TMenuItem;
    Paste1: TMenuItem;
    N3: TMenuItem;
    Find1: TMenuItem;
    FindNext1: TMenuItem;
    Replace1: TMenuItem;
    Goto1: TMenuItem;
    N4: TMenuItem;
    SelactAll1: TMenuItem;
    TimeDate1: TMenuItem;
    Format1: TMenuItem;
    WordWrap1: TMenuItem;
    WordWrap2: TMenuItem;
    View1: TMenuItem;
    StatusBar1: TMenuItem;
    Help1: TMenuItem;
    HelpTopics1: TMenuItem;
    N5: TMenuItem;
    AboutNotepad1: TMenuItem;
    StatusBar2: TStatusBar;
    sd: TSaveDialog;
    od: TOpenDialog;
    fnt: TFontDialog;
    p: TPrintDialog;
    fnd: TFindDialog;
    r: TReplaceDialog;

    procedure StatusBar1Click(Sender: TObject);
    procedure Open1Click(Sender: TObject);
    procedure Save1Click(Sender: TObject);
    procedure Find1Click(Sender: TObject);
    procedure WordWrap1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure Replace1Click(Sender: TObject);
    procedure SelactAll1Click(Sender: TObject);
    procedure Undo1Click(Sender: TObject);
    procedure Cut1Click(Sender: TObject);
    procedure Copy1Click(Sender: TObject);
    procedure Paste1Click(Sender: TObject);
    procedure Print1Click(Sender: TObject);
    procedure Saveas1Click(Sender: TObject);
    procedure WordWrap2Click(Sender: TObject);
    procedure Memo1KeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure Memo1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure New1Click(Sender: TObject);
    procedure AboutNotepad1Click(Sender: TObject);
    procedure SwFileDrop1FileDragDrop(Sender: TObject; fcount, x, y: Integer;
      FileList: TStrings);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);

  private
    { Private declarations }
  public
    memory: TStrings;
    { Public declarations }
  end;

var
  Form1: TForm1;
  modified: Boolean = false;
  pos: integer;

implementation

uses Unit2;

{$R *.DFM}

procedure TForm1.StatusBar1Click(Sender: TObject);
begin
  StatusBar1.Checked := not StatusBar1.Checked;
  StatusBar2.visible := StatusBar1.Checked;
end;

procedure TForm1.Open1Click(Sender: TObject);
var
  r: integer;
begin

  if modified = true then
    r := MessageBox(Handle, 'The text in the Untitled file has changed.' +
      #10#13 + '' + #10#13 + 'Do you want to save the changes?',
      'Notepad', 4147)
  else
  begin
    Memo1.lines.Clear;
    pos := 1;
    exit;
  end;

  if r = ID_CANCEL then
    exit;

  if od.execute then
  begin

    memory.LoadFromFile(od.filename);
    Memo1.lines.Clear;
    pos := 1;
  end;
end;

procedure TForm1.Save1Click(Sender: TObject);
begin
  sd.execute;
end;

procedure TForm1.Find1Click(Sender: TObject);
begin
  fnd.execute;
end;

procedure TForm1.WordWrap1Click(Sender: TObject);
begin
  if fnt.execute then
    Memo1.font := fnt.font;
end;

procedure TForm1.Exit1Click(Sender: TObject);
begin

  close;
end;

procedure TForm1.Replace1Click(Sender: TObject);
begin
  r.execute;
end;

procedure TForm1.SelactAll1Click(Sender: TObject);
begin
  Memo1.SelectAll;
end;

procedure TForm1.Undo1Click(Sender: TObject);
begin
  Memo1.Undo;
end;

procedure TForm1.Cut1Click(Sender: TObject);
begin
  Memo1.CutToClipboard;
end;

procedure TForm1.Copy1Click(Sender: TObject);
begin
  Memo1.CopyToClipboard;
end;

procedure TForm1.Paste1Click(Sender: TObject);
begin
  Memo1.PasteFromClipboard;
end;

procedure TForm1.Print1Click(Sender: TObject);
begin
  p.execute;
end;

procedure TForm1.Saveas1Click(Sender: TObject);
begin
  sd.execute;
end;

procedure TForm1.WordWrap2Click(Sender: TObject);
begin
  WordWrap2.Checked := not WordWrap2.Checked;
end;

procedure TForm1.Memo1KeyPress(Sender: TObject; var Key: Char);
begin
  if pos > length(memory.Text) then
    exit;

  if not(ord(memory.Text[pos]) = 13) then

    Memo1.lines.Text := Memo1.lines.Text + memory.Text[pos];

  Memo1.SelStart := pos;
    Memo1.Lines.EndUpdate;
  inc(pos);

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  memory := Tstringlist.Create;
  pos := 1;
  if paramcount > 0 then
  begin
    memory.LoadFromFile(paramstr(1));
    exit;
  end;

  if od.execute then
  begin
    memory.LoadFromFile(od.filename);
  end;

  // bringwindowtotop(form1.handle);

end;

procedure TForm1.Memo1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  modified := true;
end;

procedure TForm1.New1Click(Sender: TObject);
var
  r: integer;
begin

  if modified = true then
    r := MessageBox(Handle, 'The text in the Untitled file has changed.' +
      #10#13 + '' + #10#13 + 'Do you want to save the changes?',
      'Notepad', 4147)
  else
  begin
    Memo1.lines.Clear;
    pos := 1;
    exit;
  end;

  if r = ID_CANCEL then
    exit;

  Memo1.lines.Clear;
  pos := 1;
  exit;

end;

procedure TForm1.AboutNotepad1Click(Sender: TObject);
begin
  about.showmodal;
end;

procedure TForm1.SwFileDrop1FileDragDrop(Sender: TObject; fcount, x, y: Integer;
  FileList: TStrings);
var
  r: integer;
begin

  if modified = true then
    r := MessageBox(Handle, 'The text in the Untitled file has changed.' +
      #10#13 + '' + #10#13 + 'Do you want to save the changes?',
      'Notepad', 4147)
  else
  begin
    Memo1.lines.Clear;
    pos := 1;
    exit;

  end;

  if r = ID_CANCEL then
    exit;

  Memo1.lines.Clear;
  pos := 1;
  memory.LoadFromFile(FileList[0]);

end;

procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if modified = true then

    if MessageBox(Handle, 'The text in the Untitled file has changed.' + #10#13
      + '' + #10#13 + 'Do you want to save the changes?', 'Notepad', 4147) = ID_CANCEL
    then
      CanClose := false
    else
      CanClose := true;

end;

end.
