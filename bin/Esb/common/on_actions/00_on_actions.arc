#When adding effects directly in on_actions always consider if it would be best to do so through a scripted effect. on_actions with a lot of script in them are harder to get an overview of.

# country
on_startup = {

	2635 = {
		cede_province = BLA
		add_core = BLA
	}

	if = {
		limit = {
			tag = BLA
			NOT = { has_country_flag = campaign_start }
		}
		set_variable = {
			which = year
			value = 57
		}
		set_country_flag = campaign_start
		country_event = {
			id = es_ideas.0
			days = (30*365)
		}
		every_country = {
			add_stability = 2
			defines.functions.set_to_global_idea_level
			set_variable = {
				which = year_of_coronation
				value = 57
			}
			export_to_variable = {
				variable_name = age_on_coronation
				value = trigger_value:ruler_age
			}
		}
		country_event = { #Artifacts
			id = es_esb.4
		}
		
		#Bookmarks 
		if = {
			limit = { is_year = 57 NOT = { is_year = 58 } }
			country_event = {
				id = es_scenario_operator.1
				days = 0
			}
		}
	}

    set_allow_female_emperor = yes
	set_hre_religion_treaty = yes

	if = { limit = { uses_personal_deities = yes } change_available_deities = yes }
	
	mundus_towers = yes
	
	es_river_estuary = yes
	
	country_event = { id = es_start.100 }

    events = {
		es_holidays.1
		es_holidays.2
		es_holidays.3
		es_holidays.4
		es_holidays.5
		es_holidays.6
		es_holidays.7
		es_holidays.8
		es_holidays.9
		es_holidays.10
		es_holidays.11
		es_holidays.12
		es_holidays.13
		es_holidays.14
		es_holidays.15
		es_holidays.16
		es_holidays.17
		es_holidays.18
		es_holidays.19
		es_holidays.20
		es_holidays.21
		es_holidays.22
		es_holidays.23
		es_holidays.24
		es_holidays.25
		es_holidays.26
		es_holidays.27
		es_holidays.28
		es_holidays.29
		es_holidays.30
		es_holidays.31
		es_holidays.32
		es_holidays.33
		es_holidays.34
		es_holidays.35
		es_holidays.36
		es_holidays.37
		es_holidays.38
		es_holidays.39
		es_holidays.40
		es_holidays.41
		es_holidays.42
		es_holidays.43
		es_holidays.44
		es_holidays.45
		es_holidays.46
		es_holidays.47
		es_holidays.48
		es_holidays.49
		es_holidays.50
		es_holidays.51
		es_holidays.52
		es_holidays.53
		es_holidays.54
		es_holidays.55
		es_holidays.56
		es_holidays.57
		es_holidays.58
		es_holidays.59
		es_holidays.60
		es_holidays.61
		es_holidays.62
		es_holidays.63
	}
	
	if = { 
		limit = { 
			NOT = { 
				has_global_flag = on_action_set_up_global_flag 
			} 
		}
		
		# On startup every_country effects
		every_country = {
			while = {
				limit = {
					NOT = {
						crown_land_share = 40
					}
				}
				take_estate_land_share_massive = {
					estate = all
				}
			}
			randomise_religious_schools = yes
			if = {
				limit = {
					ai = no
					NOT = { has_country_flag = es_1_start_flag }
				}
				country_event = { id = es_start.1 days = 0 tooltip = es_collapse.2.a.tt }
				set_country_flag = es_1_start_flag 
			}
			
			set_country_flag = no_dark_advisors_flag
			
			es_change_opinion = yes
			es_change_country_names = yes
			change_available_deities = yes
		}

		random_country = {
			country_event = {
				id = es_province_discovery.1
			}
		}

		es_conquest_notifications_setup = yes
		
		set_forts_and_trade_centers = yes
		
		province_religious_effects = yes
		
		province_natives = yes
		#es_province_development = yes
		mundus_towers = yes
		
		es_river_estuary = yes
		
		### ES History Effects 
		if = { limit = { NOT = { is_year = 272 } } 
			history_0_272_ad = yes
		}
		if = { limit = { is_year = 272 NOT = { is_year = 535 } } 
			history_272_535_ad = yes
		}
		if = { limit = { is_year = 535 NOT = { is_year = 862 } } 
			history_535_862_ad = yes
		}
		
		# Dark Brotherhood Late Spawn
		if = {
			limit = { is_year = 862 }
			every_country = { limit = { NOT = { culture_group = velothi_cg } capital_scope = { continent = Tamriel } } country_event = { id = dark_brotherhood_spawn.5 days = 9125 } }
			every_country = { limit = { culture_group = velothi_cg } set_country_flag = dark_brotherhood_spawn_2_flag }
		}
		if = { limit = { is_year = 862 } every_country = { limit = { NOT = { culture_group = velothi_cg } capital_scope = { continent = Tamriel } } country_event = { id = dark_brotherhood_spawn.5 days = 9125 } } }
		
		
		BLA = {
			add_country_modifier = { name = "red_mountain_eruption" duration = 3650 }
			add_country_modifier = { name = "sand_storm_1" duration = 3650 }
			add_country_modifier = { name = "tropical_storm_1" duration = 3650 }	
			add_country_modifier = { name = "floods_1" duration = 3650 }
			add_country_modifier = { name = "ice_age_1" duration = 3650 }
			add_country_modifier = { name = "rise_time" duration = 3650 }
			add_country_modifier = { name = "crisis_time" duration = 3650 }	
			add_country_modifier = { name = "trade_time" duration = 3650 }
			
			#es_remove_countries_for_perfomance = yes
			
			# Vvardenfell Ashlands
			vvardenfell_lr = {
				if = {
					limit = {
						province_distance = { who = 1062 distance = 0 }
						NOT = { province_distance = { who = 1062 distance = 70 } }
					}
					add_permanent_province_modifier = { name = "thick_permanent_ashland" duration = -1 }
				}
				else_if = {
					limit = {
						province_distance = { who = 1062 distance = 70
					 }
						NOT = { province_distance = { who = 1062 distance = 110 } }
					}
					add_permanent_province_modifier = { name = "permanent_ashland" duration = -1 }
				}
				else = {
					add_permanent_province_modifier = { name = "thin_permanent_ashland" duration = -1 }
				}
			}
		}
		
		3187 = { remove_canal = cold_heart_canal }
		4074 = { remove_canal = dead_hig_canal }
		4075 = { remove_canal = dead_cyr_canal }
		4071 = { remove_canal = dead_arg_canal }
		
		3282 = { remove_canal = tel_mora_canal }
		1773 = { remove_canal = mi_kin_canal }
		3531 = { remove_canal = nosh_shek_canal }
		
		hide_ambient_object = "tel_mora_canal"
		hide_ambient_object = "mi_kin_canal"
		hide_ambient_object = "nosh_sheck_canal"
		
		set_global_flag = on_action_set_up_global_flag
	}

	if = { limit = { NOT = { has_country_flag = on_action_setup_flag } }
	
		if = { limit = { culture_group = orsimer_cg }
			add_country_modifier = { name = "orcish_fury" duration = 3650 }	
			add_country_modifier = { name = "orcish_fury_timer" duration = 9125 hidden = yes }
			every_neighbor_country = { limit = { ai = no NOT = { culture_group = orsimer_cg } } country_event = { id = es_orcish_flavour.5 days = 31 tooltip = es_orcish_flavour.5.a.tt } }
		}
		
		add_country_modifier = { name = "es_female_advisors" duration = -1 hidden = yes }
		
		if = { limit = { is_year = 266 } set_global_flag = ayleid_fall_flag }
		if = { limit = { is_year = 369 } set_global_flag = marukhism_flag }
		if = { limit = { is_year = 242 } set_global_flag = etherial_crisis_flag set_global_flag = alessian_rebellion_flag }
		if = { limit = { is_year = 609 } set_global_flag = fall_of_direnii_flag }
		if = { limit = { is_year = 750 } set_global_flag = dwemer_dissapearence_flag }
		if = { limit = { is_year = 810 } set_global_flag = redguard_migration_flag set_global_flag = foundation_of_wayres_flag }
		
		add_legitimacy = 100
		add_republican_tradition = 100
		add_devotion = 100
		add_horde_unity = 100
		add_meritocracy = 100
		
		add_yearly_manpower = 5
		
		init_variables = yes
		
		3188 = { owner = { set_country_flag = molag_bal_country_flag } }
		4075 = { owner = { set_country_flag = mehrunes_dagon_country_flag } }
		224 = { owner = { set_country_flag = orgnum_country_flag } }
		VB1 = { set_country_flag = wilderking_country_flag }
		
		es_heirs_immortal_rulers = yes
		
		if = { 
			limit = { 
				any_owned_province = {
					has_port = yes
				}
			}
			set_country_flag = started_with_port
		}			 
		
		#every_owned_province = {
		#	add_core = ROOT
		#}
		
		if = { limit = { OR = { government = republic is_emperor = yes } } add_ruler_modifier = { name = "is_republic_or_emperor_ruler_modifier" duration = -1 } }
		if = { limit = { is_half_blood_ruler_trigger = yes } add_ruler_modifier = { name = "is_half_blood_ruler_modifier" duration = -1 } }
		if = { limit = { is_elven_ruler_trigger = yes } add_ruler_modifier = { name = "is_elven_ruler_modifier" duration = -1 } }
		if = { limit = { is_unknown_ruler_trigger = yes } add_ruler_modifier = { name = "is_unknown_ruler_modifier" duration = -1 } }
		if = { limit = { is_immortal_ruler_trigger = yes } add_ruler_modifier = { name = "is_immortal_ruler_modifier" duration = -1 } }
		
		set_country_flag = on_action_setup_flag
		
		set_country_flag = caravan_policy_timer
		country_event = { id = es_caravans.1 days = 31 random = 365 }
	}
	
	initialize_schools_effect = yes
	
	country_event = { id = es_birthsigns.0 days = 1 }
}

