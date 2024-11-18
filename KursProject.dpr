program KursProject;

uses
  Vcl.Forms,
  MainUnit in 'MainUnit.pas' {MainForm},
  Biography in 'Biography.pas' {BioForm},
  VagnerTest in '������� ������������ �������\VagnerTest.pas' {TestForm},
  Loading in '������� ������������ �������\Loading.pas' {LoadingForm},
  Music in '������� ������������ �������\Music.pas' {MusForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TBioForm, BioForm);
  Application.CreateForm(TTestForm, TestForm);
  Application.CreateForm(TLoadingForm, LoadingForm);
  Application.CreateForm(TMusForm, MusForm);
  Application.Run;
end.
