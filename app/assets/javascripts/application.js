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
    $('#brand').live('change', function(){
        console.log($("#brand").val());
        $.ajax({
            type: "get",
            url: "showselects",
            data: "brand_id=" + $("#brand").val()
        });
    });
    $('#car_model').live('change', function(){
        console.log($("#car_model").val());
        $.ajax({
            type: "get",
            url: "showselects",
            data: "car_model_id=" + $("#car_model").val() + "&brand_id=" + $("#brand").val()
        });
    });
    $('#production_year').live('change', function(){
        console.log($("#production_year").val());
        $.ajax({
            type: "get",
            url: "showselects",
            data: "production_year_id=" + $("#production_year").val() + "&car_model_id=" + $("#car_model").val() + "&brand_id=" + $("#brand").val()
        });
    });
});