unit Biography;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.jpeg, Vcl.ExtCtrls,
  Vcl.StdCtrls;

type
  TBioForm = class(TForm)
    Label1: TLabel;
    Memo1: TMemo;
    Image1: TImage;
    Image2: TImage;
    Button1: TButton;
    ScrollBar1: TScrollBar;
    Button2: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure ScrollBar1Change(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BioForm: TBioForm;

implementation

{$R *.dfm}

uses MainUnit, VagnerTest, Music;

//��������� ��� ����������� �� ������� ��������
procedure TBioForm.Button1Click(Sender: TObject);
begin
BioForm.Hide; //�������� �������� � ����������
MainForm.Show; //������� ������� ��������
end;

//��������� ��� �������� �� �������� � ������
procedure TBioForm.Button2Click(Sender: TObject);
begin
BioForm.Hide; //�������� �������� � ����������
TestForm.Show; //������� �������� � ������
end;

//��������� ��� �������� �� �������� � ������������ ��������������
procedure TBioForm.Button3Click(Sender: TObject);
begin
BioForm.Hide; //�������� �������� � ����������
MusForm.Show; //������� �������� � ��������� ����������� ������������
end;

//��������� ��� ������ � ���������
procedure TBioForm.ScrollBar1Change(Sender: TObject);
begin
 Memo1.Perform(EM_LINESCROLL, 0, ScrollBar1.Position); //����� � Memo ������ ������������ ��������� � ����������� �� ������� ��������
end;

end.