# country
on_religion_change = {
	change_available_deities = yes
	on_religion_change_estate_privileges_effect = yes
	###removes catholic modifiers
	remove_country_modifier = counter_reformation
	remove_country_modifier = the_statue_in_restraint_of_appeals
	remove_country_modifier = revocation_of_restraint_of_appeals
	remove_country_modifier = bavarian_jesuits
	remove_country_modifier = the_societas_jesu
	remove_country_modifier = the_declaration_of_indulgence
	remove_country_modifier = de_heretico_comburendo
	remove_country_modifier = the_conventicle_act
 
	if = { 
	limit = {
	government = native
	OR = { religion = serpant_king religion = tang_mo_pantheon religion = kamal_pantheon }
	}
	change_government = monarchy
	add_government_reform = autocracy_reform								
	}
	
	if = {
		limit = {
			has_heir = yes
		}
		set_heir_religion = ROOT
	}
	if = {
		limit = {
			has_regency = no
		}
		set_ruler_religion = ROOT
	}
	if = {
		limit = {
			has_dlc = "Rights of Man"
			has_consort = yes
		}
		set_consort_religion = ROOT
	}
	
	if = { limit = { religion_group = polytheistic_group } add_country_modifier = { name = "polytheistic_group_modifier" duration = -1 }
		remove_country_modifier = occult_group_modifier
		remove_country_modifier = elemental_group_modifier
		remove_country_modifier = daedric_group_modifier
		remove_country_modifier = harmony_group_modifier
	}
	if = { limit = { religion_group = occult_group } add_country_modifier = { name = "occult_group_modifier" duration = -1 }
		remove_country_modifier = polytheistic_group_modifier
		remove_country_modifier = elemental_group_modifier
		remove_country_modifier = daedric_group_modifier
		remove_country_modifier = harmony_group_modifier
	}
	if = { limit = { religion_group = elemental_group } add_country_modifier = { name = "elemental_group_modifier" duration = -1 }
		remove_country_modifier = polytheistic_group_modifier
		remove_country_modifier = occult_group_modifier
		remove_country_modifier = daedric_group_modifier
		remove_country_modifier = harmony_group_modifier
	}
	if = { limit = { religion_group = daedric_group } add_country_modifier = { name = "daedric_group_modifier" duration = -1 }
		remove_country_modifier = polytheistic_group_modifier
		remove_country_modifier = occult_group_modifier
		remove_country_modifier = elemental_group_modifier
		remove_country_modifier = harmony_group_modifier
	}
	if = { limit = { religion_group = harmony_group } add_country_modifier = { name = "harmony_group_modifier" duration = -1 }
		remove_country_modifier = polytheistic_group_modifier
		remove_country_modifier = occult_group_modifier
		remove_country_modifier = elemental_group_modifier
		remove_country_modifier = daedric_group_modifier
	}
	
	add_country_modifier = {
		name = recently_changed_religion_dummy
		duration = 10
		hidden = yes
	}
	events = {
		es_school_events.0 #Pick School								   
	}
}

# country.
on_secondary_religion_change = {
	# Done from code: add_prestige = -50 (Define: CHANGE_SECONDARY_PRESTIGE_HIT)
	every_owned_province = {
		limit = { has_province_modifier = tengri_monastic_order }
		remove_province_modifier = tengri_monastic_order
	}
	every_owned_province = {
		limit = { has_province_modifier = tengri_shiite_settled_in_capital }
		remove_province_modifier = tengri_shiite_settled_in_capital
	}
	every_owned_province = {
		limit = { has_province_modifier = tengri_insincere_leadership }
		remove_province_modifier = tengri_insincere_leadership
	}
	every_owned_province = {
		limit = { has_province_modifier = tengri_religious_influx }
		remove_province_modifier = tengri_religious_influx
	}
	every_owned_province = {
		limit = { has_province_modifier = tengri_ruler_questioned }
		remove_province_modifier = tengri_ruler_questioned
	}
	every_owned_province = {
		limit = { has_province_modifier = tengri_strengthened_local_clans }
		remove_province_modifier = tengri_strengthened_local_clans
	}
	every_owned_province = {
		limit = { has_province_modifier = tengri_growing_cities }
		remove_province_modifier = tengri_growing_cities
	}
	every_owned_province = {
		limit = { has_province_modifier = tengri_christian_mission }
		remove_province_modifier = tengri_christian_mission
	}
	every_owned_province = {
		limit = { has_province_modifier = tengri_unchristian_values }
		remove_province_modifier = tengri_unchristian_values
	}
	every_owned_province = {
		limit = { has_province_modifier = tengri_monastic_order }
		remove_province_modifier = tengri_monastic_order
	}
	every_owned_province = {
		limit = { has_province_modifier = hindufication }
		remove_province_modifier = hindufication
	}
	every_owned_province = {
		limit = { has_province_modifier = tengri_influx_of_monks }
		remove_province_modifier = tengri_influx_of_monks
	}
	every_owned_province = {
		limit = { has_province_modifier = tengri_abandoning_the_old_ways }
		remove_province_modifier = tengri_abandoning_the_old_ways
	}
	remove_country_modifier = tengri_devout_muslim
	remove_country_modifier = tengri_confucian_elites_alienated
	remove_country_modifier = tengri_confucian_titles
	remove_country_modifier = tengri_traditionalists_strengthened
	remove_country_modifier = tengri_confucian_nobles
	remove_country_modifier = tengri_pali_legal_traditions
	remove_country_modifier = tengri_religious_pilgrimages
	remove_country_modifier = tengri_monks_in_capital
	remove_country_modifier = tengri_influx_of_monks
	remove_country_modifier = tengri_shiite_immigration
	remove_country_modifier = support_of_the_khojas
	remove_country_modifier = black_shamanism_modifier
	remove_country_modifier = tengri_animist_pantheon
	remove_country_modifier = zoroastrian_traders
	remove_country_modifier = spread_of_tengri_tea_ceremony
	remove_country_modifier = tengri_tea_ceremony
	remove_country_modifier = tengri_japanese_swordsmithing
	remove_country_modifier = tengri_bow_and_arrow_defended
	remove_country_modifier = tengri_support_of_shamans
	remove_country_modifier = tengri_hindu_conflict
	remove_country_modifier = tengri_hindu_syncretism
	remove_country_modifier = tengri_devout_christian_ruler
	remove_country_modifier = tengri_personal_confessor
	remove_country_modifier = tengri_confucian_administrators
	remove_country_modifier = tengri_traditional_elites_alienated
	remove_country_modifier = tengri_jihad
	remove_country_modifier = tengri_stood_up_for_yassa
	remove_country_modifier = tengri_sufi_teacher
	remove_country_modifier = tengri_qadi
	remove_country_modifier = tengri_religious_influx
	remove_country_modifier = tengri_ibadi_scholars
	remove_country_modifier = tengri_clergy_conflicts
	remove_country_modifier = tengri_shamans_spurned
	if = {
		limit = {
			check_variable = { which = khojas_retained value = 1 }
		}
		set_variable = {
			which = khojas_retained value = 0
		}
	}
}

# country. Spawned when Enforcing Rebel Demands through a Support Rebels-war.
on_enforce_rebel_demands = {
	# ROOT = The winning country
	# FROM = The loosing country
	set_country_flag = helped_rebels_win_war
}

# country
on_colonial_liberation = {
	country_event = { id = es_colonisation_events.11 days = 1 }
}

# country
on_colonial_reintegration = {
	events = {
		es_colonisation_events.12
	}
}

# country
on_peace_actor = {
}

# country
on_peace_recipient = {
}

