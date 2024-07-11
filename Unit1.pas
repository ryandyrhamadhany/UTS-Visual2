unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    DBGrid1: TDBGrid;
    Label3: TLabel;
    Edit3: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure posisiAwal;
    procedure bersih;
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure Edit3Change(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  a : string;

implementation

uses
  Unit2;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  if Edit1.Text = '' then
    begin
      ShowMessage('Nama Satuan Tidak Boleh Kosong');
    end else
    if DataModule2.Zsatuan.Locate('name',Edit1.Text,[]) then
    begin
      ShowMessage('Nama satuan'+Edit1.Text+'Sudah Ada Didalam Sistem');
    end else
    begin
      with DataModule2.ZSatuan do
      begin
        SQL.Clear;
        SQL.Add('insert into satuan values(null,"'+Edit1.Text+'","'+Edit2.Text+'")');
        ExecSQL;
        SQL.Clear;
        SQL.Add('select * from satuan');
        Open;
      end;
      ShowMessage('Data Berhasil Disimpan');
      posisiAwal;
    end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
if Edit1.Text = '' then
  begin
    ShowMessage('Nama satuan Tidak Boleh Kosong');
  end
else
  if Edit1.Text = DataModule2.Zsatuan.Fields[1].AsString then
    begin
    ShowMessage('Nama satuan '+Edit1.Text+'Tidak Ada Perubahan');
    end
  else
  if Edit1.Text = DataModule2.Zsatuan.Fields[2].AsString then
    begin
    ShowMessage('Nama deskripsi '+Edit1.Text+'Tidak Ada Perubahan');
    end
  else
  begin
    with DataModule2.Zsatuan do
      begin
        SQL.Clear;
        SQL.Add('update satuan set name="'+Edit1.Text+'",diskripsi="'+Edit2.Text+'" where id="'+a+'"');
        ExecSQL;
        SQL.Clear;
        SQL.Add('select * from satuan');
        Open;
      end;
      ShowMessage('Data Berhasil Diupdate');
      posisiAwal;
  end;

end;

procedure TForm1.Button3Click(Sender: TObject);
begin
   if MessageDlg('Apakah Anda Yakin Menghapus Data ini',mtWarning,[mbYes,mbNo],0)=mryes then
  begin
    with DataModule2.Zsatuan do
    begin
      SQL.Clear;
      SQL.Add('delete from satuan where id="'+a+'"');
      ExecSQL;
      SQL.Clear;
      SQL.Add('select * from satuan');
      Open;
    end;
    ShowMessage('Data Berhasil DiDelete');
  end else
  begin
    ShowMessage('Data Batal DiDelete');
  end;
  posisiAwal;
end;

procedure TForm1.DBGrid1CellClick(Column: TColumn);
begin
  Edit1.Text := DataModule2.Zsatuan.Fields[1].AsString;
  a:= DataModule2.Zsatuan.Fields[0].AsString;

  Edit1.Enabled := True;
  Button1.Enabled := False;
  Button2.Enabled := True;
  Button3.Enabled := True;
  Button4.Enabled := True;

end;

procedure TForm1.posisiAwal;
begin
  bersih;
  Button1.Enabled := True;
  Button2.Enabled := False;
  Button3.Enabled := False;
  Button4.Enabled := True;
  Edit1.Enabled := True;
end;

procedure TForm1.bersih;
begin
  Edit1.Text := '';
  Edit2.Text := '';
end;

procedure TForm1.Edit3Change(Sender: TObject);
begin
  with DataModule2.Zsatuan do
  begin
    SQL.Clear;
    SQL.Add('select * from satuan where name like "%'+Edit3.Text+'%"');
    Open;
  end;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  begin
  Edit1.Enabled := True;
  Button1.Enabled := True;
  Button2.Enabled := False;
  Button3.Enabled := False;
  Button4.Enabled := True;
  end;
end;

end.
