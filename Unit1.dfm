object Form1: TForm1
  Left = 377
  Top = 179
  Caption = 'Untitled - Notepad'
  ClientHeight = 431
  ClientWidth = 531
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 0
    Top = 0
    Width = 531
    Height = 412
    Align = alClient
    DoubleBuffered = True
    ParentDoubleBuffered = False
    ReadOnly = True
    ScrollBars = ssBoth
    TabOrder = 0
    OnKeyDown = Memo1KeyDown
    OnKeyPress = Memo1KeyPress
  end
  object StatusBar2: TStatusBar
    Left = 0
    Top = 412
    Width = 531
    Height = 19
    Panels = <>
    Visible = False
  end
  object MainMenu1: TMainMenu
    Left = 176
    Top = 40
    object File1: TMenuItem
      Caption = 'File'
      object New1: TMenuItem
        Caption = 'New'
        ShortCut = 16462
        OnClick = New1Click
      end
      object Open1: TMenuItem
        Caption = 'Open...'
        ShortCut = 16463
        OnClick = Open1Click
      end
      object Save1: TMenuItem
        Caption = 'Save'
        ShortCut = 16467
        OnClick = Save1Click
      end
      object Saveas1: TMenuItem
        Caption = 'Save as...'
        OnClick = Saveas1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object PageSetup1: TMenuItem
        Caption = 'Page Setup...'
      end
      object Print1: TMenuItem
        Caption = 'Print...'
        ShortCut = 16464
        OnClick = Print1Click
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object Exit1: TMenuItem
        Caption = 'Exit'
        OnClick = Exit1Click
      end
    end
    object Edit1: TMenuItem
      Caption = 'Edit'
      object Undo1: TMenuItem
        Caption = 'Undo'
        ShortCut = 16474
        OnClick = Undo1Click
      end
      object Cut1: TMenuItem
        Caption = 'Cut'
        ShortCut = 16472
        OnClick = Cut1Click
      end
      object Copy1: TMenuItem
        Caption = 'Copy'
        ShortCut = 16451
        OnClick = Copy1Click
      end
      object Paste1: TMenuItem
        Caption = 'Paste'
        ShortCut = 16470
        OnClick = Paste1Click
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object Find1: TMenuItem
        Caption = 'Find'
        ShortCut = 16454
        OnClick = Find1Click
      end
      object FindNext1: TMenuItem
        Caption = 'Find Next'
        ShortCut = 114
      end
      object Replace1: TMenuItem
        Caption = 'Replace'
        ShortCut = 16456
        OnClick = Replace1Click
      end
      object Goto1: TMenuItem
        Caption = 'Goto'
        ShortCut = 16455
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object SelactAll1: TMenuItem
        Caption = 'Selact All'
        ShortCut = 16449
        OnClick = SelactAll1Click
      end
      object TimeDate1: TMenuItem
        Caption = 'Time/Date'
        ShortCut = 116
      end
    end
    object Format1: TMenuItem
      Caption = 'Format'
      object WordWrap2: TMenuItem
        Caption = 'Word Wrap'
        Checked = True
        OnClick = WordWrap2Click
      end
      object WordWrap1: TMenuItem
        Caption = 'Font...'
        OnClick = WordWrap1Click
      end
    end
    object View1: TMenuItem
      Caption = 'View'
      object StatusBar1: TMenuItem
        Caption = 'Status Bar'
        OnClick = StatusBar1Click
      end
    end
    object Help1: TMenuItem
      Caption = 'Help'
      object HelpTopics1: TMenuItem
        Caption = 'Help Topics'
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object AboutNotepad1: TMenuItem
        Caption = 'About Notepad'
        OnClick = AboutNotepad1Click
      end
    end
  end
  object sd: TSaveDialog
    Filter = 'Text Document|*.txt|All Files|*.*'
    Left = 48
    Top = 8
  end
  object od: TOpenDialog
    Filter = 'Text Documents|*.txt|All Files|*.*'
    Left = 16
    Top = 8
  end
  object fnt: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Left = 216
    Top = 40
  end
  object p: TPrintDialog
    Left = 144
    Top = 8
  end
  object fnd: TFindDialog
    Left = 176
    Top = 8
  end
  object r: TReplaceDialog
    Left = 208
    Top = 8
  end
end