# country
# root = winning country, from = loser country
on_war_won = {
	ROOT = { clr_country_flag = esb_stealprovince }
	FROM = { clr_country_flag = esb_stealprovince }
    clr_country_flag = alliancememberinwar_flag
	remove_country_modifier = guarfian_at_war
	
	# Fall of the White-Gold Tower 
	if = {
		limit = { 
			owns = 1206
			NOT = { 
				culture_group = high_elves_cg
				has_global_flag = fall_of_white_tower_flag 
				OR = {
					tag = CB8
					tag = AYL
				}
			}
		}
		set_global_flag = fall_of_white_tower_flag
		every_country = {
			limit = {
				ai = no
				capital_scope = { continent = Tamriel }
			}
			country_event = { id = es_0_scenario.4 days = 365 }
		}
	}
	
	if = {
        limit = {
            has_country_flag = had_rebellion_from_overlord
        }
        ROOT = { country_event = { id = overlord_rebellion.5 days = 31 } } 
    }
	
	change_variable = {
		which = war_won
		value = 1
	}
	change_variable = {
		which = num_of_wars_won
		value = 1
	}
    if = {
		limit = {
			is_part_of_hre = yes
			FROM  = { is_part_of_hre = yes }
		}
		random_known_country = {
			limit = {
				has_reform = free_city
				NOT = {
					prestige = 40
				}
				NOT = {
					has_country_modifier = fc_treatyconference_timer
				}
			}
			add_country_modifier = {
				name = fc_treatyconference_timer
				duration = 3650
				hidden = yes
			}
		}
	}
	if = {
		limit = {
			NOT = { has_country_flag = es_blackreach_owned_flag }
			NOT = { primary_culture = vampire }
			owns = 2924
			2924 = {
				culture = vampire
			}
		}
		set_country_flag = es_blackreach_owned_flag
		country_event = { id = es_flavour_race_events.19 days = 31 }
	}
}

# country
# root = loser country, from = winner country
on_war_lost = {
    clr_country_flag = alliancememberinwar_flag
	remove_country_modifier = guarfian_at_war
	
	if = {
        limit = {
            has_country_flag = had_rebellion_from_overlord
        }
        ROOT = { country_event = { id = overlord_rebellion.6 days = 31 } }
    }
	
	if = {
        limit = {
            government = republic
            is_lesser_in_union = yes
		}
		change_government_to_monarchy = yes
    }
	change_variable = {
		which = war_lost
		value = 1
	}	
	add_country_modifier = {
		name = just_lost_war_timer
		duration = 10
		hidden = yes
	}

	# Modular Kingdom Rank Timer/Check for development level
	if = {
		limit = {
			government_rank = 2
			NOT = { has_ruler_flag = modular_ranks_timer }
			NOT = { has_global_flag = disabled_modular_ranks }
			NOT = { total_development = 250 }
			NOT = { government_rank = 3}
			NOT = { has_regency = yes }
			num_of_provinces_owned_or_owned_by_non_sovereign_subjects_with = {
				value = 16
			}
		}
		ROOT = {
			country_event = {
				id = lost_development_events.10 days = 10
			}
			hidden_effect = {
				set_ruler_flag = modular_ranks_timer
			}	
		}
	}
	else_if = {
		limit = {
			government_rank = 3
			NOT = { has_ruler_flag = modular_ranks_timer }
			NOT = { has_global_flag = disabled_modular_ranks }
			NOT = { total_development = 500 }
			NOT = { government_rank = 4}
			NOT = { has_regency = yes }
			num_of_provinces_owned_or_owned_by_non_sovereign_subjects_with = {
				value = 33
			}
		}
		ROOT = {
			country_event = {
				id = lost_development_events.10 days = 10
			}
			hidden_effect = {
				set_ruler_flag = modular_ranks_timer
			}
		}
	}
	else_if = {
		limit = {
			government_rank = 4
			NOT = { has_ruler_flag = modular_ranks_timer }
			NOT = { has_global_flag = disabled_modular_ranks }
			NOT = { total_development = 1000 }
			NOT = { government_rank = 5}
			NOT = { has_regency = yes }
			num_of_provinces_owned_or_owned_by_non_sovereign_subjects_with = {
				value = 66
			}
		}
		ROOT = {
			country_event = {
				id = lost_development_events.10 days = 10
			}
			hidden_effect = {
				set_ruler_flag = modular_ranks_timer
			}
		}
	}
	else_if = {
		limit = {
			government_rank = 5
			NOT = { has_ruler_flag = modular_ranks_timer }
			NOT = { has_global_flag = disabled_modular_ranks }
			NOT = { total_development = 1500 }
			NOT = { government_rank = 6}
			NOT = { has_regency = yes }
			num_of_provinces_owned_or_owned_by_non_sovereign_subjects_with = {
				value = 100
			}
		}
		ROOT = {
			country_event = {
				id = lost_development_events.10 days = 10
			}
			hidden_effect = {
				set_ruler_flag = modular_ranks_timer
			}
		}
	}
	else_if = {
		limit = {
			government_rank = 6
			NOT = { has_ruler_flag = modular_ranks_timer }
			NOT = { has_global_flag = disabled_modular_ranks }
			NOT = { total_development = 2000 }
			NOT = { government_rank = 7}
			NOT = { has_regency = yes }
			num_of_provinces_owned_or_owned_by_non_sovereign_subjects_with = {
				value = 133
			}
		}
		ROOT = {
			country_event = {
				id = lost_development_events.10 days = 10
			}
			hidden_effect = {
				set_ruler_flag = modular_ranks_timer
			}
		}
	}
	else_if = {
		limit = {
			government_rank = 7
			NOT = { has_ruler_flag = modular_ranks_timer }
			NOT = { has_global_flag = disabled_modular_ranks }
			NOT = { total_development = 2500 }
			NOT = { government_rank = 8}
			NOT = { has_regency = yes }
			num_of_provinces_owned_or_owned_by_non_sovereign_subjects_with = {
				value = 166
			}
		}
		ROOT = {
			country_event = {
				id = lost_development_events.10 days = 10
			}
			hidden_effect = {
				set_ruler_flag = modular_ranks_timer
			}
		}
	}
	else_if = {
		limit = {
			government_rank = 8
			NOT = { has_ruler_flag = modular_ranks_timer }
			NOT = { has_global_flag = disabled_modular_ranks }
			NOT = { total_development = 3000 }
			NOT = { government_rank = 9}
			NOT = { has_regency = yes }
			num_of_provinces_owned_or_owned_by_non_sovereign_subjects_with = {
				value = 200
				}
			}
			ROOT = {
				country_event = {
					id = lost_development_events.10 days = 10
				}
				hidden_effect = {
					set_ruler_flag = modular_ranks_timer
				}
			}
		}
	else_if = {
		limit = {
			government_rank = 9
			NOT = { has_ruler_flag = modular_ranks_timer }
			NOT = { has_global_flag = disabled_modular_ranks }
			NOT = { total_development = 3500 }
			NOT = { government_rank = 10}
			NOT = { has_regency = yes }
			num_of_provinces_owned_or_owned_by_non_sovereign_subjects_with = {
				value = 233
				}
			}
			ROOT = {
				country_event = {
					id = lost_development_events.10 days = 10
				}
				hidden_effect = {
					set_ruler_flag = modular_ranks_timer
				}
			}
		}
	else_if = {
		limit = {
			government_rank = 10
			NOT = { has_ruler_flag = modular_ranks_timer }
			NOT = { has_global_flag = disabled_modular_ranks }
			NOT = { total_development = 4000 }
			NOT = { has_regency = yes }
			num_of_provinces_owned_or_owned_by_non_sovereign_subjects_with = {
				value = 266
				}
			}
			ROOT = {
				country_event = {
					id = lost_development_events.10 days = 10
				}
				hidden_effect = {
					set_ruler_flag = modular_ranks_timer
				}
			}
		}
}


# country
# root = winning country, from = loser country
on_battle_won_country = {
    change_variable = {
		which = num_of_battles_won
		value = 1
	}	
}

# country
# root = loser country, from = winner country
on_battle_lost_country = {
	battle_cult_spreading_effect = yes #Scripted effect for fetishist cult mechanics.
}

# province
# root = location, from = loser country
on_battle_won_province = {
    if = {
		limit = {
			from = {
				tag = REB
				is_rebel_type = revolutionary_rebels
			}
			owner = {
				any_owned_province = {
					region = root
					has_revolution_in_province = yes
				}
				NOT = { has_disaster = revolution }
				NOT = { has_spawned_rebels = revolutionary_rebels }
			}
		}
		owner = { 
			country_event = { id = center_of_revolution.1600 }
		}
	}
	random_events = {
		1000 = 0
	}
}

#Unit Scope OnAction for Battle Won
on_battle_won_unit = {
	if = {
		limit = {
			unit_owner = { ai = no } #Scopes to Unit Owner from Unit Scope
			general_with_steam_name = yes #Unit Scope Trigger
		}
		unit_owner = { set_country_flag = general_with_steam_name_won_battle }
	}
}

# #Unit Scope OnAction for Battle Lost
on_battle_lost_unit = {

}

# province
# root = location, from = country doing it
on_added_to_trade_company ={

}

# province
# root = location, from = country doing it
on_removed_from_company ={

}

# province
# root = location, from = country doing it
on_company_formed ={

}

# province
# root = location, from = country doing it
on_company_disolved ={

}

# province
# root = location, from = winner country
on_battle_lost_province = {
	random_events = {
		1000 = 0
	}
}

