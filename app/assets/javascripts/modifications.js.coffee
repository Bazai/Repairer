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
            data: "car_model_id=" + $("#car_models option:selected").val()
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
            data: "production_year_id=" + $("#production_years option:selected").val()
            success: () -> $.get("/modifications/clear", "from=maintenance")
    )

    $('#remove_maintenance').live('click', () ->
        $.ajax
            type: "get",
            url: "/modifications/remove_maintenance",
            data: "maintenance_id=" + $("#maintenances option:selected").val()\
                  + "&production_year_id=" + $("#production_years option:selected").val()
            success: () -> $.get("/modifications/clear", "from=maintenance")
    )

    $('#add_save_maintenance').live('click', () ->
        $.ajax
            type: "get",
            url: "/modifications/add_maintenance",
            data: "[maintenance][description]=" + $("#maintenance_description").val()\
                  + "&[maintenance][price]=" + $("#maintenance_price").val()\
                  + "&[maintenance][mileage]=" + $("#maintenance_mileage").val()\
                  + "&production_year_id=" + $("#production_years option:selected").val()
    )

    $('#update_save_maintenance').live('click', () ->
        $.ajax
            type: "get",
            url: "/modifications/save_maintenance",
            data: "[maintenance][description]=" + $("#maintenance_description").val()\
                  + "&[maintenance][price]=" + $("#maintenance_price").val()\
                  + "&[maintenance][mileage]=" + $("#maintenance_mileage").val()\
                  + "&maintenance_id=" + $("#maintenances option:selected").val()
    )





    $('#labors').live('change', () ->
        id = $("#labors option:selected").val()
        $.ajax
            type: "get",
            url: "/modifications/edit_labor",
            data: "labor_id=" + id,
#            success: () -> $.get("/modifications/clear", "from=labor&edit=" + id)
    )

    $('#add_labor').live('click', () ->
        $("#labors option:selected").removeAttr("selected")
        $.ajax
            type: "get",
            url: "/modifications/new_labor",
            data: "maintenance_id=" + $("#maintenances option:selected").val()
#            success: () -> $.get("/modifications/clear", "from=labor")
    )

    $('#remove_labor').live('click', () ->
        $.ajax
            type: "get",
            url: "/modifications/remove_labor",
            data: "labor_id=" + $("#labors option:selected").val()\
                  + "&maintenance_id=" + $("#maintenances option:selected").val()
#            success: () -> $.get("/modifications/clear", "from=labor")
    )

    $('#add_save_labor').live('click', () ->
        $.ajax
            type: "get",
            url: "/modifications/add_labor",
            data: "[labor][description]=" + $("#labor_description").val()\
                  + "&[labor][name]=" + $("#labor_name").val()\
                  + "&maintenance_id=" + $("#maintenances option:selected").val()
    )

    $('#update_save_labor').live('click', () ->
        $.ajax
            type: "get",
            url: "/modifications/save_labor",
            data: "[labor][description]=" + $("#labor_description").val()\
                  + "&[labor][name]=" + $("#labor_name").val()\
                  + "&labor_id=" + $("#labors option:selected").val()
    )




    $('#parts').live('change', () ->
        id = $("#parts option:selected").val()
        $.ajax
            type: "get",
            url: "/modifications/edit_part",
            data: "part_id=" + id,
#            success: () -> $.get("/modifications/clear", "from=part&edit=" + id)
    )

    $('#add_part').live('click', () ->
        $("#parts option:selected").removeAttr("selected")
        $.ajax
            type: "get",
            url: "/modifications/new_part",
            data: "maintenance_id=" + $("#maintenances option:selected").val()
#            success: () -> $.get("/modifications/clear", "from=part")
    )

    $('#remove_part').live('click', () ->
        $.ajax
            type: "get",
            url: "/modifications/remove_part",
            data: "part_id=" + $("#parts option:selected").val()\
                  + "&maintenance_id=" + $("#maintenances option:selected").val()
#            success: () -> $.get("/modifications/clear", "from=part")
    )

    $('#add_save_part').live('click', () ->
        $.ajax
            type: "get",
            url: "/modifications/add_part",
            data: "[part][description]=" + $("#part_description").val()\
                  + "&[part][name]=" + $("#part_name").val()\
                  + "&maintenance_id=" + $("#maintenances option:selected").val()
    )

    $('#update_save_part').live('click', () ->
        $.ajax
            type: "get",
            url: "/modifications/save_part",
            data: "[part][description]=" + $("#part_description").val()\
                  + "&[part][name]=" + $("#part_name").val()\
                  + "&part_id=" + $("#parts option:selected").val()
    )


    $("#search_ex_part").live('keypress', () ->
        setTimeout( () ->
              $.get(
                "/modifications/search_ex_part",
                "search=" + $("#search_ex_part").val()
              )
              1
        )
    )

    $("#add_ex_part").live('click', () ->
        $.ajax
            type: "get",
            url: "/modifications/add_ex_part",
            data: "&maintenance_id=" + $("#maintenances option:selected").val()\
                  + "&part_id=" + $("#all_parts option:selected").val()
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

    $("#cancel_save_maintenance").live('click', () ->
        $("#add_maintenance").text("Добавить")
        $("#cancel_save_maintenance").remove()
    )

    $("#cancel_save_labor").live('click', () ->
        $("#add_labor").text("Добавить")
        $("#cancel_save_labor").remove()
    )

    $("#cancel_save_part").live('click', () ->
        $("#add_part").text("Добавить")
        $("#cancel_save_part").remove()
    )


