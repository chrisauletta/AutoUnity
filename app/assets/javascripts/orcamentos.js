// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function($){
  $('#modal').html("<%= render 'orcamentos/modal/modal_pecaOrc', pecas_orc: @pecas_orc %>");
  $('#modal').html("<%= render 'orcamentos/modal/modal_servicoOrc', pecas_orc: @pecas_orc %>");
}