# country
# root = winning country, from = location
on_siege_won_country = {
	#Massacre Ideas
	if = {
		limit = {
			has_idea = esb_massacre_ideas1
		}
		random_list = {
			99 = { }
			1 = { 
				random_list = {
					90 = { }
					10 = {
						FROM = { save_event_target_as = esb_to_genocide }
						country_event = {
							id = es_esb.2
						} 
					}
				}
			}
		}
	}
	
	
	if = {
		limit = {
			from = { is_capital = yes }
		}
		grant_manpower_from_capital_slave_raid = yes
	}
	if = {
		limit = {
			from = { development = 25 }
			root = { has_reform = triumphs }
		}
		root = { country_event = { id = event_new_diplomatic_actions.600 } }
	}
	if = {
		limit = { from = { has_province_modifier = 16_n_orsinium } }
		from = {
			remove_province_modifier = 16_n_orsinium
			add_devastation = 100
			owner = { country_event = { id = es_21_scenario.40 } }
		}
		country_event = { id = es_21_scenario.4 }
		change_variable = {
			which = num_of_sacked_orsinium
			value = 1
		}
	}
	if = {
		limit = { from = { has_province_modifier = 16_s_orsinium } }
		from = {
			remove_province_modifier = 16_s_orsinium
			add_devastation = 100
		}
	}
}

# country
# root = losing country, from = location
on_siege_lost_country = {
}

# province
# root = location, from = losing country
on_siege_won_province = {
	#Generated by Arc Eu4 script Compiler | Created by @Kurashi 
	random_list = { 
		95 = { } 
		5 = { 
			if = { limit = { has_province_flag = esb_city_monument } 
				using "common\great_projects\citymonuments.class" as citymonuments
				foreach citymonuments = {
					if = {
						limit = {
							province_id = citymonuments.start
						}
						add_great_project_tier = {
							type = citymonuments.id
							tier = -1
						}
					}
				}
			} 
		} 
	} 

	if = {
		limit = {
			from = {
				tag = REB
				is_rebel_type = revolutionary_rebels
			}
			owner = {
				any_owned_province = {
					region = root
					has_revolution_in_province = yes
				}
				NOT = { has_disaster = revolution }
				NOT = { has_spawned_rebels = revolutionary_rebels }
			}
		}
		owner = { country_event = { id = center_of_revolution.1600 } }
	}
}

# province
# root = location, from = winning country
on_siege_lost_province = {
	if = {
		limit = {
			FROM = { has_consort_flag = esb_stealprovince }
		}
		cede_province = FROM
		add_core = FROM
	}
	if = {
		limit = {
			owner = { has_country_flag = mutual_auto_siege }
			from = { has_country_flag = mutual_auto_siege }
		}
		cede_province = FROM
	}
}

# province
# root = location, from = country that abandons colony
# Fired right before the colony is abandoned.
on_abandon_colony = {
}

# province
# root = location, from = country that owns it
# Fired right after the great project is constructed
on_great_project_constructed = {
}

# OBS: Consider that the following on_actions can be called for Personal Union juniors as well.
# country
on_new_monarch = {

	es_change_opinion = yes
	es_change_country_names = yes
	change_available_deities = yes
	
	es_do_things_on_new_monarch = yes

	if = {
		limit = {
			has_consort_regency = no
			any_owned_province = {
				has_province_modifier = domain_of_spouses_family
			}
		}
		random_owned_province = {
			limit = { has_province_modifier = domain_of_spouses_family }
			remove_province_modifier = domain_of_spouses_family
		}
	}
	if = {
		limit = {
			has_consort_regency = no
			any_owned_province = {
				has_province_modifier = home_of_consort
			}
		}
		random_owned_province = {
			limit = { has_province_modifier = home_of_consort }
			remove_province_modifier = home_of_consort
		}
	}
	
	ambrosian_republic_effect = yes
	succession_culture_religion_effect = yes
	
	if = {
		limit = {
			is_lesser_in_union = yes
			NOT = { government = monarchy }
		}
		change_government = monarchy
	}
	
	if = {
		limit = {
			OR = {
				ruler_culture = vampire
				ruler_culture = soul_shriven
				ruler_culture = daedra
			}
		}
		add_ruler_personality = immortal_personality
	}
	
	events = {
		es_tribal_succession.1		# Tribal Succession Crisis
	}
	if = {
		limit = {
			government = republic
		}
		country_event = {
			id = es_birthsigns.0	# Assign random birthsign to republic
			days = 1
		}
	}
	else = {
		country_event = {
			id = es_birthsigns.1	# Assign Ruler Birthsign
			days = 1
		}
	}
}

on_new_consort = {
	country_event = { id = es_consort_events.2 }
	country_event = { id = es_flavour_vampire.2 days = 15}
	
	if = {
		limit = {
			OR = {
				consort_culture = vampire
				consort_culture = soul_shriven
				consort_culture = daedra
			}
		}
		add_queen_personality = immortal_personality
	}

	if = {
		limit = { has_ruler_flag = had_10_years_anniversary }
		clr_ruler_flag = had_10_years_anniversary
	}
	if = {
		limit = { has_ruler_flag = had_20_years_anniversary }
		clr_ruler_flag = had_20_years_anniversary
	}
	if = {
		limit = { has_ruler_flag = consort_had_affection_of_ruler }
		clr_ruler_flag = consort_had_affection_of_ruler
	}
}

# country
on_monarch_death = {
	export_to_variable = {
        variable_name = new_age
        value = trigger_value:ruler_age
    }
	log = "RulerDeath_[ROOT.age_on_coronation.GetValue]_[ROOT.year_of_coronation.GetValue]_[GetYear]"
	export_to_variable = {
        variable_name = age_on_coronation
        value = trigger_value:ruler_age
    }
	set_variable = {
		which = year
		which = BLA
	}
	set_variable = {
		which = year_of_coronation
		which = year
	}
	if = { limit = { ai = no has_reform = backbone_of_the_nation } add_stability = -1 }
	every_owned_province = {
		limit = {
		OR = { 
			has_province_modifier = minor_royal_family_autonomy
			has_province_modifier = royal_family_autonomy
			has_province_modifier = major_family_autonomy 
		} 
		}
		remove_province_modifier = minor_royal_family_autonomy
		remove_province_modifier = royal_family_autonomy
		remove_province_modifier = major_family_autonomy
	}
	if = {
		limit = { ai = no has_reform = gravelkind }
		every_owned_province = {
			random_list = {
				33 = { }
				22 = { add_province_modifier = { name = "minor_royal_family_autonomy" duration = -1 } }
				22 = { add_province_modifier = { name = "royal_family_autonomy" duration = -1 } }
				22 = { add_province_modifier = { name = "major_family_autonomy" duration = -1 } }
			}
		}
	}
	if = {
		limit = { has_country_modifier = sought_after_bachelor }
		remove_country_modifier = sought_after_bachelor
	}  
	burgundian_inheritance_start_effect = yes
	es_heirs_immortal_rulers = yes
	
	#Modular Kingdom Ranks
	if = {
		limit = {
			government_rank = 2
			NOT = { has_global_flag = disabled_modular_ranks }
			NOT = { total_development = 250 }
			NOT = { government_rank = 3}
			NOT = { has_regency = yes }
			num_of_provinces_owned_or_owned_by_non_sovereign_subjects_with = {
				value = 16
			}
		}
		ROOT = {
			country_event = {
				id = lost_development_events.1 days = 10
			}
		}
	}
	else_if = {
		limit = {
			government_rank = 3
			NOT = { has_global_flag = disabled_modular_ranks }
			NOT = { total_development = 500 }
			NOT = { government_rank = 4}
			NOT = { has_regency = yes }
			num_of_provinces_owned_or_owned_by_non_sovereign_subjects_with = {
				value = 33
			}
		}
		ROOT = {
			country_event = {
				id = lost_development_events.2 days = 10
			}
		}
	}
	else_if = {
		limit = {
			government_rank = 4
			NOT = { has_global_flag = disabled_modular_ranks }
			NOT = { total_development = 1000 }
			NOT = { government_rank = 5}
			NOT = { has_regency = yes }
			num_of_provinces_owned_or_owned_by_non_sovereign_subjects_with = {
				value = 66
			}
		}
		ROOT = {
			country_event = {
				id = lost_development_events.3 days = 10
			}
		}
	}
	else_if = {
		limit = {
			government_rank = 5
			NOT = { has_global_flag = disabled_modular_ranks }
			NOT = { total_development = 1500 }
			NOT = { government_rank = 6}
			NOT = { has_regency = yes }
			num_of_provinces_owned_or_owned_by_non_sovereign_subjects_with = {
				value = 100
			}
		}
		ROOT = {
			country_event = {
				id = lost_development_events.4 days = 10
			}
		}
	}
	else_if = {
			limit = {
				government_rank = 6
				NOT = { has_global_flag = disabled_modular_ranks }
				NOT = { total_development = 2000 }
				NOT = { government_rank = 7}
				NOT = { has_regency = yes }
				num_of_provinces_owned_or_owned_by_non_sovereign_subjects_with = {
					value = 133
				}
			}
			ROOT = {
				country_event = {
					id = lost_development_events.5 days = 10
				}
			}
		}
	else_if = {
			limit = {
				government_rank = 7
				NOT = { has_global_flag = disabled_modular_ranks }
				NOT = { total_development = 2500 }
				NOT = { government_rank = 8}
				NOT = { has_regency = yes }
				num_of_provinces_owned_or_owned_by_non_sovereign_subjects_with = {
					value = 166
				}
			}
			ROOT = {
				country_event = {
					id = lost_development_events.6 days = 10
				}
			}
		}
	else_if = {
		limit = {
			government_rank = 8
			NOT = { has_global_flag = disabled_modular_ranks }
			NOT = { total_development = 3000 }
			NOT = { government_rank = 9}
			NOT = { has_regency = yes }
			num_of_provinces_owned_or_owned_by_non_sovereign_subjects_with = {
				value = 200
				}
			}
			ROOT = {
				country_event = {
					id = lost_development_events.7 days = 10
				}
			}
		}
	else_if = {
		limit = {
			government_rank = 9
			NOT = { has_global_flag = disabled_modular_ranks }
			NOT = { total_development = 3500 }
			NOT = { government_rank = 10}
			NOT = { has_regency = yes }
			num_of_provinces_owned_or_owned_by_non_sovereign_subjects_with = {
				value = 233
				}
			}
			ROOT = {
				country_event = {
					id = lost_development_events.8 days = 10
				}
			}
		}
	else_if = {
		limit = {
			government_rank = 10
			NOT = { has_global_flag = disabled_modular_ranks }
			NOT = { total_development = 4000 }
			NOT = { has_regency = yes }
			num_of_provinces_owned_or_owned_by_non_sovereign_subjects_with = {
				value = 266
				}
			}
			ROOT = {
				country_event = {
					id = lost_development_events.9 days = 10
					}
				}
			}
	remove_estate_privilege = give_gifts
}

