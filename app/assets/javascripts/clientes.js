// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function($){
$("#cliente_cep").mask("99999-099");
$("#cliente_uf").mask("AA");
$("#cliente_telefone").mask("(99)9999-9999");
$("cliente_celular").mask("(99)99999-9999");
$("#cliente_comercial").mask("(99)9999-9999");
$("#veiculo_placa").mask("AAA-9999", {placeholder: "AAA-9999"});
$("#veiculo_ano").mask("9999");

});
