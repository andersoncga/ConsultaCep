unit Consulta.Service.Controller;

interface

uses
  Consulta.Service.Factory,
  iConsulta.Service.Interfaces,
  System.SysUtils;

type
  TConsultaServiceController = class
    private
      FServiceType: string;

    public
      constructor Create(AServiceType: string);
      function ConsultaCep(ACep: string): string;
  end;

implementation

{ TConsultaServiceController }

constructor TConsultaServiceController.Create(AServiceType: string);
begin
  FServiceType := AServiceType;
end;

function TConsultaServiceController.ConsultaCep(ACep: string): string;
var
  LService: iConsultaService;
begin
  LService := TConsultaServiceFactory.CreateService(FServiceType);
  try
    Result := LService.ConsultaCep(ACeP);
  except
  on E: Exception do
    Result := 'Não foi possível obter o endereço para o CEP informado.';
  end;
end;

end.
