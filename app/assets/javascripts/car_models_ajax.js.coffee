jQuery ->

    # Выделение Модели в списке
    $('#car_models').live('change', () ->
        id = $("#car_models option:selected").val()
        $.ajax
            type: "get",
            url: "/car_models_ajax/edit",
            data: "car_model_id=" + id,
            success: () -> $.get("/modifications/clear", "from=car_model&edit=" + id)
    )

    # Изменение формы для добавление Модели
    $('#add_car_model').live('click', () ->
        $("#car_models option:selected").removeAttr("selected")
        $.ajax
            type: "get",
            url: "/car_models_ajax/new",
            data: "brand_id=" + $("#brands option:selected").val(),
            success: () -> $.get("/modifications/clear", "from=car_model")
    )

    # Удаление Модели
    $('#remove_car_model').live('click', () ->
        $.ajax
            type: "get",
            url: "/car_models_ajax/destroy",
            data: "brand_id=" + $("#brands option:selected").val()\
                  + "&car_model_id=" + $("#car_models option:selected").val(),
            success: () -> $.get("/modifications/clear", "from=car_model")
    )

    # Добавление новой Модели
    $('#add_save_car_model').live('click', () ->
        $.ajax
            type: "get",
            url: "/car_models_ajax/create",
            data: "[car_model][name]=" + $("#car_model_name").val()\
                  + "&[car_model][description]=" + $("#car_model_description").val()\
                  + "&brand_id=" + $("#brands option:selected").val()
    )

    # Сохранение изменений Модели
    $('#update_save_car_model').live('click', () ->
        $.ajax
            type: "get",
            url: "/car_models_ajax/update",
            data: "[car_model][name]=" + $("#car_model_name").val()\
                  + "&[car_model][description]=" + $("#car_model_description").val()\
                  + "&brand_id=" + $("#brands option:selected").val()\
                  + "&car_model_id=" + $("#car_models option:selected").val()
    )


    $("#cancel_save_car_model").live('click', () ->
        $("#add_car_model").text("Добавить")
        $("#cancel_save_car_model").remove()
    )

