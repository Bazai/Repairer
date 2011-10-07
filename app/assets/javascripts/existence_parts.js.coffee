jQuery ->

    $("#search_ex_part").live('keypress', () ->
        setTimeout( () ->
              $.get(
                "/existence_parts/search",
                "search=" + $("#search_ex_part").val()
              )
              1
        )
    )

    $("#add_ex_part").live('click', () ->
        $.ajax
            type: "post",
            url: "/existence_parts/add",
            data: "&maintenance_id=" + $("#maintenances option:selected").val()\
                  + "&part_id=" + $("#all_parts option:selected").val()
    )
