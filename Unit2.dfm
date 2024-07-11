object DataModule2: TDataModule2
  OldCreateOrder = False
  Left = 192
  Top = 152
  Height = 206
  Width = 239
  object ZConnection1: TZConnection
    ControlsCodePage = cGET_ACP
    AutoEncodeStrings = False
    Connected = True
    HostName = 'localhost'
    Port = 3306
    Database = 'db_penjualan'
    User = 'root'
    Protocol = 'mysql'
    LibraryLocation = 'D:\Semester 4\8. Pemrograman Visual\Pertemuan 5\libmysql.dll'
    Left = 48
    Top = 32
  end
  object ZSatuan: TZQuery
    Connection = ZConnection1
    Active = True
    SQL.Strings = (
      'Select * from satuan')
    Params = <>
    Left = 120
    Top = 32
  end
  object DataSatuan: TDataSource
    DataSet = ZSatuan
    Left = 120
    Top = 88
  end
end
