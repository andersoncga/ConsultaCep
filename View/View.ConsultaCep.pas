unit View.ConsultaCep;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons;

type
  TViewConsultaCep = class(TForm)
    edtCep: TEdit;
    btnConsultar: TBitBtn;
    rdgWebService: TRadioGroup;
    mmResultado: TMemo;
    procedure btnConsultarClick(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  ViewConsultaCep: TViewConsultaCep;

implementation

uses
  Consulta.Service.Controller;

{$R *.dfm}

procedure TViewConsultaCep.btnConsultarClick(Sender: TObject);
var
  LController: TConsultaServiceController;
begin
  if (edtCep.Text='') then
  begin
    ShowMessage('Informe um Cep!!');
    exit;
  end;

  LController := TConsultaServiceController.Create(rdgWebService.Items[rdgWebService.ItemIndex]);
  try
   try
     mmResultado.Clear;
     mmResultado.Lines.Add(LController.ConsultaCep(edtCep.Text));
   except
     on E: Exception do
       mmResultado.Lines.Add('Error: ' + E.Message);
    end;
  finally
    LController.Free;
  end;
end;

end.
