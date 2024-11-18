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

//Процедура, отвечающая за изображение загрузочного экрана до главной формы
procedure TMainForm.FormShow(Sender: TObject);
begin
LoadingForm.ShowModal; //Загрузочный экран отображается до главного
end;

//Процедура для работы с информацией о И. Лученка
procedure TMainForm.LuchenokBtnClick(Sender: TObject);
var f: TextFile;
    Lines: string;
begin
MainForm.Hide; //Скрытие главной формы
BioForm := TBioForm.Create(Self); //Вызов процедуры структуры страницы И. Лученка
BioForm.Label1.Caption:='Игорь Михайлович Лученок'; //Изменяем Заглавие биографии
AssignFile(f, ExtractFilePath(paramstr(0)) + 'Биографии\LuchenokBio.txt'); //Связываем файл с биографией И. Лученка
Reset(f); //Открываем файл для чтения
BioForm.Memo1.Clear; //Очищаем Memo
while not eof(f) do //Пока не конец файла, то...
begin
  Readln(f, Lines); //Чтение файла и сохранение в переменную Lines
  BioForm.Memo1.Lines.Add(Lines); //Вносим в Memo значение Lines
end;
CloseFile(f); //Закрываем файл
BioForm.Image1.Picture.LoadFromFile(ExtractFilePath(paramstr(0)) + 'Изображения\Игорь Лученок.jpg'); //Загружаем избражение И. Лученка
BioForm.Memo1.Font.Name := 'Times New Roman'; //Устанавливаем шрифт текста в Memo
BioForm.Memo1.Font.Size :=  14; //Устанавливаем размер шрифта текста в Memo
MusForm := TMusForm.Create(Self); //Вызов процедуры структуры страницы с музыкальными произведениями
MusForm.Label2.Caption := '<<Жураўлі на Палессе ляцяць>>';  //Устанавливаем название 1-го примера
MusForm.MediaPlayer1.FileName := ExtractFilePath(paramstr(0)) + 'Аудиофайлы\LuchenokMus1.mp3'; //Связываем 1-й медиаплеер с файлом
MusForm.MediaPlayer1.Open;
MusForm.Label3.Caption := '<<Майский вальс>>'; //Устанавливаем название 2-го примера
MusForm.MediaPlayer2.FileName := ExtractFilePath(paramstr(0)) + 'Аудиофайлы\LuchenokMus2.mp3'; //Связываем 2-й медиаплеер с файлом
MusForm.MediaPlayer2.Open;
MusForm.Label4.Caption := '<<Бярозка>>'; //Устанавливаем название 3-го примера
MusForm.MediaPlayer3.FileName := ExtractFilePath(paramstr(0)) + 'Аудиофайлы\LuchenokMus3.mp3'; //Связываем 3-й медиаплеер с файлом
MusForm.MediaPlayer3.Open;
BioForm.Show; //Выводим готовую страницу с биографией И. Лученка
end;