# country
on_regent = {
	events = {
		es_tribal_succession.1
	}
	if = { limit = { is_emperor = yes } define_ruler = { religion = root culture = root } }
}

# country
on_extend_regency = {
	add_legitimacy = -10
}

# country	 
on_new_term_election = {
	events = {
		700		# Election event
		elections.720		# Dutch Republic
		es_pirate_elections.1
	}
}

# country
on_death_election = {
	if = {
		limit = { has_reform = presidential_despot_reform }
		remove_government_reform = presidential_despot_reform
	}
	if = {
		limit = {
			OR = {
				has_reform = pirate_republic_reform
				has_reform = war_against_the_world_doctrine_reform
			}
		}
		set_country_flag = pirate_death_election
		country_event = { id = es_pirate_elections.1 }
	}
	events = {
		701		# Election event
		elections.721		# Dutch Republic
		elections.800	# Lottery election
	}
}

# country
on_death_foreign_slave_ruler = {
	events = {
		es_slave_monarchy.0
	}
}

# country
on_replace_governor = {
	events = {
		elections.707
	}
}


# country
on_bankruptcy = {
	add_adm_power = 100
	add_dip_power = 100
	add_mil_power = 100
}

# country (country annexing, root = target)
on_diplomatic_annex = {
	events = {
		mechanics_hre.7
	}
	change_variable = {
		which = diplo_annexed_nation
		value = 1
	}		
}

# country
on_heir_death = {
	country_event = { id = es_general.0 days = 31 }
	if = {
		limit = { has_country_flag = heir_dip_education }
		clr_country_flag = heir_dip_education
	}
	if = {
		limit = { has_country_flag = heir_mil_education }
		clr_country_flag = heir_mil_education
	}
	if = {
		limit = { has_country_flag = heir_adm_education }
		clr_country_flag = heir_adm_education
	}
	if = {
		limit = { has_ruler_flag = well_advised_tutored_heir }
		clr_ruler_flag = well_advised_tutored_heir
	}
	if = {
		limit = { has_ruler_flag = heir_went_on_grand_tour }
		clr_ruler_flag = heir_went_on_grand_tour
	}
	if = {
		limit = { has_country_flag = albrecht_achilles_flag }
		clr_country_flag = albrecht_achilles_flag #Death of original Albrecht Achilles
	}
	es_heirs_immortal_rulers = yes
}

# country
on_queen_death = {

	if = {
		limit = { has_consort_flag = consort_has_affection_of_ruler }
		set_ruler_flag = consort_had_affection_of_ruler
	}

	if = {
		limit = {
			has_regency = no
			NOT = { has_ruler_flag = widow_widower }
		}
		set_ruler_flag = widow_widower
	}
	if = {
		limit = { has_consort_regency = no }
		random_owned_province = {
			limit = { has_province_modifier = domain_of_spouses_family }
			remove_province_modifier = domain_of_spouses_family
		}
    }
	if = {
		limit = { has_ruler_flag = accepted_help_from_spouses_family }
		clr_ruler_flag = accepted_help_from_spouses_family
	}
	if = {
		limit = { has_ruler_flag = helped_spouses_family }
		clr_ruler_flag = helped_spouses_family
	}
	if = {
		limit = { has_ruler_flag = refused_to_help_spouses_family }
		clr_ruler_flag = refused_to_help_spouses_family
	}
	if = {
		limit = { has_ruler_flag = has_lowborn_consort }
		random_owned_province = {
			limit = { has_province_modifier = home_of_consort }
			remove_province_modifier = home_of_consort
		}
	}
	if = {
		limit = { has_ruler_flag = has_lowborn_consort }
		clr_ruler_flag = has_lowborn_consort
	}
	if = {
		limit = { has_country_modifier = consort_adm_advice }
		remove_country_modifier = consort_adm_advice
	}
	if = {
		limit = { has_country_modifier = consort_dip_advice }
		remove_country_modifier = consort_dip_advice
	}
	if = {
		limit = { has_country_modifier = consort_mil_advice }
		remove_country_modifier = consort_mil_advice
	}
	if = {
		limit = { has_country_modifier = without_spouse_advice }
		remove_country_modifier = without_spouse_advice
	}
	if = {
		limit = { has_ruler_modifier = affectionate_royal_couple }
		remove_country_modifier = affectionate_royal_couple
	}
	if = {
		limit = { has_ruler_modifier = bav_woman_scorned_mod }
		remove_country_modifier = bav_woman_scorned_mod
	}
	if = {
		limit = { has_ruler_modifier = bav_building_wife_church }
		remove_country_modifier = bav_building_wife_church
	}
	clr_ruler_flag = marriage_length							 
}

# country
on_new_heir = {
	if = {
		limit = {
			OR = {
				heir_culture = vampire
				heir_culture = soul_shriven
				heir_culture = daedra
			}
		}
		add_heir_personality = immortal_personality
	}
}

# country
on_weak_heir_claim = {
}

# country : no heir in theocracy
on_heir_needed_theocracy = {
	events = {
		es_theocracy.1
	}
}

# Emperor from same dynasty
on_successive_emperor = {
	events = {
		mechanics_hre.4
	}
}

# Called whenever a new emperor is elected
# FROM = Previous Emperor
# ROOT = New Emperor 
on_emperor_elected = {
	every_elector = {
		if = {
			limit = {
				preferred_emperor = root
			}
			change_variable = {
				which = supported_successive_emperors
				value = 1
			}
		}
		else = {
			set_variable = {
				which = supported_successive_emperors
				value = 0
			}
		}
	}

	FROM = {
		if = {
			limit = { has_country_modifier = diet_occupied }
			remove_country_modifier = diet_occupied
			ROOT = {
				add_country_modifier = { name = diet_occupied duration = -1 }
			}
		}
		if = {
			limit = {
				any_country = {
					reverse_has_opinion_modifier = {
						modifier = opinion_imperial_diplomacy
						who = prev
					}
				}
			}
			every_country = {
				limit = {
					reverse_has_opinion_modifier = {
						modifier = opinion_imperial_diplomacy
						who = prev
					}
				}
				reverse_remove_opinion = {
					modifier = opinion_imperial_diplomacy
					who = prev
				}
				ROOT = {
					add_opinion = {
						modifier = opinion_imperial_diplomacy
						who = prev
					}
				}
			}
		}
	}
}
# HRE Prince released by the emperor
on_released_hre_member = {
	events = {
	}
}

# HRE Prince converts to non-Emperor religion
on_hre_member_false_religion = {
	events = {
	}
}

# HRE Prince converts to Emperor religion
on_hre_member_true_religion = {
	events = {
	}
}

# Emperor wins HRE defensive war
on_hre_wins_defensive_war = {
	events = {
	}
}

# HRE member annexed by non-HRE country
on_hre_member_annexed = {
	events = {
	}
}

# HRE member released from non-HRE vassalage
on_hre_released_vassal = {
	events = {
	}
}

# HRE member transferred from non-HRE vassalage to Emperor
on_hre_transfered_vassal = {
	events = {
	}
}

# Emperor coming to the defense of a HRE member
on_hre_defense = {
	events = {
	}
}

# Emperor NOT coming to the defense of a HRE member
on_hre_non_defense = {
	events = {
		mechanics_hre.6
	}
}

# HRE Member takes a HRE province from an outs100e country in a peace (province scope)
on_hre_province_reconquest = {
	events = {
	}
}

on_lock_hre_religion = {
}

on_change_hre_religion = {
}

on_hre_religion_white_peace = {
}

