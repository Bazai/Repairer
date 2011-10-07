jQuery ->
    # Выделение Бренда в списке
    $('#brands').live('change', () ->
        id = $("#brands option:selected").val()
        $.get("/brands_ajax/edit", "id=" + id).success( () ->
            $.get("/modifications/clear", "from=brand&edit=" + id)
        )
    )

    # Изменение формы для добавление Бренда
    $('#add_brand').live('click', () ->
        $("#brands option:selected").removeAttr("selected")
        $.get("/brands_ajax/new").success( () ->
            $.get("/modifications/clear", "from=brand")
        )
    )

    # Удаление Бренда
    $('#remove_brand').live('click', () ->
        $.ajax
            type: "delete"
            url: "/brands_ajax/destroy"
            data: "id=" + $("#brands option:selected").val()
            success: () -> $.get("/modifications/clear", "from=brand")
    )

    # Создание Бренда
    $('#add_save_brand').live('click', () ->
        $.ajax
            type: "post"
            url: "/brands_ajax/create"
            data: "[brand][name]=" + $("#brand_name").val()
    )

    # Изменение Бренда
    $('#update_save_brand').live('click', () ->
        $.ajax
            type: "post"
            url: "/brands_ajax/update"
            data: "id=" + $("#brands option:selected").val() + "&[brand][name]=" + $("#brand_name").val()
    )

    # Отмена добавления
    $("#cancel_save_brand").live('click', () ->
        $("#add_brand").text("Добавить")
        $("#cancel_save_brand").remove()
    )
