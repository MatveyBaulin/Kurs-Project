program KursProject;

uses
  Vcl.Forms,
  MainUnit in 'MainUnit.pas' {MainForm},
  Biography in 'Biography.pas' {BioForm},
  VagnerTest in '√лавна€ составл€юща€ проекта\VagnerTest.pas' {TestForm},
  Loading in '√лавна€ составл€юща€ проекта\Loading.pas' {LoadingForm},
  Music in '√лавна€ составл€юща€ проекта\Music.pas' {MusForm};

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
