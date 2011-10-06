jQuery ->
    # Выделение Бренда в списке
    $('#brands').live('change', () ->
        id = $("#brands option:selected").val()
        $.get("/modifications/edit_brand", "id=" + id).success( () ->
            $.get("/modifications/clear", "from=brand&edit=" + id)
        )
    )

    # Изменение формы для добавление Бренда
    $('#add_brand').live('click', () ->
        $("#brands option:selected").removeAttr("selected")
        $.get("/modifications/new_brand").success( () ->
            $.get("/modifications/clear", "from=brand")
        )
    )

    # Удаление Бренда
    $('#remove_brand').live('click', () ->
        $.get("/modifications/remove_brand", "id=" + $("#brands option:selected").val()).success( () ->
            $.get("/modifications/clear", "from=brand")
        )
    )

    # Сохранение Нового Бренда
    $('#add_save_brand').live('click', () ->
        $.get("/modifications/add_brand", "name=" + $("#brand_name").val())
    )

    # Изменение Бренда
    $('#update_save_brand').live('click', () ->
        $.get("/modifications/save_brand", "id=" + $("#brands option:selected").val() + "&name=" + $("#brand_name").val())
    )




    # Выделение Модели в списке
    $('#car_models').live('change', () ->
        id = $("#car_models option:selected").val()
        $.ajax
            type: "get",
            url: "/modifications/edit_car_model",
            data: "car_model_id=" + id,
            success: () -> $.get("/modifications/clear", "from=car_model&edit=" + id)
    )

    # Изменение формы для добавление Модели
    $('#add_car_model').live('click', () ->
        $("#car_models option:selected").removeAttr("selected")
        $.ajax
            type: "get",
            url: "/modifications/new_car_model",
            data: "brand_id=" + $("#brands option:selected").val(),
            success: () -> $.get("/modifications/clear", "from=car_model")
    )

    # Удаление Модели
    $('#remove_car_model').live('click', () ->
        $.ajax
            type: "get",
            url: "/modifications/remove_car_model",
            data: "brand_id=" + $("#brands option:selected").val()\
                  + "&car_model_id=" + $("#car_models option:selected").val(),
            success: () -> $.get("/modifications/clear", "from=car_model")
    )

    # Добавление новой Модели
    $('#add_save_car_model').live('click', () ->
        $.ajax
            type: "get",
            url: "/modifications/add_car_model",
            data: "[car_model][name]=" + $("#car_model_name").val()\
                  + "&[car_model][description]=" + $("#car_model_description").val()\
                  + "&brand_id=" + $("#brands option:selected").val()
    )

    # Сохранение изменений Модели
    $('#update_save_car_model').live('click', () ->
        $.ajax
            type: "get",
            url: "/modifications/save_car_model",
            data: "[car_model][name]=" + $("#car_model_name").val()\
                  + "&[car_model][description]=" + $("#car_model_description").val()\
                  + "&brand_id=" + $("#brands option:selected").val()\
                  + "&car_model_id=" + $("#car_models option:selected").val()
    )





    # Выделение Года в списке
    $('#production_years').live('change', () ->
        id = $("#production_years option:selected").val()
        $.ajax
            type: "get",
            url: "/modifications/edit_production_year",
            data: "production_year_id=" + id,
            success: () -> $.get("/modifications/clear", "from=production_year&edit=" + id)
    )

    # Изменение формы для добавление Года
    $('#add_production_year').live('click', () ->
        $("#production_years option:selected").removeAttr("selected")
        $.ajax
            type: "get",
            url: "/modifications/new_production_year",
            data: "production_year_id=" + $("#production_years option:selected").val()
            success: () -> $.get("/modifications/clear", "from=production_year")
    )

    # Удаление Года
    $('#remove_production_year').live('click', () ->
        $.ajax
            type: "get",
            url: "/modifications/remove_production_year",
            data: "&car_model_id=" + $("#car_models option:selected").val()\
                  + "&production_year_id=" + $("#production_years option:selected").val()
            success: () -> $.get("/modifications/clear", "from=production_year")
    )

    # Добавление нового Года
    $('#add_save_production_year').live('click', () ->
        $.ajax
            type: "get",
            url: "/modifications/add_production_year",
            data: "[production_year][year]=" + $("#production_year_year").val()\
                  + "&car_model_id=" + $("#car_models option:selected").val()
    )

    # Сохранение изменений Года
    $('#update_save_production_year').live('click', () ->
        $.ajax
            type: "get",
            url: "/modifications/save_production_year",
            data: "[production_year][year]=" + $("#production_year_year").val()\
                  + "&production_year_id=" + $("#production_years option:selected").val()
    )





    $('#maintenances').live('change', () ->
        id = $("#maintenances option:selected").val()
        $.ajax
            type: "get",
            url: "/modifications/edit_maintenance",
            data: "maintenance_id=" + id,
            success: () -> $.get("/modifications/clear", "from=maintenance&edit=" + id)
    )

    $('#add_maintenance').live('click', () ->
        $("#maintenances option:selected").removeAttr("selected")
        $.ajax
            type: "get",
            url: "/modifications/new_maintenance",
            data: "maintenance_id=" + $("#maintenances option:selected").val()
            success: () -> $.get("/modifications/clear", "from=maintenance")
    )

    $('#remove_maintenance').live('click', () ->
        $.ajax
            type: "get",
            url: "/modifications/remove_maintenance",
            data: "&maintenance_id=" + $("#maintenances option:selected").val()\
                  + "&production_year_id=" + $("#production_years option:selected").val()
            success: () -> $.get("/modifications/clear", "from=production_year")
    )

    $('#add_save_maintenance').live('click', () ->
        $.ajax
            type: "get",
            url: "/modifications/add_maintenance",
            data: "[maintenance][description]=" + $("#maintenance_description").val()\
                  + "&[maintenance][price]=" + $("#maintenance_price").val()\
                  + "&production_year_id=" + $("#production_years option:selected").val()
    )

    $('#update_save_maintenance').live('click', () ->
        $.ajax
            type: "get",
            url: "/modifications/save_maintenance",
            data: "[maintenance][description]=" + $("#maintenance_description").val()\
                  + "&[maintenance][price]=" + $("#maintenance_price").val()\
                  + "&maintenance_id=" + $("#maintenances option:selected").val()
    )





    $("#cancel_save_brand").live('click', () ->
        $("#add_brand").text("Добавить")
        $("#cancel_save_brand").remove()
    )

    $("#cancel_save_car_model").live('click', () ->
        $("#add_car_model").text("Добавить")
        $("#cancel_save_car_model").remove()
    )

    $("#cancel_save_production_year").live('click', () ->
        $("#add_production_year").text("Добавить")
        $("#cancel_save_production_year").remove()
    )


