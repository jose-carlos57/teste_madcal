unit module.orcamento;


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
  Vcl.CheckLst,
  Vcl.ComCtrls,
  Vcl.Mask,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef,
  FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client,
  FireDAC.Stan.Param,
  FireDAC.DatS,
  FireDAC.DApt.Intf,
  FireDAC.DApt,
  FireDAC.Comp.DataSet,
  module.tbPrecos,
  module.produtos,
  module.politica.precos,
  utility,
  module.contas,
  System.JSON;


function InserirDadosOrcamento(FDConnection: TFDConnection; nome_cliente:string; telefone_cliente: string; nome_Vendedor: string; telefone_vendedor: string;tipo_pagamento: string;id_tabela_preco: integer;id_produto: integer; desconto: string): integer;

implementation

function InserirDadosOrcamento(FDConnection: TFDConnection; nome_cliente:string ;telefone_cliente: string; nome_Vendedor: string;telefone_vendedor: string; tipo_pagamento: string; id_tabela_preco: integer;id_produto: integer; desconto: string): integer;
var
  FDQuery: TFDQuery;
begin

FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := FDConnection;
    FDQuery.SQL.Text := 'INSERT INTO orcamento (nome_cliente, telefone_cliente, nome_vendedor, telefone_vendedor, forma_pagamento, tabela_de_preco, id_produto, desconto ) VALUES (:nome_cliente, :telefone_cliente, :nome_vendedor, :telefone_vendedor, :forma_pagamento, :tabela_de_preco, :id_produto, :desconto)';

    // Define os parāmetros
    FDQuery.ParamByName('nome_cliente').AsString := nome_cliente;
    FDQuery.ParamByName('telefone_cliente').AsString := telefone_cliente;
    FDQuery.ParamByName('nome_vendedor').AsString := nome_vendedor;
    FDQuery.ParamByName('telefone_vendedor').AsString := telefone_vendedor;
    FDQuery.ParamByName('forma_pagamento').AsString := tipo_pagamento;
    FDQuery.ParamByName('tabela_de_preco').AsInteger := id_tabela_preco;
    FDQuery.ParamByName('id_produto').AsInteger := id_produto;
    FDQuery.ParamByName('desconto').AsString := desconto ;
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

end.
