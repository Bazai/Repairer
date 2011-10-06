jQuery ->

    # Выделение Года в списке
    $('#production_years').live('change', () ->
        id = $("#production_years option:selected").val()
        $.ajax
            type: "get",
            url: "/production_years_ajax/edit",
            data: "production_year_id=" + id,
            success: () -> $.get("/modifications/clear", "from=production_year&edit=" + id)
    )

    # Изменение формы для добавление Года
    $('#add_production_year').live('click', () ->
        $("#production_years option:selected").removeAttr("selected")
        $.ajax
            type: "get",
            url: "/production_years_ajax/new",
            data: "car_model_id=" + $("#car_models option:selected").val()
            success: () -> $.get("/modifications/clear", "from=production_year")
    )

    # Удаление Года
    $('#remove_production_year').live('click', () ->
        $.ajax
            type: "get",
            url: "/production_years_ajax/destroy",
            data: "&car_model_id=" + $("#car_models option:selected").val()\
                  + "&production_year_id=" + $("#production_years option:selected").val()
            success: () -> $.get("/modifications/clear", "from=production_year")
    )

    # Добавление нового Года
    $('#add_save_production_year').live('click', () ->
        $.ajax
            type: "get",
            url: "/production_years_ajax/create",
            data: "[production_year][year]=" + $("#production_year_year").val()\
                  + "&car_model_id=" + $("#car_models option:selected").val()
    )

    # Сохранение изменений Года
    $('#update_save_production_year').live('click', () ->
        $.ajax
            type: "get",
            url: "/production_years_ajax/update",
            data: "[production_year][year]=" + $("#production_year_year").val()\
                  + "&production_year_id=" + $("#production_years option:selected").val()
    )


    $("#cancel_save_production_year").live('click', () ->
        $("#add_production_year").text("Добавить")
        $("#cancel_save_production_year").remove()
    )
