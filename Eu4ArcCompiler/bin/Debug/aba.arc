namespace = es_archeology

arc_province_event = {
	picture = TRADEGOODS_eventPicture
	
	option = {
		name = es_archeology.1.a
		if (
			continent = tamriel
		) {
			add_base_tax = 1	
		}
	}
}