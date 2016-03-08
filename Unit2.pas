unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, jpeg, StdCtrls, shellapi, Buttons;

type
  Tabout = class(TForm)
    Bevel1: TBevel;
    lbl: TLabel;
    holyone: TImage;
    Label1: TLabel;
    Bevel2: TBevel;
    Label2: TLabel;
    SpeedButton1: TSpeedButton;
    Label3: TLabel;

    procedure urlClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Label3MouseEnter(Sender: TObject);
    procedure Label3MouseLeave(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  about: Tabout;

implementation

{$R *.DFM}



procedure Tabout.urlClick(Sender: TObject);
begin
 ShellExecute (0, 'open', 'http://www.tahribat.com', nil, '', 1);
end;

procedure Tabout.Label3MouseEnter(Sender: TObject);
begin
 label3.font.color:=clred;
end;

procedure Tabout.Label3MouseLeave(Sender: TObject);
begin
 label3.font.color:=clblue;
end;

procedure Tabout.SpeedButton1Click(Sender: TObject);
begin
showmessage('beep :PP eeuheuhe,'+#13+ 'niye kodum simdi ben bunu bu prorama?');
end;

end.