# When a non-native changes government type
on_government_change = {										  
	if = {
		limit = {
			NOT = { government = monarchy }
			any_owned_province = {
				has_province_modifier = domain_of_spouses_family
			}
		}
		random_owned_province = {
			limit = { has_province_modifier = domain_of_spouses_family }
			remove_province_modifier = domain_of_spouses_family
		}
	}
	if = {
		limit = {
			NOT = { government = monarchy }
			any_owned_province = {
				has_province_modifier = home_of_consort
			}
		}
		random_owned_province = {
			limit = { has_province_modifier = home_of_consort }
			remove_province_modifier = home_of_consort
		}
	}
    if = {
		limit = { has_country_modifier = the_reign_of_terror }
		remove_country_modifier = the_reign_of_terror
	}
	if = {
		limit = {
			has_global_flag = great_peasants_war_flag
			is_part_of_hre = yes
			has_reform = peasants_republic
		}
		1 = {
			change_variable = {
				which = GPW_counting_variable
				value = -3
			}
		}
	}
}

# When a native changes government after filling all their advancement groups.
on_native_change_government = {
}

# Nation is integrated after being in union
on_integrate = {
	events = {
		mechanics_hre.7
	}
}

# Nation annexed.
# FROM is the nation being annexed
on_annexed = {
	on_annexed_estate_privileges_effect = yes
	change_variable = {
		which = annexed_nation
		value = 1
	}			
	FROM = {
        if = {
			limit = { has_country_modifier = legatus_natus }
			remove_country_modifier = legatus_natus
			set_global_flag = no_legatus_natus
		}
		if = {
			limit = { has_country_modifier = primas_germaniae }
			remove_country_modifier = primas_germaniae
			set_global_flag = no_primas_germaniae
        }
	}
	if = {
		limit = { FROM = { is_emperor = yes } }
		emperor = {
			add_imperial_influence = -50
		}
	}
	if = {
		limit = { FROM = { is_elector = yes } }
		emperor = {
			add_imperial_influence = -25
		}
	}
	if = {
		limit = { FROM = { has_reform = free_city } }
		emperor = {
			add_imperial_influence = -15
		}
	}
	if = {
		limit = { FROM = { is_part_of_hre = yes is_emperor = no is_elector = no NOT = { has_reform = free_city } } }
		emperor = {
			add_imperial_influence = -5
		}
	}
}

# When the chinese empire gets dismantled (e.g. when the emperor is annexed)
# FROM = Emperor, ROOT = Current Nation
on_chinese_empire_dismantled = {						   
}

# When a nation gains the Mandate of Heaven (becomes the Emperor of China)
# FROM = Old Emperor, ROOT = New Emperor
on_mandate_of_heaven_gained = {
}

# When a nation loses the Mandate of Heaven
# FROM = New Emperor, ROOT = Old Emperor
on_mandate_of_heaven_lost = {
}

on_embrace_revolution = {
	if = {	
		limit = {
			any_subject_country = {
				has_country_modifier = colony_inspired_by_revolution
			}
		}
		every_subject_country = {
			remove_country_modifier = colony_inspired_by_revolution
		}
	}
	if = {
		limit = { NOT = { government = republic } }
		change_government_to_republic = yes
	}
	if = {
		limit = { 
			revolution_target_exists = no
			is_great_power = yes
		}
		set_revolution_target = ROOT
		add_government_reform = revolutionary_republic_reform
		if = {
			limit = {
				any_country = {
					has_country_flag = last_revolutionary_country
				}
			}
			every_country = {
				limit = {
					has_country_flag = last_revolutionary_country
				}
				clr_country_flag = last_revolutionary_country
			}
		}
	}
	else = {
		add_government_reform = junior_revolutionary_republic_reform
	}
	kill_ruler = yes
	set_country_flag = revolutionary_republic_flag
	set_country_flag = had_revolution
}

on_dismantle_revolution = {
	events = {
		center_of_revolution.1500
	}
	if = {
		limit = {
			any_country = {
				has_country_flag = last_revolutionary_country
			}
		}
		every_country = {
			limit = {
				has_country_flag = last_revolutionary_country
			}
			clr_country_flag = last_revolutionary_country
		}
	}
	set_country_flag = last_revolutionary_country
}

# province
on_adm_development = {
	if = {
		limit = {
			owner = {
				has_country_flag = increase_adm_dev_agenda
			}
		}
		owner = {
			set_country_flag = increase_adm_dev_agenda_completed
		}
	}
}

# province
on_dip_development = {
	if = {
		limit = {
			owner = {
				has_country_flag = increase_dip_dev_agenda
			}
		}
		owner = {
			set_country_flag = increase_dip_dev_agenda_completed
		}
	}
}

# province
on_mil_development = {
	if = {
		limit = {
			owner = {
				has_country_flag = increase_mil_dev_agenda
			}
		}
		owner = {
			set_country_flag = increase_mil_dev_agenda_completed
		}
	}
}

on_overextension_pulse = {
	random_events = {
		100 = es_overextension.1
		100 = es_overextension.2
		100 = es_overextension.3
		100 = es_overextension.4
		100 = es_overextension.5
		100 = es_overextension.6
		100 = es_overextension.7
	}
}


on_colonial_pulse = {
}

on_siberian_pulse = {
}


# country random events
on_bi_yearly_pulse = {
	if = {
		limit = {
			tag = BLA
		}
		country_event = {
			id = es_economy.2
			days = 0
		}
		country_event = {
			id = es_economy.2
			days = 1years
		}
	}
	## Development Mechanics
	#random_owned_province = {
	#	limit = {
	#		NOT = { has_province_modifier = dev }
	#	}
	#	es_change_province_developemnt = yes
	#}
}

on_bi_yearly_pulse_2 = {
}

# ES Flavour Events
on_bi_yearly_pulse_3 = {
	country_event = {
		id = es_flavour.999
		days = 70
	}
	country_event = {
		id = es_flavour_vampire.999
		days = 35
	}
	country_event = {
		id = es_caravans.999
		days = 99
	}
	if = {
		limit = {
			has_country_flag = es_has_new_conquest
		}
		country_event = {
			id = es_conquest.999
			days = 89
		}
	}
	# Religious Events
	country_event = {
		id = es_religious_events_random.100
		days = 77 random = 35
	}
	country_event = {
		id = es_religious_events_daedric.100
		days = 75 random = 35
	}
	country_event = {
		id = es_religious_events_aedric_divines.100
		days = 65 random = 35
	}
	country_event = {
		id = es_religious_events_nature.100
		days = 67 random = 35
	}
	country_event = {
		id = es_religious_events_nautical.100
		days = 63 random = 35
	}
	country_event = {
		id = es_religious_events_akaviri.100
		days = 82 random = 35
	}
	country_event = {
		id = es_religious_events_aedric.100
		days = 85 random = 35
	}
	country_event = {
		id = es_religious_events_harmony.100
		days = 87 random = 35
	}
	country_event = {
		id = es_religious_events_occult.100
		days = 97 random = 35
	}
	# Random Events
	country_event = {
		id = es_parliament_events.100
		days = 50 random = 70
	}
	country_event = {
		id = es_akaviri_random_events.100
		days = 120 random = 70
	}
	country_event = {
		id = es_colonisation_events.100
		days = 160 random = 70
	}
	country_event = {
		id = es_republic_factions.100
		days = 240 random = 70
	}
	country_event = {
		id = es_government.100
		days = 320 random = 70
	}
	country_event = {
		id = es_consort_events.100
		days = 1 random = 70
	}
	# Dragon Cult events
	#country_event = {
	#	id = es_2_scenario.100
	#	days = 72 random = 140
	#}
	country_event = {
		id = es_8_scenario.100
		days = 1825 random = 140
	}
	country_event = {
		id = es_10_scenario.100
		days = 2025 random = 140
	}
	country_event = {
		id = es_11_scenario.100
		days = 1925 random = 140
	}
	country_event = {
		id = es_13_scenario.100
		days = 2125 random = 140
	}
}

on_bi_yearly_pulse_4 = {

    random_events = { 100 = event_new_diplomatic_actions.200 }
	
	# Fall of Direnni Hegemony - they loose Daggerfall
	if = {
		limit = { NOT = { has_global_flag = fall_of_direnii_flag } owns = 1369 NOT = { culture_group = high_elves_cg } }
		country_event = { id = es_14_scenario.3 }
		set_global_flag = fall_of_direnii_flag
	}
	
}

on_bi_yearly_pulse_5 = {

}


# country random events
on_thri_yearly_pulse = {
	country_event = {
		id = es_dynastic_events.100
		days = 912
	}
	country_event = {
		id = es_flavour_race_events.100
		days = 915
	}
}

on_thri_yearly_pulse_2 = {
	es_perform_events_on_three_year_pulse = yes
}

on_thri_yearly_pulse_3 = {
}

on_thri_yearly_pulse_4 = {
}

on_four_year_pulse = {
	#In 100/5100 of times does event new_diplomatic_actions.400, and in 5000/5100 does nothing
	random_events = {
		100 = event_new_diplomatic_actions.400

		5000 = 0
	}
}

on_four_year_pulse_2 = {
	if = { limit = { uses_personal_deities = yes } change_available_deities = yes }
	mundus_towers = yes
	
	# Dwemer Events
	country_event = {
		id = es_5_scenario.100
		days = 72
	}
}

