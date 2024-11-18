unit MainUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Menus, ShellAPI;

type
  TMainForm = class(TForm)
    Image1: TImage;
    VagnerBtn: TButton;
    OrdaBtn: TButton;
    LuchenokBtn: TButton;
    Label1: TLabel;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    procedure VagnerBtnClick(Sender: TObject);
    procedure OrdaBtnClick(Sender: TObject);
    procedure LuchenokBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

uses Biography, Loading, VagnerTest, Music;

//���������, ���������� �� ����������� ������������ ������ �� ������� �����
procedure TMainForm.FormShow(Sender: TObject);
begin
LoadingForm.ShowModal; //����������� ����� ������������ �� ��������
end;

//��������� ��� ������ � ����������� � �. �������
procedure TMainForm.LuchenokBtnClick(Sender: TObject);
var f: TextFile;
    Lines: string;
begin
MainForm.Hide; //������� ������� �����
BioForm := TBioForm.Create(Self); //����� ��������� ��������� �������� �. �������
BioForm.Label1.Caption:='����� ���������� �������'; //�������� �������� ���������
AssignFile(f, ExtractFilePath(paramstr(0)) + '���������\LuchenokBio.txt'); //��������� ���� � ���������� �. �������
Reset(f); //��������� ���� ��� ������
BioForm.Memo1.Clear; //������� Memo
while not eof(f) do //���� �� ����� �����, ��...
begin
  Readln(f, Lines); //������ ����� � ���������� � ���������� Lines
  BioForm.Memo1.Lines.Add(Lines); //������ � Memo �������� Lines
end;
CloseFile(f); //��������� ����
BioForm.Image1.Picture.LoadFromFile(ExtractFilePath(paramstr(0)) + '�����������\����� �������.jpg'); //��������� ���������� �. �������
BioForm.Memo1.Font.Name := 'Times New Roman'; //������������� ����� ������ � Memo
BioForm.Memo1.Font.Size :=  14; //������������� ������ ������ ������ � Memo
MusForm := TMusForm.Create(Self); //����� ��������� ��������� �������� � ������������ ��������������
MusForm.Label2.Caption := '<<����� �� ������� ������>>';  //������������� �������� 1-�� �������
MusForm.MediaPlayer1.FileName := ExtractFilePath(paramstr(0)) + '����������\LuchenokMus1.mp3'; //��������� 1-� ���������� � ������
MusForm.MediaPlayer1.Open;
MusForm.Label3.Caption := '<<������� �����>>'; //������������� �������� 2-�� �������
MusForm.MediaPlayer2.FileName := ExtractFilePath(paramstr(0)) + '����������\LuchenokMus2.mp3'; //��������� 2-� ���������� � ������
MusForm.MediaPlayer2.Open;
MusForm.Label4.Caption := '<<�������>>'; //������������� �������� 3-�� �������
MusForm.MediaPlayer3.FileName := ExtractFilePath(paramstr(0)) + '����������\LuchenokMus3.mp3'; //��������� 3-� ���������� � ������
MusForm.MediaPlayer3.Open;
BioForm.Show; //������� ������� �������� � ���������� �. �������
end;

