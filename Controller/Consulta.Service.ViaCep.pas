unit Consulta.Service.ViaCep;

interface

uses
  iConsulta.Service.Interfaces,
  System.SysUtils,
  System.JSON,
  IdHTTP,
  IdSSLOpenSSL;

type
  TViaCEPService = class(TInterfacedObject, iConsultaService)
  public
    function ConsultaCep(ACep: string): string;
  end;

implementation

function TViaCEPService.ConsultaCep(ACep: string): string;
var
  LIdHttp: TIdHTTP;
  LResponse: string;
  LJSONResponse: TJSONObject;
  LIdSSL: TIdSSLIOHandlerSocketOpenSSL;
begin
  Result := '';
  LIdSSL :=  TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  LIdSSL.SSLOptions.Method := sslvTLSv1_2;
  LIdSSL.SSLOptions.SSLVersions := [sslvSSLv23];
  LIdHttp := TIdHTTP.Create(nil);
  LIdHttp.IOHandler := LIdSSL;

  try
    try
      LResponse := LIdHttp.Get('https://viacep.com.br/ws/' + ACEP + '/json');
      LJSONResponse := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(LResponse), 0) as TJSONObject;
      try
        if Assigned(LJSONResponse) then
        begin
          Result := 'Origem: ViaCEP ' + sLineBreak +
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
      Result := 'Erro ao consultar ViaCEP: ' + E.Message;
    end;
  finally
    LIdHttp.Free;
    LIdSSL.Free;
  end;
end;

end.
