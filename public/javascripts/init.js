var args = new Array();
args[0] = null;
args[1] = null;
args[2] = null;
args[3] = null;

var query = null;

$(document).ready(function(){

  $("#filter_exam_1").click(function() { setFilter(0, 1); return false; });;
  $("#filter_exam_0").click(function() { setFilter(0, 0); return false; });;
  $("#filter_exam_null").click(function() { setFilter(0, null); return false; });;
  $("#filter_country").change(function() { setFilter(1, $(this).val()); });;
  $("#filter_display_schools").click(function() { setFilter(2, $(this).val()); });;
  $("#filter_display_employers").click(function() { setFilter(2, $(this).val()); });;
  $("#slider_in .item a").click(function() {
    var rel = $(this).attr("rel").split("_");
    var sphere_id = rel[1];
    setFilter(3, sphere_id);
    return false;
  });
  
  $("#search_phrase").focus(function() { if($(this).val() == 'Zadejte hledaný výraz') $(this).val(''); });
  $("#search_phrase").blur(function() { if($(this).val() == '') $(this).val('Zadejte hledaný výraz'); });

  // SERIAL SCROLL SLIDER
  $('#slider').serialScroll({
		target:'#slider_in',
		items:'li', // Selector to the items ( relative to the matched elements, '#sections' in this case )
		prev:'a.prev',// Selector to the 'prev' button (absolute!, meaning it's relative to the document)
		next:'a.next',// Selector to the 'next' button (absolute too)
		axis:'x',// The default is 'y' scroll on both ways
		//navigation:'#navigation li a',
		duration:900,// Length of the animation (if you scroll 2 axes and use queue, then each axis take half this time)
		force:true, // Force a scroll to the element specified by 'start' (some browsers don't reset on refreshes)

		//queue:false,// We scroll on both axes, scroll both at the same time.
		//event:'click',// On which event to react (click is the default, you probably won't need to specify it)
		//stop:false,// Each click will stop any previous animations of the target. (false by default)
		//lock:true, // Ignore events if already animating (true by default)
		start: 0, // On which element (index) to begin ( 0 is the default, redundant in this case )
		cycle:true,// Cycle endlessly ( constant velocity, true is the default )
		step:2, // How many items to scroll each time ( 1 is the default, no need to specify )
		//jump:false, // If true, items become clickable (or w/e 'event' is, and when activated, the pane scrolls to them)
		//lazy:false,// (default) if true, the plugin looks for the items on each event(allows AJAX or JS content, or reordering)
		interval:8000, // It's the number of milliseconds to automatically go to the next
		//constant:true, // constant speed

		onBefore:function( e, elem, $pane, $items, pos ){
			/**
			 * 'this' is the triggered element
			 * e is the event object
			 * elem is the element we'll be scrolling to
			 * $pane is the element being scrolled
			 * $items is the items collection at this moment
			 * pos is the position of elem in the collection
			 * if it returns false, the event will be ignored
			 */
			 //those arguments with a $ are jqueryfied, elem isn't.
			e.preventDefault();
			if( this.blur )
				this.blur();
		},
		onAfter:function( elem ){
			//'this' is the element being scrolled ($pane) not jqueryfied
		}
	});
	
	$("#slider").mouseover(function() { $("#slider_in").trigger('stop'); });
	
});


function setFilter(index, value) {
  args[index] = value;
  var query = makeQuery();
  //alert(query);
}

function makeQuery() {
  return 'exam='+args[0]+'&country='+args[1]+'&display='+args[2]+'&sphere='+args[3];
}
