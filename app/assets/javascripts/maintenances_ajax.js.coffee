jQuery ->

    $('#maintenances').live('change', () ->
        id = $("#maintenances option:selected").val()
        $.ajax
            type: "get",
            url: "/maintenances_ajax/edit",
            data: "maintenance_id=" + id,
            success: () -> $.get("/modifications/clear", "from=maintenance&edit=" + id)
    )

    $('#add_maintenance').live('click', () ->
        $("#maintenances option:selected").removeAttr("selected")
        $.ajax
            type: "get",
            url: "/maintenances_ajax/new",
            data: "production_year_id=" + $("#production_years option:selected").val()
            success: () -> $.get("/modifications/clear", "from=maintenance")
    )

    $('#remove_maintenance').live('click', () ->
        $.ajax
            type: "delete",
            url: "/maintenances_ajax/destroy",
            data: "maintenance_id=" + $("#maintenances option:selected").val()\
                  + "&production_year_id=" + $("#production_years option:selected").val()
            success: () -> $.get("/modifications/clear", "from=maintenance")
    )

    $('#add_save_maintenance').live('click', () ->
        $.ajax
            type: "post",
            url: "/maintenances_ajax/create",
            data: "[maintenance][description]=" + $("#maintenance_description").val()\
                  + "&[maintenance][price]=" + $("#maintenance_price").val()\
                  + "&[maintenance][mileage]=" + $("#maintenance_mileage").val()\
                  + "&production_year_id=" + $("#production_years option:selected").val()
    )

    $('#update_save_maintenance').live('click', () ->
        $.ajax
            type: "post",
            url: "/maintenances_ajax/update",
            data: "[maintenance][description]=" + $("#maintenance_description").val()\
                  + "&[maintenance][price]=" + $("#maintenance_price").val()\
                  + "&[maintenance][mileage]=" + $("#maintenance_mileage").val()\
                  + "&maintenance_id=" + $("#maintenances option:selected").val()
    )

    $("#cancel_save_maintenance").live('click', () ->
        $("#add_maintenance").text("Добавить")
        $("#cancel_save_maintenance").remove()
    )

