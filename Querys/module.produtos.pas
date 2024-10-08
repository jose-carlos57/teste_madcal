unit module.produtos;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  Vcl.Buttons,
  Vcl.StdCtrls,
  Vcl.CheckLst, Vcl.ComCtrls, Vcl.Mask, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet,
  System.JSON;


function inserirDadosProdutos(FDConnection: TFDConnection; const descricao : string; const unidadeMedida : double;var cd_status: Integer): Integer;
function buscarDadosComboBoxProdutos(FDConnection: TFDConnection; combobox: TCombobox):boolean;

implementation

function inserirDadosProdutos(FDConnection: TFDConnection; const descricao : string; const unidadeMedida : double  ;var cd_status: Integer): Integer;
Var FDQuery: TFDQuery;
begin
FDQuery := TFDQuery.Create(nil);
 Result := -1;
  try
    FDQuery.Connection := FDConnection;
    FDQuery.SQL.Text := 'INSERT INTO produtos (descricao, unidade_medida,  cd_status) VALUES (:descricao, :unidade_medida, :cd_status)';

    // Define os parāmetros
    FDQuery.ParamByName('descricao').AsString := descricao;
    FDQuery.ParamByName('unidade_medida').AsFloat := unidadeMedida;
    FDQuery.ParamByName('cd_status').AsInteger := cd_status;

    // Executa a query

    try
      FDQuery.ExecSQL;

    FDQuery.SQL.Text := 'SELECT LAST_INSERT_ID()';
    FDQuery.Open;
    Result := FDQuery.Fields[0].AsInteger;
    except
      ShowMessage('Erro ao inserir dados!')
    end;
  finally
    FDQuery.Free;
  end;
end;

function buscarDadosComboBoxProdutos(FDConnection: TFDConnection; combobox: TCombobox):boolean;
var
  FDQuery: TFDQuery;
  objJsonItens: TJSONObject;

begin

  objJsonItens := TJSONObject.Create;

  FDQuery := TFDQuery.Create(nil);
  FDQuery.Connection := FDConnection;
  FDQuery.SQL.Text := 'SELECT * FROM produtos WHERE cd_status = :cd_status'; //1 = ativo  0 = inativo
  FDQuery.ParamByName('cd_Status').AsInteger := 1;

  try
    FDQuery.Open;

    if not FDQuery.IsEmpty then
     begin
      while not FDQuery.Eof do
        begin
         Combobox.Items.AddObject(FDQuery.FieldByName('descricao').AsString,
                       TObject(FDQuery.FieldByName('id_produtos').AsInteger));
         FDQuery.Next;
         end;
      end;
  finally

  end;
end;

end.
