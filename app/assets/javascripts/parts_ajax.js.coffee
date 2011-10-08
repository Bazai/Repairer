jQuery ->

    $('#parts').live('change', () ->
        id = $("#parts option:selected").val()
        $.ajax
            type: "get",
            url: "/parts_ajax/edit",
            data: "part_id=" + id,
    )

    $('#add_part').live('click', () ->
        $("#parts option:selected").removeAttr("selected")
        $.ajax
            type: "get",
            url: "/parts_ajax/new",
            data: "maintenance_id=" + $("#maintenances option:selected").val()
    )

    $('#remove_part').live('click', () ->
        $.ajax
            type: "get",
            url: "/parts_ajax/destroy",
            data: "part_id=" + $("#parts option:selected").val()\
                  + "&maintenance_id=" + $("#maintenances option:selected").val()
    )

    $('#add_save_part').live('click', () ->
        $.ajax
            type: "get",
            url: "/parts_ajax/create",
            data: "[part][description]=" + $("#part_description").val()\
                  + "&[part][name]=" + $("#part_name").val()\
                  + "&maintenance_id=" + $("#maintenances option:selected").val()
    )

    $('#update_save_part').live('click', () ->
        $.ajax
            type: "get",
            url: "/parts_ajax/update",
            data: "[part][description]=" + $("#part_description").val()\
                  + "&[part][name]=" + $("#part_name").val()\
                  + "&part_id=" + $("#parts option:selected").val()
    )


    $("#cancel_save_part").live('click', () ->
        $("#add_part").text("Добавить")
        $("#cancel_save_part").remove()
    )
