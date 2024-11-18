unit VagnerTest;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.jpeg, Vcl.ExtCtrls,
  Vcl.StdCtrls;

type
  TVagnerTForm = class(TForm)
    Image2: TImage;
    Button2: TButton;
    RadioGroup2: TRadioGroup;
    RadioGroup1: TRadioGroup;
    Button3: TButton;
    Label1: TLabel;
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure RadioGroup2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  VagnerTForm: TVagnerTForm;
  f: text;
  s: string;
  Nvern, ball: integer;

implementation

{$R *.dfm}

uses Biography, MainUnit;

procedure TVagnerTForm.Button2Click(Sender: TObject);
begin
VagnerTForm.Hide;
MainForm.Show;
end;

procedure TVagnerTForm.RadioGroup2Click(Sender: TObject);
begin
RadioGroup1.Enabled:=false; //Выбор варианта становится недоступен
RadioGroup2.Enabled:=true; //Доступным становится поле с вопросом
Button3.Enabled:=true; //Кнопка Далее
case RadioGroup1.ItemIndex of //В зависимости от выбранного варианта переменная f
0: AssignFile( f ,'C:\Работы 2 Курса\Курсовая Работа\Документация\Тесты\VagnerTest.txt');//связывается с разными файлами
1: AssignFile( f ,'C:\Работы 2 Курса\Курсовая Работа\Документация\Тесты\VagnerTest2.txt');
end;
reset(f); //Открываем файл для чтения
readln(f,s); //Считываем первую строку из файла
ball:=0; //изначально количество баллов 0
repeat
if (s[1]='-') then begin //Если первый символ строки ‘-‘ значит это вопрос
delete(s,1,1);
RadioGroup2.Caption:=s;
end
else if s[1]='*' then begin //Если перв символ ‘*’ значит это номер верного ответа
delete(s,1,1);
Nvern:=StrToInt(s);
end
else RadioGroup2.Items.Add(s); //Иначе это вариант ответа
readln(f,s); //Считываем следующую строку из файла
until (s[1]='-') or (Eof(f));
end;

procedure TVagnerTForm.Button3Click(Sender: TObject);
begin
if (RadioGroup2.ItemIndex>-1) and (not Eof(f)) then begin
if RadioGroup2.ItemIndex = Nvern-1 then ball:=ball+1; //Если выбранный вариант соответствует
RadioGroup2.Items.Clear; //номеру верного ответа то балл прибавляется
Repeat //и очищается поле для следующего вопроса
if (s[1]='-') then begin
delete(s,1,1);
RadioGroup2.Caption:=s;
end
else if s[1]='*' then begin
delete(s,1,1);
Nvern:=StrToInt(s);
end
else RadioGroup2.Items.Add(s);
readln(f,s);
Label1.Caption:=s;
until (s[1]='-') or (Eof(f));
end
//Если конец файла достигнут, значит вопросы закончились
Else if Eof(f) then begin
delete(s,1,1);
Nvern:=StrToInt(s);
if RadioGroup2.ItemIndex = Nvern-1 then ball:=ball+1;
Label1.Caption:=IntToStr(ball); //Вывод количества баллов
CloseFile(f);
Button3.Enabled:=False; //кнопка становится недоступной в завершении проекта
end;
end;

end.
