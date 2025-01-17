unit Consulta.Service.Factory;

interface

uses
  System.StrUtils,
  iConsulta.Service.Interfaces,
  Consulta.Service.ViaCep,
  Consulta.Service.OpenCep;

type
  TConsultaServiceFactory = class
    public
      class function CreateService(AServiceType: string): iConsultaService;
  end;

implementation


class function TConsultaServiceFactory.CreateService(AServiceType: string): iConsultaService;
begin
  case AnsiIndexStr(AServiceType, ['ViaCep', 'OpenCep']) of
    0: Result := TViaCEPService.Create;
    1: Result := TOpenCEPService.Create;
  end;
end;

end.