on_four_year_pulse_3 = {
}

on_four_year_pulse_4 = {
}

on_five_year_pulse = {
	if = { 
		limit = { 
			tag = BLA 
		} 
		country_event = { #Artifact Respawn
			id = es_esb.5
			days = 0
		}
		country_event = { #Global Dev Destruction
			id = es_economy.0
			days = 0
		}
	} 
}

on_five_year_pulse_2 = {
	es_perform_events_on_five_year_pulse = yes
}

on_five_year_pulse_3 = {
}

on_five_year_pulse_4 = {
	if = {
		limit = {
			any_owned_province = { has_province_flag = es_province_to_slave_flag }
			has_reform = slavery
		}
		country_event = { id = event_new_diplomatic_actions.500 }
	}
}

# El Dorado
on_explore_coast = {
}
on_conquistador_empty = {
}

on_conquistador_native = {
}

on_buy_religious_reform = {
	events = {
		es_religious_reforms.1
		es_religious_reforms.2
		es_religious_reforms.3
	}
}

on_circumnavigation = {
	events = {
		es_colonisation_events.1
		es_colonisation_events.2
	}
}

on_become_free_city = {
	events = {
		mechanics_hre.1
	}
}

on_remove_free_city = {
	events = {
		mechanics_hre.2
	}
}

on_revoke_estate_land_ai = { #AI can't handle the rebels atm or perform a gradual revoke, sorry
	add_province_modifier = {
		name = revoked_estate_modifier
		duration = 5475 #15 years
	}
}

on_revoke_estate_land = {
	add_province_modifier = {
		name = revoked_estate_modifier
		duration = 5475 #15 years
	}
	if = {
		limit = {
			has_estate = estate_priests
			has_owner_religion = yes
			owner = {
				NOT = {
					estate_loyalty = {
						estate = estate_priests
						loyalty = 40
					}
				}
			}
		}
		spawn_rebels = {
			type = religious_rebels
			size = 1
		}
	}
	if = {
		limit = {
			has_estate = estate_priests
			has_owner_religion = no
			owner = {
				NOT = {
					estate_loyalty = {
						estate = estate_priests
						loyalty = 40
					}
				}
			}
		}
		spawn_rebels = {
			type = particularist_rebels
			size = 1
		}
	}
	if = {
		limit = {
			has_estate = estate_nobility
			owner = {
				NOT = {
					estate_loyalty = {
						estate = estate_nobility
						loyalty = 40
					}
				}
			}
		}
		spawn_rebels = {
			type = noble_rebels
			size = 1
		}
	}
	
	if = {
		limit = {
			has_estate = estate_mages
			owner = {
				NOT = {
					estate_loyalty = {
						estate = estate_mages
						loyalty = 40
					}
				}
			}
		}
		spawn_rebels = {
			type = religious_rebels
			size = 1
		}
	}
	if = {
		limit = {
			has_estate = estate_mages
			owner = {
				NOT = {
					estate_loyalty = {
						estate = estate_mages
						loyalty = 40
					}
				}
			}
		}
		spawn_rebels = {
			type = particularist_rebels
			size = 1
		}
	}
	if = {
		limit = {
			has_estate = estate_merchants
			owner = {
				NOT = {
					estate_loyalty = {
						estate = estate_merchants
						loyalty = 40
					}
				}
			}
		}
		spawn_rebels = {
			type = particularist_rebels
			size = 1
		}
	}
	if = {
		limit = {
			has_estate = estate_warriors
			owner = {
				NOT = {
					estate_loyalty = {
						estate = estate_warriors
						loyalty = 40
					}
				}
			}
		}
		spawn_rebels = {
			type = noble_rebels
			size = 1
		}
	}
	if = {
		limit = {
			has_estate = estate_commoners
			owner = {
				NOT = {
					estate_loyalty = {
						estate = estate_commoners
						loyalty = 40
					}
				}
			}
		}
		spawn_rebels = {
			type = particularist_rebels
			size = 1
		}
	}

}

on_revoke_estate_land_ai_post = {
	add_local_autonomy = 25
}
on_revoke_estate_land_post = {
	add_local_autonomy = 25
}

on_grant_estate_land = {
	if = {
		limit = {
			has_province_modifier = revoked_estate_modifier
		}
		remove_province_modifier = revoked_estate_modifier
	}
}

on_death_has_harem = {
    if = {
		limit = {
			has_heir = no
		}
		country_event = { id = es_harem_events.2 }
	}
}

on_select_heir_from_harem = {
}

on_fetishist_cult_change = {
}

# country
on_gain_great_power_status = {
	if = {
		limit = {
			NOT = { has_country_flag = became_great_power_flag }
		}
		set_country_flag = became_great_power_flag
	}
}

# country
on_lose_great_power_status = {
}

# province
on_province_religion_converted = {
    owner = {
		change_variable = {
			which = religions_converted
			value = 1
		}
	}
}

# province
on_province_culture_converted = {
    owner = {
		change_variable = {
			which = cultures_converted
			value = 1
		}
	}
}

# THIS = Province, FROM = Country who Propogated
on_convert_by_trade_policy = {
}

# province
# FROM = old owner
on_province_owner_change = {
	if = {
		limit = {
		development = 15 
		owner = { has_reform = slavery }
		}
		set_province_flag = es_province_to_slave_flag
	}
    owner = {
		change_variable = {
			which = provinces_gained
			value = 1
		}
	}
	if = {
		limit = {
			NOT = {
				OR = {
					has_province_modifier = wine_bonus_prod
					has_province_modifier = grain_bonus_prod
				}
			}
		}
		hidden_effect = {
			if = {
				limit = {
					trade_goods = wine
				}
				add_province_modifier = { 
					name = wine_bonus_prod
					duration = -1
					hidden = yes
				}
			}
			if = {
				limit = {
					trade_goods = crops
				}
				add_province_modifier = { 
					name = grain_bonus_prod
					duration = -1
					hidden = yes
				}
			}
		}
	}
	if = {
	    limit = {
		    is_part_of_hre = no
			owner = { is_part_of_hre = yes }
			NOT = { owner = { government = native } }
		}
		set_in_empire = yes
		emperor = { add_imperial_influence = 1 }
	}
	if = {
	    limit = {
		    is_part_of_hre = yes
			owner = { is_part_of_hre = no }
		}
		emperor = { add_imperial_influence = -1 }
	}
	
	if = {
		limit = {
			owner = {
				has_reform = free_city
				num_of_cities = 11
			}
		}
		owner = { country_event = { id = mechanics_hre.3 } }
	}

	if = {
		limit = {
			owner = {
				has_country_flag = es_conquest_notifications_enabled
			}
		}
		es_new_conquests_effect = yes
	}

}

# country
on_parliament_debate_failed = {
}

# country
on_parliament_debate_succeeded = {
}

# country
on_harmonized_po_tun_pantheon = { events = { es_religious_events_harmony.101 } }
on_harmonized_unknown_pantheon = { events = { es_religious_events_harmony.102 } }
on_harmonized_cult_of_lorelia = { events = { es_religious_events_harmony.103 } }

on_harmonized_polytheistic_group = {
	events = {
		es_religious_events_harmony.104
	}
}
on_harmonized_occult_group = {
	events = {
		es_religious_events_harmony.105
	}
}
on_harmonized_elemental_group = {
	events = {
		es_religious_events_harmony.106
	}
}
on_harmonized_daedric_group = {
	events = {
		es_religious_events_harmony.107
	}
}

# country
on_russian_sudebnik = {

}

# country
on_russian_oprichnina = {

}

# country
on_russian_streltsy = {

}

# province
on_consecrate_patriarch = {
}

# country. from = overlord
on_accept_tribute = {
}

# country. from = overlord
on_refuse_tribute = {
}

# country
on_leader_recruited = {
}

# country
on_general_recruited = {
	add_army_professionalism = 0.01
}

# country
on_admiral_recruited = {
}

# country
on_conquistador_recruited = {
}

# country
on_explorer_recruited = {
}

# THIS = Province, FROM = Country
on_regiment_recruited = {

}

# THIS = Province, FROM = Country
on_mercenary_recruited = {
	FROM = {
		add_army_professionalism = -0.01
	}
}

# THIS = One province in the state
on_add_pasha = {
}

# THIS = One province in the state
on_remove_pasha = {
	hidden_effect = {
		owner = {
			save_event_target_as = province_owner
		}
		remove_province_modifier = pasha_removed_modifier
	}

	area = {
		limit = { owned_by = event_target:province_owner }
		add_or_extend_province_modifier_effect = { MODIFIER = pasha_removed_modifier DURATION = 3650 }
	}
}

# THIS = Province
on_janissaries_raised = {
}

on_cawa_raised = {
}
on_revolutionary_guard_raised = {
}								 
on_reform_enacted = {
}

on_reform_changed = {
}

on_trade_company_investment = {
}

on_center_of_trade_upgrade = {
    owner = {
		change_variable = {
			which = cot_upgraded
			value = 1
		}
	}
}

on_center_of_trade_downgrade = {

}

