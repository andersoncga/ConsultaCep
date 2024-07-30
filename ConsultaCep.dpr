program ConsultaCep;

uses
  Vcl.Forms,
  View.ConsultaCep in 'View\View.ConsultaCep.pas' {ViewConsultaCep},
  iConsulta.Service.Interfaces in 'Controller\iConsulta.Service.Interfaces.pas',
  Consulta.Service.ViaCep in 'Controller\Consulta.Service.ViaCep.pas',
  Consulta.Service.OpenCep in 'Controller\Consulta.Service.OpenCep.pas',
  Consulta.Service.Factory in 'Controller\Consulta.Service.Factory.pas',
  Consulta.Service.Controller in 'Controller\Consulta.Service.Controller.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TViewConsultaCep, ViewConsultaCep);
  Application.Run;
end.