//��������� ��� �������� ��������� <<� ������������>>
procedure TMainForm.N1Click(Sender: TObject);
begin
ShowMessage('���������� ������: ������ ������ ��������' + #10 + '������: ���-40' + #10 + '�� "����������� ��������������� ��������������� �������"' + #10 + '��������� ������������� � ��������������'); //������� ���������
end;

//��������� ��� �������� �������
procedure TMainForm.N2Click(Sender: TObject);
begin
ShellExecute(0, PChar('Open'), PChar('�������.chm'),nil,nil,SW_SHOW); //��������� ���� ������� � �������
end;

//��������� ��� ������ <<�����>>
procedure TMainForm.N3Click(Sender: TObject);
begin
Close; //��������� ����������
end;

//��������� ��� ������ � ����������� � �. ����
procedure TMainForm.OrdaBtnClick(Sender: TObject);
var f: TextFile;
    Lines: string;
begin
MainForm.Hide; //�������� ������� �����
BioForm.Label1.Caption:='�������� ������ ������ ����'; //�������� �������� ���������
AssignFile(f, ExtractFilePath(paramstr(0)) + '���������\OrdaBio.txt'); //��������� ���� � ���������� �. ����
Reset(f); //��������� ���� ��� ������
BioForm.Memo1.Clear; //������� Memo
while not eof(f) do //���� �� ����� �����, ��...
begin
  Readln(f, Lines); //���������� ����� � �������� � �������� ���������� Lines
  BioForm.Memo1.Lines.Add(Lines); //������ �������� Lines � Memo
end;
CloseFile(f); //��������� ����
BioForm.Image1.Picture.LoadFromFile(ExtractFilePath(paramstr(0)) + '�����������\�������� ����.jpg'); //��������� ����������� �. �������
BioForm.Memo1.Font.Name := 'Times New Roman'; //������������� ����� ������ � Memo
BioForm.Memo1.Font.Size :=  14; //������������� ������ ������ ������ � Memo
MusForm := TMusForm.Create(Self); //����� ��������� ��������� �������� � ������������ ��������������
MusForm.Label2.Caption := '<<������ �������>>'; //������������� �������� 1-�� �������
MusForm.MediaPlayer1.FileName := ExtractFilePath(paramstr(0)) + '����������\OrdaMus1.mp3'; //��������� 1-� ���������� � ������
MusForm.MediaPlayer1.Open;
MusForm.Label3.Caption := '<<�������� ������>>'; //������������� �������� 2-�� �������
MusForm.MediaPlayer2.FileName := ExtractFilePath(paramstr(0)) + '����������\OrdaMus2.mp3'; //��������� 2-� ���������� � ������
MusForm.MediaPlayer2.Open;
MusForm.Label4.Caption := '�����'; //������������� �������� 3-�� �������
MusForm.MediaPlayer3.FileName := ExtractFilePath(paramstr(0)) + '����������\OrdaMus3.mp3'; //��������� 3-� ���������� � ������
MusForm.MediaPlayer3.Open;
BioForm.Show; //������� ������� �������� � ���������� �. ����
end;


//��������� ��� ������ � ����������� � �. �������
procedure TMainForm.VagnerBtnClick(Sender: TObject);
var f: TextFile;
    Lines: string;
begin
MainForm.Hide; //������� ������� �����
BioForm := TBioForm.Create(Self); //�������� ��������� ��������� ��������
BioForm.Label1.Caption:='������ ��������� ������'; //�������� �������� ���������
AssignFile(f, ExtractFilePath(paramstr(0)) + '���������\VagnerBio.txt'); //��������� ���� � ���������� �. �������
Reset(f); //��������� ���� ��� ������
BioForm.Memo1.Clear; //������� Memo
while not eof(f) do //���� �� ����� �����, ��...
begin
  Readln(f, Lines); //���������� ����� � �������� � �������� ���������� Lines
  BioForm.Memo1.Lines.Add(Lines); //������ �������� Lines � Memo
end;
CloseFile(f); //��������� ����
BioForm.Image1.Picture.LoadFromFile(ExtractFilePath(paramstr(0)) + '�����������\������ ������.jpg'); //��������� ����������� �. �������
BioForm.Memo1.Font.Name := 'Times New Roman'; //������������� ����� ������ � Memo
BioForm.Memo1.Font.Size :=  14; //������������� ������ ������ ������ � Memo
MusForm := TMusForm.Create(Self); //����� ��������� ��������� �������� � ������������ ��������������
MusForm.Label2.Caption := '<<����� �����>>'; //������������� �������� 1-�� �������
MusForm.MediaPlayer1.FileName := ExtractFilePath(paramstr(0)) + '����������\VagnerMus1.mp3'; //��������� 1-� ���������� � ������
MusForm.MediaPlayer1.Open;
MusForm.Label3.Caption := '<<���������� �������>>'; //������������� �������� 2-�� �������
MusForm.MediaPlayer2.FileName := ExtractFilePath(paramstr(0)) + '����������\VagnerMus2.mp3'; //��������� 2-� ���������� � ������
MusForm.MediaPlayer2.Open;
MusForm.Label4.Caption := '<<���� � ����>>'; //������������� �������� 3-�� �������
MusForm.MediaPlayer3.FileName := ExtractFilePath(paramstr(0)) + '����������\VagnerMus3.mp3'; //��������� 3-� ���������� � ������
MusForm.MediaPlayer3.Open;
BioForm.Show; //������� ������� �������� � ���������� �. �������
end;

end.
