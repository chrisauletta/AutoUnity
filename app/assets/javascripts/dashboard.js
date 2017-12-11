// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function($){

$('td#status').each(function() {
  if ($(this).text() == 'Cotaçao') {
      $('tr#t2').style('color', 'red');
  } // similarly for other statuses
});
}