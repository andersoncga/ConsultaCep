unit Consulta.Service.OpenCep;

interface

uses
  System.JSON,
  IdHTTP,
  iConsulta.Service.Interfaces,
  System.SysUtils;


type
  TOpenCEPService = class(TInterfacedObject, iConsultaService)
    public
       function ConsultaCep(ACep: string): string;
  end;

implementation

{ TOpenCEPService }

function TOpenCEPService.ConsultaCep(ACEP: string): string;
var
  LIdHttp: TIdHTTP;
  LResponse: string;
  LJSONResponse: TJSONObject;
begin
  Result := '';
  LIdHttp := TIdHTTP.Create(nil);

  try
    try
      LResponse := LIdHttp.Get('https://opencep.com/v1/' + ACEP);
      LJSONResponse := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(LResponse), 0) as TJSONObject;
      try
        if Assigned(LJSONResponse) then
        begin
          Result := 'Origem: OpenCEP ' + sLineBreak +
                    'Logradouro:' + LJSONResponse.GetValue('logradouro').Value + sLineBreak +
                    'Bairro: ' + LJSONResponse.GetValue('bairro').Value + sLineBreak +
                    'Cidade: ' + LJSONResponse.GetValue('localidade').Value + sLineBreak +
                    'Estado: ' + LJSONResponse.GetValue('uf').Value + sLineBreak +
                    'Hora: ' + DateTimeToStr(Now);
        end;
      finally
        LJSONResponse.Free;
      end;
    except on E: Exception do
      Result := 'Erro ao consultar OpenCEP: ' + E.Message;
    end;
  finally
    LIdHttp.Free;
  end;
end;

end.