on_culture_promoted = {
    owner = {
    change_variable = {
		which = culture_promoted
		value = 1
	}
	}
}

# FROM = Previous Country, ROOT = Province
on_company_chartered = {
}

# ROOT = Overlord, FROM = Minor
on_dependency_gained = {
	FROM = { change_statists_vs_orangists = 2 }
}

# ROOT = Overlord, FROM = Minor
on_dependency_lost = {

}

# ROOT = New vassal, FROM = Overlord
on_create_vassal = {
	if = {
		limit = {
	    has_dlc = "Emperor"
			FROM = {
				is_revolutionary = yes
			}
		}
		change_government = republic
		add_government_reform = junior_revolutionary_republic_reform
		set_country_flag = had_revolution
	}
	if = {
		limit = {	   
			tag = RED
		}
		change_government = theocracy
		add_government_reform = papacy_reform
		adopt_reform_progress = FROM
	}
}

# ROOT = Country establishing it
# First province in state is set
on_holy_order_established = {

}

# When a minority is expelled to a colony
# THIS = Colony, ROOT = Colony, FROM = Home province
on_minority_expelled = {
	FROM = {
		remove_province_modifier = religious_zeal_at_conv
		add_permanent_province_modifier = {
			name = expelled_minority_home
			duration = 36500
		}
	}
}

# THIS = Raiding country, FROM = Sea province
on_raid_coast = {
	if = {
		limit = {
			has_faction = pr_buccaneers
		}
		add_faction_influence = {
			faction = pr_buccaneers
			influence = 1
		}
	}
}

# ROOT = Tag that captured the flagship, FROM = Tag that lost the flagship
on_flagship_captured = {
}

# ROOT = Tag that destroyed the flagship, FROM = Tag that lost the flagship
on_flagship_destroyed = {
}

# this = Released country, FROM = Releasing country
on_country_released = {

	es_startup_discovery = yes
	if = {
		limit = {
			tag = RED
		}
		change_government = theocracy
		add_government_reform = papacy_reform
		adopt_reform_progress = FROM
	}
	if = {
		limit = {
			FROM = { has_reform = religious_permanent_revolution_reform }
			NOT = { tag = RED }
		}
		change_religion = FROM
		adopt_reform_progress = FROM
		add_country_modifier = {
			name = global_holy_war_released_modifier
			duration = 3650
			hidden = yes
		}
		capital_scope = {
			change_religion = FROM
		}
	}
}

# ROOT = province, FROM = country
on_trade_good_changed = {
	hidden_effect = {
		if = {
			limit = {
				trade_goods = wine
			}
			remove_province_modifier = grain_bonus_prod
			add_province_modifier = { 
				name = wine_bonus_prod
				duration = -1
				hidden = yes
			}
		}
		if = {
			limit = {
				trade_goods = crops
			}
			remove_province_modifier = wine_bonus_prod
			add_province_modifier = { 
				name = grain_bonus_prod
				duration = -1
				hidden = yes
			}
		}
	}
}

# this = country
on_loan_repaid = {
}

# this = country
on_rebels_break_country = {
	add_country_modifier = {
		name = just_lost_to_rebels
		duration = 10
		hidden = yes
	}
}
# this = country
## Fires when you fire or replace your ADM advisor, in the moment before they are actually removed from their post.
## Note: Defining a new advisor here will result in the shortest appointment in history. Use on_post_adm_advisor_fired instead :)
on_pre_adm_advisor_fired = {
	if = {
		limit = {
			has_country_flag = need_to_fire_adm_advisor
		}
		set_country_flag = just_fired_adm_advisor
		remove_advisor_by_category_no_action = ADM
	}
}

# this = country
on_pre_dip_advisor_fired = {
	if = {
		limit = {
			has_country_flag = need_to_fire_dip_advisor
		}
		set_country_flag = just_fired_dip_advisor
		remove_advisor_by_category_no_action = DIP
	}
}

# this = country
on_pre_mil_advisor_fired = {
	if = {
		limit = {
			has_country_flag = need_to_fire_mil_advisor
		}
		set_country_flag = just_fired_mil_advisor
		remove_advisor_by_category_no_action = MIL
	}
}

# this = country
on_post_adm_advisor_fired = {

}

# this = country
on_post_dip_advisor_fired = {
	
}

# this = country
on_post_mil_advisor_fired = {
	
}

# this = new client state, from = parent country
on_create_client_state = {
	if = {
		limit = {
			has_dlc = "Emperor"
			FROM = {
				is_revolutionary = yes
			}
			government = republic
		}
		add_government_reform = junior_revolutionary_republic_reform
		set_country_flag = had_revolution
	}
}

# this = new target, from = previous target (both can be non-existent tag)
on_change_revolution_target = {
	if = {
		limit = { has_reform = junior_revolutionary_republic_reform }
		add_government_reform = revolutionary_republic_reform
	}
}

# this = curia controller (enactor of the bull)
on_golden_bull_enacted = {
	set_country_flag = enacted_golden_bull
}


# province:  spawned whenever a new owner takes over the province
# FROM = The previous owner.
on_conquest = {
	remove_named_unrest = estate_land_seized
}

on_country_creation = { 
	add_stability = 2
	defines.functions.set_to_global_idea_level
	set_variable = {
		which = year_of_coronation
		value = 57
	}
	export_to_variable = {
		variable_name = age_on_coronation
		value = trigger_value:ruler_age
	}
}

on_federation_leader_change = {
	if = {
		limit = { tag = FROM }
		disband_federation = THIS
	}
	else = {
		# New strongest member becomes the new federation leader
		set_federation_leader = THIS
	}

	# TODO IMPLEMENT EVENTS
}

#FROM = country pillaged, ROOT = country doing the pillaging
on_pillaged_capital = {
	slave_raid_pillage_capital_effect = yes
}

#FROM = country dev was transferred from, ROOT = country doing the transferring
on_transfer_development = {
}

on_colonial_type_change = {
	clr_country_flag = encourage_cash_crops_flag
}

on_estate_led_regency = {
	add_ruler_modifier = {
		name = empowered_regency_modifier
		duration = -1
	}
	change_adm = 1
	change_dip = 1
	change_mil = 1
}

on_estate_led_regency_surpassed = {
	if = {
		limit = {
			num_of_powerful_estates = 1
			has_estate_led_regency = {
				estate = any
			}
			NOT = {
				estate_led_regency_influence = 70
			}
		}
		country_event = { id = es_estate_regency_events.1 }
	}
}

on_extended_regency = {
	random_events = {
		100 = es_extended_regency_events.1
		100 = es_extended_regency_events.2
		100 = es_extended_regency_events.3
		100 = es_extended_regency_events.4
		100 = es_extended_regency_events.5
		
		500 = 0
	}
}

on_primary_culture_changed = {
	es_clear_opinion = yes
	es_change_opinion = yes
}

on_estate_removed = {
}

on_colonist_boosting_colony = {
	hidden_effect = {
		if = {
			limit = {
				OR = {
					religion = noreligion
					#test if colonists outnumber natives
					variable_arithmetic_trigger = {
						custom_tooltip = colonysize_is_larger_than_nativesize_tt
						export_to_variable = {
							which = vab_colonysize
							value = trigger_value:colonysize
						}
						export_to_variable = {
							which = vab_nativesize
							value = trigger_value:native_size
						}
						check_variable = {
							which = vab_colonysize
							which = vab_nativesize
						}
					}
					is_in_capital_area = yes
				}
			}
			change_religion = FROM
		}
		if = {
			limit = {
				OR = {
					culture = noculture
					#test if colonists outnumber natives
					variable_arithmetic_trigger = {
						custom_tooltip = colonysize_is_larger_than_nativesize_tt
						export_to_variable = {
							which = vab_colonysize
							value = trigger_value:colonysize
						}
						export_to_variable = {
							which = vab_nativesize
							value = trigger_value:native_size
						}
						check_variable = {
							which = vab_colonysize
							which = vab_nativesize
						}
					}
					is_in_capital_area = yes
				}
			}
			change_culture = FROM
			change_original_culture = FROM
		}
		#if = {
		#	limit = {
		#		NOT = { has_province_flag = es_new_trade_goods_flag }
		#	}
		#	set_province_flag = es_new_trade_goods_flag
		#}
	}
}

on_institution_embracement = {}
on_national_focus_change = {}
on_capital_moved = {}

#ROOT = converted country, FROM = country which force converts ROOT, on_action gets called on Force religion peace and Enforce Religion subject interaction
on_force_conversion = {
	#if = {	#Commented out for now because Catholicism has received a lot of buffs already.
	#	limit = {
	#		FROM = { religion = catholic }
	#	}
	#	if = {
	#		limit = { ROOT = { government_rank = 3 } }
	#		FROM = { add_papal_influence = 20 }
	#	}
	#	else_if = {
	#		limit = { ROOT = { government_rank = 2 } }
	#		FROM = { add_papal_influence = 10 }
	#	}
	#	else = {
	#		FROM = { add_papal_influence = 5 }
	#	}
	#}
}

#ROOT = province that was expanded in, FROM = country that did it
on_expanded_infrastructure = {
}

#ROOT = province that was centralized in
on_centralized_state = {
}