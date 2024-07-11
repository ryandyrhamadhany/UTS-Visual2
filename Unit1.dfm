object Form1: TForm1
  Left = 529
  Top = 152
  Width = 484
  Height = 480
  Caption = 'fiture satuan'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 56
    Top = 40
    Width = 27
    Height = 13
    Caption = 'Nama'
  end
  object Label2: TLabel
    Left = 56
    Top = 64
    Width = 38
    Height = 13
    Caption = 'Diskripsi'
  end
  object Label3: TLabel
    Left = 56
    Top = 280
    Width = 71
    Height = 13
    Caption = 'Masukan nama'
  end
  object Edit1: TEdit
    Left = 120
    Top = 40
    Width = 273
    Height = 21
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 120
    Top = 64
    Width = 273
    Height = 21
    TabOrder = 1
  end
  object Button1: TButton
    Left = 56
    Top = 104
    Width = 75
    Height = 25
    Caption = 'Simpan'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 144
    Top = 104
    Width = 75
    Height = 25
    Caption = 'Edit'
    TabOrder = 3
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 232
    Top = 104
    Width = 75
    Height = 25
    Caption = 'Hapus'
    TabOrder = 4
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 320
    Top = 104
    Width = 75
    Height = 25
    Caption = 'Batal'
    TabOrder = 5
    OnClick = Button4Click
  end
  object DBGrid1: TDBGrid
    Left = 56
    Top = 144
    Width = 337
    Height = 120
    DataSource = DataModule2.DataSatuan
    TabOrder = 6
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = DBGrid1CellClick
  end
  object Edit3: TEdit
    Left = 136
    Top = 280
    Width = 257
    Height = 21
    TabOrder = 7
    OnChange = Edit3Change
  end
end
