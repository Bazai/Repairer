jQuery ->
    # Выделение Бренда в списке
    $('#brands').live('change', () ->
        $.get("/modifications/edit_brand", "id=" + $("#brands option:selected").val())
    )

    # Изменение формы для добавление Бренда
    $('#add_brand').live('click', () ->
        $("#brands option:selected").removeAttr("selected")
        $.get("/modifications/new_brand")
    )

    # Удаление Бренда
    $('#remove_brand').live('click', () ->
        $.ajax
            type: "delete",
            url: "/modifications/remove_brand",
            data: "id=" + $("#brands option:selected").val()
    )

    # Сохранение Нового Бренда
    $('#add_save_brand').live('click', () ->
        $.ajax
            type: "post",
            url: "/modifications/add_brand",
            data: "name=" + $("#brand_name").val()
    )

    # Изменение Бренда
    $('#update_save_brand').live('click', () ->
        $.ajax
            type: "post",
            url: "/modifications/save_brand",
            data: "id=" + $("#brands option:selected").val() + "&name=" + $("#brand_name").val()
    )



    # Выделение Модели в списке
    $('#car_models').live('change', () ->
        $.ajax
            type: "get",
            url: "/modifications/edit_car_model",
            data: "brand_id=" + $("#brands option:selected").val()\
                  + "&car_model_id=" + $("#car_models option:selected").val()
    )

    # Изменение формы для добавление Модели
    $('#add_car_model').live('click', () ->
        $("#car_models option:selected").removeAttr("selected")
        $.ajax
            type: "get",
            url: "/modifications/new_car_model",
            data: "brand_id=" + $("#brands option:selected").val()
    )

    # Удаление Модели
    $('#remove_car_model').live('click', () ->
        $.ajax
            type: "delete",
            url: "/modifications/remove_car_model",
            data: "brand_id=" + $("#brands option:selected").val()\
                  + "&car_model_id=" + $("#car_models option:selected").val()
    )

    # Добавление новой Модели
    $('#add_save_car_model').live('click', () ->
        $.ajax
            type: "post",
            url: "/modifications/add_car_model",
            data: "[car_model][name]=" + $("#car_model_name").val()\
                  + "&[car_model][description]=" + $("#car_model_description").val()\
                  + "&brand_id=" + $("#brands option:selected").val()
    )

    # Сохранение изменений Модели
    $('#update_save_car_model').live('click', () ->
        $.ajax
            type: "post",
            url: "/modifications/save_car_model",
            data: "[car_model][name]=" + $("#car_model_name").val()\
                  + "&[car_model][description]=" + $("#car_model_description").val()\
                  + "&brand_id=" + $("#brands option:selected").val()\
                  + "&car_model_id=" + $("#car_models option:selected").val()
    )



    # Выделение Года в списке
    $('#production_years').live('change', () ->
        $.ajax
            type: "get",
            url: "/modifications/edit_production_year",
            data: "brand_id=" + $("#brands option:selected").val()\
                  + "&car_model_id=" + $("#car_models option:selected").val()\
                  + "&production_year_id=" + $("#production_years option:selected").val()
    )

    # Изменение формы для добавление Года
    $('#add_production_year').live('click', () ->
        $("#production_years option:selected").removeAttr("selected")
        $.ajax
            type: "get",
            url: "/modifications/new_production_year",
            data: "production_year_id=" + $("#production_years option:selected").val()
    )

    # Удаление Года
    $('#remove_production_year').live('click', () ->
        $.ajax
            type: "delete",
            url: "/modifications/remove_production_year",
            data: "&car_model_id=" + $("#car_models option:selected").val()\
                  + "&production_year_id=" + $("#production_years option:selected").val()
    )

    # Добавление нового Года
    $('#add_save_production_year').live('click', () ->
        $.ajax
            type: "post",
            url: "/modifications/add_production_year",
            data: "[production_year][year]=" + $("#production_year_year").val()\
                  + "&car_model_id=" + $("#car_models option:selected").val()
    )

    # Сохранение изменений Года
    $('#update_save_production_year').live('click', () ->
        $.ajax
            type: "post",
            url: "/modifications/save_production_year",
            data: "[production_year][year]=" + $("#production_year_year").val()\
                  + "&production_year_id=" + $("#production_years option:selected").val()
    )

