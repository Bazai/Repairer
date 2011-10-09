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
//
//    $('#remove_brand').live('click', function(){
//        console.log(543);
//        console.log($("#brands option:selected").text);
//        $.ajax({
//            type: "delete",
//            url: "/modifications/remove_brand",
//            data: "brand_id=" + $("#brands option:selected").val
//        });
//    });
});