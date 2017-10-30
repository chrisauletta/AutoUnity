// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function($){

$("#cliente_telefone").mask("(99)9999-9999", {placeholder:"(00)0000-0000"});
$("#cliente_celular").mask("(99)99999-9999", {placeholder:"(00)00000-0000"});
$("#cliente_comercial").mask("(99)9999-9999", {placeholder:"(00)0000-0000"});
$("#cliente_email").attr("placeholder", "email@dominio");

$("#veiculo_placa").mask("AAA-9999", {placeholder: "AAA-9999", 'translation': {
    A: {pattern: /[A-Za-z]/}}
});
$("#veiculo_ano").mask("9999");

$("#endereco_uf").mask("AA", {placeholder:"AA"});
$("#endereco_numero").mask("9999");
$("#endereco_cep").mask("99999-999", {placeholder:"00000-000"});

document.getElementById(orcamento_status) = disabled;

});

function muda(el, id) {
    document.getElementById(id).disabled = !el.checked;
}
