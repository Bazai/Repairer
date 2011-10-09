jQuery ->
	# Изменение списка брэндов
    $('#brand').live('change', () ->
        $.ajax
            type: "get",
            url: "showselects",
            data: "brand_id=" + $("#brand").val()
    )

	# Изменение списка моделей
	$('#car_model').live('change', () ->
        $.ajax
            type: "get",
            url: "showselects",
            data: "car_model_id=" + $("#car_model").val() + "&brand_id=" + $("#brand").val()
	)
	
	# Изменение списка годов выпуска
	$('#production_year').live('change', () ->
		$.ajax
            type: "get",
            url: "showselects",
            data: "production_year_id=" + $("#production_year").val() + "&car_model_id=" + $("#car_model").val() + "&brand_id=" + $("#brand").val()
	)