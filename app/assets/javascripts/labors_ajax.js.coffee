jQuery ->

    $('#labors').live('change', () ->
        id = $("#labors option:selected").val()
        $.ajax
            type: "get",
            url: "/labors_ajax/edit",
            data: "labor_id=" + id,
    )

    $('#add_labor').live('click', () ->
        $("#labors option:selected").removeAttr("selected")
        $.ajax
            type: "get",
            url: "/labors_ajax/new",
            data: "maintenance_id=" + $("#maintenances option:selected").val()
    )

    $('#remove_labor').live('click', () ->
        $.ajax
            type: "delete",
            url: "/labors_ajax/destroy",
            data: "labor_id=" + $("#labors option:selected").val()\
                  + "&maintenance_id=" + $("#maintenances option:selected").val()
    )

    $('#add_save_labor').live('click', () ->
        $.ajax
            type: "post",
            url: "/labors_ajax/create",
            data: "[labor][description]=" + $("#labor_description").val()\
                  + "&[labor][name]=" + $("#labor_name").val()\
                  + "&maintenance_id=" + $("#maintenances option:selected").val()
    )

    $('#update_save_labor').live('click', () ->
        $.ajax
            type: "post",
            url: "/labors_ajax/update",
            data: "[labor][description]=" + $("#labor_description").val()\
                  + "&[labor][name]=" + $("#labor_name").val()\
                  + "&labor_id=" + $("#labors option:selected").val()
    )


    $("#cancel_save_labor").live('click', () ->
        $("#add_labor").text("Добавить")
        $("#cancel_save_labor").remove()
    )

