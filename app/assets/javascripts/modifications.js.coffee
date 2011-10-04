# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
    $('#remove_brand').live('click', () ->
        console.log($("#brands option:selected").text())
        $.ajax
            type: "delete",
            url: "/modifications/remove_brand",
            data: "brand_id=" + $("#brands option:selected").val()
    )

    $('a#add_brand').live('click', () ->
        console.log($("#brands option:selected").text())
        $("#brands option:selected").removeAttr("selected")
#        $("#brand_form").html("<%= escape_javascript(render \"brand_list\") %>")
        $.ajax
            type: "get",
            url: "/modifications/clear_brand_form"

    )

    $('#brands').live('change', () ->
        console.log($("#brands option:selected").text())
        $.ajax
            type: "post",
            url: "/modifications/edit_brand",
            data: "brand_id=" + $("#brands option:selected").val()
    )

#    $('#save_brand').live('click', () ->
#        console.log($("#brands option:selected").first().val())
#        $.ajax
#            type: "post",
#            url: "/modifications/update_brand",
#            data: "brand_id=" + $("#brands option:selected").val() + "&brand_name=" + $("#brand_name").val()
#    )

    $('#edit_brand').live('click', () ->
        console.log($("#brands option:selected").val())
        $.ajax
            type: "post",
            url: "/modifications/edit_brand",
            data: "brand_id=" + $("#brands option:selected").val()

#        $("#brand_name").val($("#brands option:selected").text())
    )
