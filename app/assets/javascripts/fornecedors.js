// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function($){

$("#fornecedor_telefone").mask("(99)9999-9999", {placeholder:"(00)0000-0000"});


$("#fornecedor_uf").mask("AA", {placeholder:"AA"});
$("#fornecedor_numero").mask("9999");
$("#fornecedor_cep").mask("99999-999", {placeholder:"00000-000"});

});