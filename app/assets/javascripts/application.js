// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require cocoon
//= require_tree .




$(function() {
	/*---colorbox login and reg---*/
	$(".regform").colorbox({href: "/register #new_user", opacity: 0.1, top: 0 });
	$(".loginform").colorbox({href: "/login #new_user", opacity: 0.1, top: 0 });   
     
	/*---top msg---*/    
	$('#flash_notice')
	.append('<span class="close">Закрыть</span>')
	.click(function() {
	$('#flash_notice').toggle('slow');
	});

	$('#add_part').live('click', function(){
	    console.log($("#existent_parts_ids").val());
	    $.ajax({
	        type: "get",
	        url: "/maintenances/addexpart",
	        data: "part_id=" + $("#existent_parts_ids").val()
	    });
	});

	$('#remove_ex_part').live('click', function(){
	    $('#remove_ex_part').parent("div").remove();
	});
});