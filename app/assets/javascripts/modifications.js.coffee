jQuery ->

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
