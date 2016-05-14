(function($){
  $(function(){
	var h = window.innerHeight;
	h = h - 64;
	$(".autoheight").css({"height": h +"px"});
	//$(".dynamicheight").css({"width": w + "px"});

	$(window).resize(function(){
	var h = window.innerHeight;
	h = h - 64;
	$(".autoheight").css({"height": h +"px"});
	//$(".dynamicheight").css({"width": w + "px"});
  });
  
    $('.button-collapse').sideNav();
    $('.parallax').parallax();
	
	 $('.dropdown-button').dropdown({
      inDuration: 300,
      outDuration: 225,
      constrain_width: false, // Does not change width of dropdown to that of the activator
      hover: false, // Activate on hover
      gutter: 0, // Spacing from edge
      belowOrigin: true // Displays dropdown below the button
    }
  );
  
   $(document).ready(function(){
    $('.collapsible').collapsible({
      accordion : true // A setting that changes the collapsible behavior to expandable instead of the default accordion style
    });
  });
  
    $(document).ready(function(){
    // the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
    $('.modal-trigger').leanModal();
  });
      
	   $(document).ready(function(){
    $('.collapsible').collapsible({
      accordion : true // A setting that changes the collapsible behavior to expandable instead of the default accordion style
    });
  });
  
  $(document).ready(function(){
	  
      $('.slider').slider({
		  full_width: true,
		  
		  });
    });
	$(document).ready(function(){
    $('.tabs-wrapper').pushpin({ top: $('.tabs-wrapper').offset().top });
  });
	$(document).ready(function(){
    $('.scrollspy').scrollSpy();
  });
  
//	$(document).ready(function() {
//var stickyNavTop = $('.table-of-contents').offset().top;
 
//var stickyNav = function(){
//var scrollTop = $(window).scrollTop();
      
//if (scrollTop > stickyNavTop) { 
//    $('.table-of-contents').addClass('sticky');
//} else {
//    $('.table-of-contents').removeClass('sticky'); 
//}
//};
 
//stickyNav();
 
//$(window).scroll(function() {
//    stickyNav();
//});
//});
//$(document).ready(function(){
//    $('.materialboxed').materialbox();
//  });
        
        
  }); // end of document ready
})(jQuery); // end of jQuery name space