unit utility;

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
  System.JSON;


function capturaClick(RadioAtivo: TRadioButton; RadioInativo:TRadioButton; var status: Integer):boolean;
function capturaValorIdCombobox(combobox: TCombobox): Integer;
procedure clearFilds(Sender: TObject);
implementation

function capturaClick(RadioAtivo: TRadioButton; RadioInativo:TRadioButton; var status: Integer):boolean;


begin
  if RadioAtivo.Checked  then
    begin
      status := 1;
      Result := true;
    end
  else if RadioInativo.Checked then
    begin
      status := 0;
      Result := true;
    end
  else
    Result := false;
end;

function capturaValorIdCombobox(combobox: TCombobox): Integer;
var chaveSelecionada: Integer;
begin
   chaveSelecionada := Integer(comboBox.Items.Objects[ComboBox.ItemIndex]);
   Result := chaveSelecionada;
end;

procedure clearFilds(Sender: TObject);
var  I : Integer;
begin
  for I := 0  to Tform(Sender).ComponentCount - 1  do
    begin
     if (Tform(Sender).Components[I] is TCustomEdit) or  (Tform(Sender).Components[I] is TCustomComboBox)   then
      if TEdit(Tform(Sender).Components[I]).Text <> EmptyStr then
      begin
        TEdit(Tform(Sender).Components[I]).Text := EmptyStr;
      end;
  end;
end;

end.