//Процедура для создания сообщения <<О разработчике>>
procedure TMainForm.N1Click(Sender: TObject);
begin
ShowMessage('Разработал проект: Баулин Матвей Олегович' + #10 + 'Группа: ПЗТ-40' + #10 + 'УО "Гродненский государственный политехнический колледж"' + #10 + 'Отделение автоматизации и информатизации'); //Выводим сообщение
end;

//Процедура для открытия справки
procedure TMainForm.N2Click(Sender: TObject);
begin
ShellExecute(0, PChar('Open'), PChar('Справка.chm'),nil,nil,SW_SHOW); //Связываем файл справки с кнопкой
end;

//Процедура для кнопки <<Выход>>
procedure TMainForm.N3Click(Sender: TObject);
begin
Close; //Закрываем приложение
end;

//Процедура для работы с информацией о Н. Орде
procedure TMainForm.OrdaBtnClick(Sender: TObject);
var f: TextFile;
    Lines: string;
begin
MainForm.Hide; //Скрываем главную форму
BioForm.Label1.Caption:='Наполеон Матеуш Тадеуш Орда'; //Изменяем Заглавие биографии
AssignFile(f, ExtractFilePath(paramstr(0)) + 'Биографии\OrdaBio.txt'); //Связываем файл с биографией Н. Орды
Reset(f); //Открываем файл для чтения
BioForm.Memo1.Clear; //Очищаем Memo
while not eof(f) do //Пока не конец файла, то...
begin
  Readln(f, Lines); //Считывание файла и внесение в значение переменной Lines
  BioForm.Memo1.Lines.Add(Lines); //Вносим значение Lines в Memo
end;
CloseFile(f); //Закрываем файл
BioForm.Image1.Picture.LoadFromFile(ExtractFilePath(paramstr(0)) + 'Изображения\Наполеон Орда.jpg'); //Загружаем изображение И. Лученка
BioForm.Memo1.Font.Name := 'Times New Roman'; //Устанавливаем шрифт текста в Memo
BioForm.Memo1.Font.Size :=  14; //Устанавливаем размер шрифта текста в Memo
MusForm := TMusForm.Create(Self); //Вызов процедуры структуры страницы с музыкальными произведениями
MusForm.Label2.Caption := '<<Старая песенка>>'; //Устанавливаем название 1-го примера
MusForm.MediaPlayer1.FileName := ExtractFilePath(paramstr(0)) + 'Аудиофайлы\OrdaMus1.mp3'; //Связываем 1-й медиаплеер с файлом
MusForm.MediaPlayer1.Open;
MusForm.Label3.Caption := '<<Северная звезда>>'; //Устанавливаем название 2-го примера
MusForm.MediaPlayer2.FileName := ExtractFilePath(paramstr(0)) + 'Аудиофайлы\OrdaMus2.mp3'; //Связываем 2-й медиаплеер с файлом
MusForm.MediaPlayer2.Open;
MusForm.Label4.Caption := 'Вальс'; //Устанавливаем название 3-го примера
MusForm.MediaPlayer3.FileName := ExtractFilePath(paramstr(0)) + 'Аудиофайлы\OrdaMus3.mp3'; //Связываем 3-й медиаплеер с файлом
MusForm.MediaPlayer3.Open;
BioForm.Show; //Выводим готовую страницу с биографией Н. Орды
end;


//Процедура для работы с информацией о Г. Вагнере
procedure TMainForm.VagnerBtnClick(Sender: TObject);
var f: TextFile;
    Lines: string;
begin
MainForm.Hide; //Скрывем главную форму
BioForm := TBioForm.Create(Self); //Вызываем процедуру структуры страницы
BioForm.Label1.Caption:='Генрих Матусович Вагнер'; //Изменяем Заглавие биографии
AssignFile(f, ExtractFilePath(paramstr(0)) + 'Биографии\VagnerBio.txt'); //Связываем файл с биографией Г. Вагнера
Reset(f); //Открываем файл для чтения
BioForm.Memo1.Clear; //Очищаем Memo
while not eof(f) do //Пока не конец файла, то...
begin
  Readln(f, Lines); //Считывание файла и внесение в значение переменной Lines
  BioForm.Memo1.Lines.Add(Lines); //Вносим значение Lines в Memo
end;
CloseFile(f); //Закрываем файл
BioForm.Image1.Picture.LoadFromFile(ExtractFilePath(paramstr(0)) + 'Изображения\Генрих Вагнер.jpg'); //Загружаем изображение Г. Вагнера
BioForm.Memo1.Font.Name := 'Times New Roman'; //Устанавливаем шрифт текста в Memo
BioForm.Memo1.Font.Size :=  14; //Устанавливаем размер шрифта текста в Memo
MusForm := TMusForm.Create(Self); //Вызов процедуры структуры страницы с музыкальными произведениями
MusForm.Label2.Caption := '<<Вечно живые>>'; //Устанавливаем название 1-го примера
MusForm.MediaPlayer1.FileName := ExtractFilePath(paramstr(0)) + 'Аудиофайлы\VagnerMus1.mp3'; //Связываем 1-й медиаплеер с файлом
MusForm.MediaPlayer1.Open;
MusForm.Label3.Caption := '<<Подставная невеста>>'; //Устанавливаем название 2-го примера
MusForm.MediaPlayer2.FileName := ExtractFilePath(paramstr(0)) + 'Аудиофайлы\VagnerMus2.mp3'; //Связываем 2-й медиаплеер с файлом
MusForm.MediaPlayer2.Open;
MusForm.Label4.Caption := '<<Свет и тени>>'; //Устанавливаем название 3-го примера
MusForm.MediaPlayer3.FileName := ExtractFilePath(paramstr(0)) + 'Аудиофайлы\VagnerMus3.mp3'; //Связываем 3-й медиаплеер с файлом
MusForm.MediaPlayer3.Open;
BioForm.Show; //Выводим готовую страницу с биографией Г. Вагнера
end;

end.
