$(function()
{
	
	$("input[id$='date_from'], input[id$='date_till']").livequery(function() {
	 alert('date');	
     $.datepick.setDefaults({dateFormat: 'dd/mm/yy'});
     $(this).datepick({defaultDate: null});
  	});
	
});	