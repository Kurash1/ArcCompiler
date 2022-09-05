namespace = es_archeology

arc_event = {
	type = province
	english = {
		name = "aba"
		desc = "abacsfr"
	}
	picture = TRADEGOODS_eventPicture
	
	arc_option = {
		english = {
			name = "aba"
		}
		if {
			limit = {
				owner = { capital = "Windhelm" }
			}
			add_base_tax = 1	
		}
	}
}