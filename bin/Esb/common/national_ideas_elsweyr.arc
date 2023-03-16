defineloc NEQ_ideas = "Ne-Quin-Al Ideas"
defineloc NEQ_ideas_start = "Ne-Quin-Al Traditions"
defineloc NEQ_ideas_bonus = "Ne-Quin-Al Ambition"
NEQ_ideas = {
	start = {
		global_manpower_modifier = 10%
		ae_impact = -10%
	}
	bonus = {
		infantry_shock = 1
	}
	trigger = {
		tag = NEQ
	}
	free = yes

	defineloc NEQ_ideas_1 = "Queen of Ne Quin-Al"
	defineloc NEQ_ideas_1_desc = "Anequina Sharp-Tongue was a renowned Khajiit queen that was active during the Merethic Era of Elsweyr. In her time, she was the moon-priest and queen of the Ne Quin-al prides that roamed northern Elsweyr."
	NEQ_ideas_1 = {
		missionaries = 1
	}
	defineloc NEQ_ideas_2 = "Boon Companion"
	defineloc NEQ_ideas_2_desc = "But most importantly Anequina Sharp-Tongue was the boon companion of the Mythic-Hero, Khunzar-ri and his Kra'Jun, playing a vital role in preventing the Dragons and later the Betrayer's plot to harness the lunar energy of Jode."
	NEQ_ideas_2 = {
		prestige = 1
	}
	defineloc NEQ_ideas_3 = "Temple of Two-Moons Dance"
	defineloc NEQ_ideas_3_desc = "Ne Quin-al, where great warriors were born and trained - its Temple of Two-Moons Dance is famous even in our day"
	NEQ_ideas_3 = {
		discipline = 5%
	}
	defineloc NEQ_ideas_4 = "Trade for Warriors"
	defineloc NEQ_ideas_4_desc = "might trade its warriors to Torval in exchange for fish and other bounties of the sea."
	NEQ_ideas_4 = {
		possible_condottieri = 0.5
	}
	defineloc NEQ_ideas_5 = "Darloc Brae"
	defineloc NEQ_ideas_5_desc = "Darloc Brae was a Khajiit warlord active throughout the 5th century of the First Era, and his conquest spanned across the northern wastelands between the Larsius River and the Eastern Strid River."
	NEQ_ideas_5 = {
		core_creation = -10%
	}
	defineloc NEQ_ideas_6 = "Golden Beast of Anequina."
	defineloc NEQ_ideas_6_desc = "In his time, Darloc Brae was known as the 'Golden Beast of Anequina', Darloc Brae's reign is thought by some to be the inspiration for Anequina's martial tradition"
	NEQ_ideas_6 = {
		shock_damage = 5%
	}
	defineloc NEQ_ideas_7 = "Preserver of History"
	defineloc NEQ_ideas_7_desc = "And Darloc Brae made the effort to preserve Elsweyr's ancient history, despite his worship of the Fire-Cat, Merrunz."
	NEQ_ideas_7 = {
		prestige_decay = -1%
	}
}
defineloc KHN_ideas = "Khenarthia Ideas"
defineloc KHN_ideas_start = "Khenarthia Traditions"
defineloc KHN_ideas_bonus = "Khenarthia Ambition"
KHN_ideas = {
	start = {
		trade_efficiency = 15%
		naval_morale = 20%
	}
	bonus = {
		siege_blockade_progress = 1
	}
	trigger = {
		tag = KHN
	}
	free = yes

	defineloc KHN_ideas_1 = "Kingdom of Khenarthia"
	defineloc KHN_ideas_1_desc = "Khenarthi's Roost once contained the ancient Kingdom of Khenarthia, one of the original sixteen kingdoms of Elsweyr, known for their sugar production and expert fishermen."
	KHN_ideas_1 = {
		production_efficiency = 10%
	}
	defineloc KHN_ideas_2 = "Great Tree of Khenarthi"
	defineloc KHN_ideas_2_desc = "According to legend, the hawk goddess Khenarthi rested upon a tree on the island during her first journey across the heavens. This tree would later become the Great Tree, found along the coast west of Mistral."
	KHN_ideas_2 = {
		global_trade_goods_size_modifier = 10%
	}
	defineloc KHN_ideas_3 = "Isle of Three Temples"
	defineloc KHN_ideas_3_desc = "Many of the island's Khajiit therefore worship Khenarthi, although traditional worship of Jone and Jode is also prominent. Khenarthi's Roost is known for the three Khajiiti temples to the Crescent Moons, the Dark Moon, and the Two-Moons Dance."
	KHN_ideas_3 = {
		missionaries = 1
	}
	defineloc KHN_ideas_4 = "Uldor the Mage"
	defineloc KHN_ideas_4_desc = "The island was once ruled by a powerful Maormer mage named Uldor, who used his magic to steal and wear the bodies of his victims, entrapping their spirits forever. Uldor was eventually sealed within the Temple of the Mourning Springs along with his victims when the Khajiit received an artifact known as the Mourning Stone from the Maormer who opposed Uldor."
	KHN_ideas_4 = {
		fire_damage_received = -5%
	}
	defineloc KHN_ideas_5 = "Maormer Treaty"
	defineloc KHN_ideas_5_desc = "The Khajiit of the island eventually signed the Treaty of Khenarthi's Roost with the Maormer, wherein an Ambassador of King Orgnum would share power with the Mayor of Mistral. The treaty sought to end Maormer piracy in the region in return for fifteen percent of all registry fees and excises. The usually seafaring Maormer would occupy a full-time embassy in Mistral, and the Maormer festival of Serpent's Glory would be celebrated with a feast every year."
	KHN_ideas_5 = {
		relation_with_accepted_culture = 20
		num_accepted_cultures = 1
	}
	defineloc KHN_ideas_6 = "Snake Magic"
	defineloc KHN_ideas_6_desc = "Snake Magic is an arcane art connected to snakes and sea serpents. A powerful form of snake magic was practiced by the Maormer. They used it to tame the sea serpents of Pyandonea for use as steeds and war beasts."
	KHN_ideas_6 = {
		heavy_ship_power = 15%
	}
	defineloc KHN_ideas_7 = "Worship of Khenarthi"
	defineloc KHN_ideas_7_desc = "Khenarthi, God of Winds, the Gatherer of Waters, and the Elder Spirit of the Heavens, is the Khajiiti goddess of weather and the sky, the most powerful of the Sky Spirits"
	KHN_ideas_7 = {
		movement_speed = 10%
	}
}

defineloc TEN_ideas = "Tenmar Ideas"
defineloc TEN_ideas_start = "Tenmar Traditions"
defineloc TEN_ideas_bonus = "Tenmar Ambition"
TEN_ideas = {
    start = {
        defensiveness = 20%
		land_attrition = -10%
    }
    bonus = {
        global_defender_dice_roll_bonus = 1
    }
    trigger = {
        tag = TEN
    }
    free = yes

    defineloc TEN_ideas_1 = "Tenmar Forest"
    defineloc TEN_ideas_1_desc = "The Tenmar Forest, also known as the Tenmar Jungle, in southern Elsweyr is a large region lying between Torval, the seat of the Mane, and the busy seaport of Senchal."
    TEN_ideas_1 = {
        hostile_attrition = 1
    }
    defineloc TEN_ideas_2 = "Moon-Sugar Production"
    defineloc TEN_ideas_2_desc = "Primarily known for the production and export of moon sugar, its sugarcane groves are venerated and diligently guarded by the Khajiit."
    TEN_ideas_2 = {
        global_trade_goods_size_modifier = 20%
    }
    defineloc TEN_ideas_3 = "Dagi and Dagi-raht"
    defineloc TEN_ideas_3_desc = "The forest is home to two sub-species of Khajiit rarely found elsewhere, the Dagi and Dagi-raht. Both of which are naturally talented at climbing the large trees of Tenmar."
    TEN_ideas_3 = {
        development_cost = -10%
    }
    defineloc TEN_ideas_4 = "Senche-Tigers and Senche-Leopards"
    defineloc TEN_ideas_4_desc = "Tenmar Senche-Tigers and Tenmar Senche-Leopards are fearsome predators of the Forest, however, the Leopards are also bred by Khajiit for hunting."
    TEN_ideas_4 = {
        shock_damage = 5%
    }
    defineloc TEN_ideas_5 = "Home of the Divine Substance"
    defineloc TEN_ideas_5_desc = "The khajiit also believe that their gods regularly bestow blessings to their chosen people, in the form of the moon-sugar, a substance native to the Tenmar Forest in southern Elsweyr."
    TEN_ideas_5 = {
        religious_unity = 10%
    }
    defineloc TEN_ideas_6 = "Crystallized Moonlight"
    defineloc TEN_ideas_6_desc = "The khajiit understand it to be 'crystallized moonlight,' caught in the water of the Topal Sea and brought to the sugarcane groves of the Tenmar by the force of the twin tides. By partaking of the sugar, the khajiit believes they are consuming small portions of their gods' eternal souls."
    TEN_ideas_6 = {
        monthly_splendor = 1
    }
    defineloc TEN_ideas_7 = "Tree-dwelling Khajiit"
    defineloc TEN_ideas_7_desc = "The Queen and Her Court come down the road, The Jungle Queen of Tenmar, The forest folk of leaf and branch, Tree-dwelling furstocks of Tenmar"
    TEN_ideas_7 = {
		attack_bonus_in_capital_terrain = yes
    }
}

defineloc riv_ideas = "Riverhold Ideas"
defineloc riv_ideas_start = "Riverhold Traditions"
defineloc riv_ideas_bonus = "Riverhold Ambition"
RIV_ideas = {
 	trigger = {
 		tag = RIV
 	}
 	free = yes
	 start = {
	trade_range_modifier = 0.25
	global_tax_modifier = 0.15
 	}
 	bonus = {
	global_trade_power = 0.20
 	}
	defineloc riv_ideas_1 = "River-Land"
	defineloc riv_ideas_1_desc = "The Queen and Her Court come down the road. The Queen of Riverhold. The doughty farmers of the north. Planters of Riverhold."
	riv_ideas_1 = {
	prestige = 0.75
 	}
	defineloc riv_ideas_2 = "Trade Hub"
	defineloc riv_ideas_2_desc = "The town is well-known for their swarming, and overcrowded marketplaces, more than other city-states of a similar stature. People across the northern countryside flock to the markets of Riverhold, to sell their goods and trades from their carriages."
 	riv_ideas_2 = {
		center_of_trade_upgrade_cost = -0.15
 	}
	defineloc riv_ideas_3 = "Waterways"
	defineloc riv_ideas_3_desc = "Riverhold is one of the eight major cities in the province of Elsweyr, found along the streams and waterfalls of the Larsius River. Being close to Cyrodiil, its very fertile land provide for much of Elsweyr."
 	riv_ideas_3 = {
		global_trade_goods_size_modifier = 0.15
	}
	defineloc riv_ideas_4 = "House of Histories"
	defineloc riv_ideas_4_desc = "Dedicated to protect Elsweyr history and preserve numerous artifact including restoring long lost Song of Kingdoms which was once shattered to 16 pieces"
 	riv_ideas_4 = {
		all_power_cost = -0.05
	}
	defineloc riv_ideas_5 = "Rithana-di-Renada"
	defineloc riv_ideas_5_desc = "The Rithana-di-Renada, or Song of Kingdoms, is an ancient stone mural of Khajiiti make. It portrays the sixteen kingdoms of Elsweyr, symbolic of the harmony, unity, and peace between them. Its centerpiece, the unassuming Singing Crystal, emits a beautiful melody known also as the Song of Kingdoms when placed in the mural."
 	riv_ideas_5 = {
		innovativeness_gain = 0.5
		reform_progress_growth = 0.15
 	}
	defineloc riv_ideas_6 = "Senche Riders"
	defineloc riv_ideas_6_desc = "The Noble Senche-Lion of Riverhold are tamed to guard duty and even mounts for worthy warriors"
 	riv_ideas_6 = {
		cavalry_power = 0.15
 	}
	defineloc riv_ideas_7 = "The Axers"
	defineloc riv_ideas_7_desc = "Arena was originally conceived as a fighting game featuring a tournament that took the player to each of Tamriel's cities to challenge different gladiatorial teams. According to a file from that stage of development left behind in the final game, Riverhold's gladiatorial team would have been called the Axers."
 	riv_ideas_7 = {
		leader_land_shock = 1
 	}
}

defineloc dun_ideas = "Dune Ideas"
defineloc dun_ideas_start = "Dune Traditions"
defineloc dun_ideas_bonus = "Dune Ambition"
DUN_ideas = {
 	trigger = {
 		tag = DUN
 	}
 	free = yes
 	start = {
		trade_steering = 0.15
		leader_land_manuever = 1
 	}
 	bonus = {
		infantry_power = 0.125
 	}
	defineloc dun_ideas_1 = "Hunt-Lords Legacy"
	defineloc dun_ideas_1_desc = "In the Merethic Era, the sixteen clans were ruled by a cruel hunter-aristocracy led by Hunt-Lords, one that clashed with the Temple of Two-Moons Dance. The Hunt-Lord, Takanzin the Striped-Death paid a flock of criminals to raze the Temple in Rawl'kha, and in retaliation, the clergy and monks assembled a small army of warrior-adepts. But the Hunt-Lord was able to quash the rebellion and forced them out of Dune's kingdom."
 	dun_ideas_1 = {
		global_unrest = -2
		harsh_treatment_cost = -0.25
 	}
	defineloc dun_ideas_2 = "Grinning Moons Inn"
	defineloc dun_ideas_2_desc = "Be prepared to pay a hefty sum, but know that what you will receive in exchange is worth every bit."
 	dun_ideas_2 = {
		global_prosperity_growth = 0.1
		spy_offence = 0.15
 	}
	defineloc dun_ideas_3 = "Moon-Bishop of Dune"
	defineloc dun_ideas_3_desc = "The King and His Court come down the road. The Moon-Bishop of Dune. The priests and scholars of the past. The dusty sages of Dune."
 	dun_ideas_3 = {
		tolerance_own = 1
		global_missionary_strength = 0.02
	}
	defineloc dun_ideas_4 = "Fort Sphinxmoth"
	defineloc dun_ideas_4_desc = "It was built into the side of a mountain to be nigh impregnable, and the halls were filled with all manner of traps."
 	dun_ideas_4 = {
		army_tradition_decay = -0.015
	}
	defineloc dun_ideas_5 = "Temple of Two-Moons Dance"
	defineloc dun_ideas_5_desc = "The Temples of Two Moons Dance are places of philosophical study and martial training located throughout Elsweyr. They date back to the First Era at the latest, when the Khajiiti kingdom Anequina was known to trade the mighty graduates of its Temple to other Khajiiti kingdoms in return for various needs. The Temples have been known to produce the most skilled warriors."
 	dun_ideas_5 = {
		discipline = 0.075
 	}
	defineloc dun_ideas_6 = "Layered Defense"
	defineloc dun_ideas_6_desc = "The city is built on a very large hill and it is layered five times toward the top. The bottom and first layer is where the local wayshrine, as well as several camps are located. The main road runs past the city goes through the camp and under an arching bridge that connects the third layer of the city to the wayshrine. The second layer is the city's plaza, where many homes are located, all of which centered around a watering well. There is enough space for merchants to camp more stalls and caravans."
 	dun_ideas_6 = {
		defensiveness = 0.15
 	}
	defineloc dun_ideas_7 = "The Duneguard Outwalkers"
	defineloc dun_ideas_7_desc = "The Duneguard Outwalkers, formally known as the Dakarn Clan, were Khajiit brigands that waged war with the Vinedusk Rangers of Valenwood, across the provincial border in Reaper's March. They were active in the late years of the Second Empire. Remnants of this clan became known by their current name, the Duneguard Outwalkers."
 	dun_ideas_7 = {
		rebel_support_efficiency = 0.75
	}
}

defineloc ver_ideas = "Verkarth Ideas"
defineloc ver_ideas_start = "Verkarth Traditions"
defineloc ver_ideas_bonus = "Verkarth Ambition"
VER_ideas = {
 	trigger = {
 		tag = VER
 	}
 	free = yes
 	start = {
		caravan_power = 0.2
		all_estate_loyalty_equilibrium = 0.075
 	}
 	bonus = {
		min_autonomy_in_territories = -0.1
 	}
	defineloc ver_ideas_1 = "Verkarth Hills"
	defineloc ver_ideas_1_desc = "The King and His Court come down the road. The Warrior King of Verkarth. Fierce wielders of the sword and bow. The swift-marching soldiers of Verkarth."
 	ver_ideas_1 = {
		heir_chance = 0.5
		yearly_absolutism = 0.25
 	}
	defineloc ver_ideas_2 = "Hunter Aristocracy"
	defineloc ver_ideas_2_desc = "At that time, the famed sixteen kingdoms of the Khajiit were little more than competing fiefdoms, ruled by a cruel hunter-aristocracy. Severe droughts and periods of famine struck Anequina with pitiless regularity, and the constant feuding of the hunter-nobles resulted in widespread military conscription?robbing peasant communities of youthful labor and prompting still greater famine across the region."
 	ver_ideas_2 = {
		global_autonomy = -0.075
 	}
	defineloc ver_ideas_3 = "Do-radhim"
	defineloc ver_ideas_3_desc = "The do-radhin of Verkarth were some of the most skillful warriors of their time. And Rajhin would know, for he ended up on the wrong side of their blades more than once."
 	ver_ideas_3 = {
		shock_damage = 0.125
	}
	defineloc ver_ideas_4 = "Swift Marchers"
	defineloc ver_ideas_4_desc = "Move not unless you see an advantage; use not your troops unless there is something to be gained; fight not unless the position is critical."
 	ver_ideas_4 = {
		reinforce_speed = 0.10
		movement_speed = 0.075
	}
	defineloc ver_ideas_5 = "Rural Kingdom"
	defineloc ver_ideas_5_desc = "Verkarth was the least populated of sixteen kingdoms holding only due to their bow and sword masters."
 	ver_ideas_5 = {
		own_territory_dice_roll_bonus = 1
 	}
	defineloc ver_ideas_6 = "Valenwood Wood"
	defineloc ver_ideas_6_desc = "Khajiit are cutting and hunting on Valenwood borders much to Green Pact Bosmer dismay."
 	ver_ideas_6 = {
		diplomatic_reputation = -1
		production_efficiency = 0.15
 	}
	defineloc ver_ideas_7 = "Baandari Code"
	defineloc ver_ideas_7_desc = "A fair trade need not be fair only in gold. Truth and cleverness need not be enemies. Find what is lost, trade what is found, and leave what has no purpose."
 	ver_ideas_7 = {
		merchants = 1
 	}
}

defineloc orc_ideas = "Orcrest Ideas"
defineloc orc_ideas_start = "Orcrest Traditions"
defineloc orc_ideas_bonus = "Orcrest Ambition"
ORC_ideas = {
 	trigger = {
 		tag = ORC
 	}
 	free = yes
 	start = {
		global_regiment_recruit_speed = -0.10
		mil_advisor_cost = -0.15
 	}
 	bonus = {
		missionaries = 1
		curia_powers_cost = -0.1
 	}
	defineloc orc_ideas_1 = "Scar of Anequina"
	defineloc orc_ideas_1_desc = "The Scar is a large desert that runs through Anequina, in the province of Elsweyr. The Scar acquired its name due to the nature of its geography. It is intrinsically carved into the region, leaving the surrounding area wounded with harsh wastelands and treacherous cliffs, and the incision as a winding chasm."
 	orc_ideas_1 = {
		hostile_attrition = 2
		reinforce_cost_modifier = 0.15
 	}
	defineloc orc_ideas_2 = "Rogues Den"
	defineloc orc_ideas_2_desc = "The Queen and Her Court come down the road. The Sovereign of Orcrest. The desert cats of the baking sand. The windblown rogues of Orcrest."
 	orc_ideas_2 = {
		leader_land_manuever = 1
		spy_offence = 0.15
 	}
	defineloc orc_ideas_3 = "Survivors Instincts"
	defineloc orc_ideas_3_desc = "Thrassian Plague, Khaneten flu, daedra invasions, harpy terrorism. Orcrest survived all to tell the tale. You might hear Khajiit swear by the Dust of Orcrest."
 	orc_ideas_3 = {
		discipline = 0.03
		land_attrition = -0.10
	}
	defineloc orc_ideas_4 = "Cherim's Heart of Anequina"
	defineloc orc_ideas_4_desc = "The Heart of Anequina presents an historic battle of the Five Year War between Elsweyr and Valenwood which raged from 3E 394 until 3E 399. In most fair accounts, the war lasted 4 years and 9 months, but artistic license from the great epic poets added an additional three months to the ordeal."
 	orc_ideas_4 = {
		no_stability_loss_on_monarch_death = yes
	}
	defineloc orc_ideas_5 = "White Lions"
	defineloc orc_ideas_5_desc = "Rare albinos form up Honor Gzard in service to Orcrest rzlers."
 	orc_ideas_5 = {
		army_tradition_from_battle = 0.25
		infantry_power = 0.10
 	}
	defineloc orc_ideas_6 = "Commerce Center"
	defineloc orc_ideas_6_desc = "While Riverhold is the gateway to Anequina, and Rimmen the capital, Orcrest is the center of commerce. This ancient, walled city rests along the cliffs of the Scar, outstretching its welcoming arms to bring the disparate regions of Anequina together."
 	orc_ideas_6 = {
		global_own_trade_power = 0.15
 	}
	defineloc orc_ideas_7 = "Silent Ones"
	defineloc orc_ideas_7_desc = "Arena was originally conceived as a fighting game featuring a tournament that took the player to each of Tamriel's cities to challenge different gladiatorial teams. According to a file from that stage of development left behind in the final game, Orcrest's gladiatorial team would have been called the Silent Ones."
 	orc_ideas_7 = {
		morale_damage_received = -0.075
 	}
}

defineloc hel_ideas = "Helkarn Ideas"
defineloc hel_ideas_start = "Helkarn Traditions"
defineloc hel_ideas_bonus = "Helkarn Ambition"
HEL_ideas = {
 	trigger = {
 		tag = HEL
 	}
 	free = yes
 	start = {
		interest = -1
		monarch_diplomatic_power = 1
 	}
 	bonus = {
		reduced_stab_impacts = yes
 	}
	defineloc hel_ideas_1 = "Helkarn Land"
	defineloc hel_ideas_1_desc = "The King and His Court come down the road. The Livestock Lord of Helkarn. Wary and sharp-eyed shepherd folk. The herding cats of Helkarn."
 	hel_ideas_1 = {
		yearly_corruption = -0.15
 	}
	defineloc hel_ideas_2 = "Helkarn Wolf"
	defineloc hel_ideas_2_desc = "They have a unique breed of wolf known as the Helkarn Wolf. Their young are more sociable than the typical wolf. For a time, they were used as watchdogs, until they were considered unsuitable, so instead, they were bred to be rideable mounts."
 	hel_ideas_2 = {
		cavalry_flanking = 0.15
		cavalry_power = 0.15
 	}
	defineloc hel_ideas_3 = "Herding Cats"
	defineloc hel_ideas_3_desc = "Helkarn was one of the original sixteen kingdoms of Elsweyr, even back then, they were known for breeders and shepherds."
 	hel_ideas_3 = {
		production_efficiency = 0.15
		global_tax_modifier = -0.05
	}
	defineloc hel_ideas_4 = "Extensive Conscription"
	defineloc hel_ideas_4_desc = "In the late years of the Merethic Era, the feudal Hunt-Lord of Helkarn was in constant odds with the contemporary Hunt-Lord of Meirvale. It was to the point where they drafted thousands of their peasants, inadvertently causing one of the worst famines in Elsweyr."
 	hel_ideas_4 = {
		manpower_recovery_speed = 0.25
		global_tax_modifier = -0.05
	}
	defineloc hel_ideas_5 = "Between the Two"
	defineloc hel_ideas_5_desc = "While Helkarn belongs on the edge of Pellitine, its central position had been contested many times during the two kingdom's rivalry."
 	hel_ideas_5 = {
		war_exhaustion_cost = -0.20
 	}
	defineloc hel_ideas_6 = "Scouting Parties"
	defineloc hel_ideas_6_desc = "Helkarn wolf shepherds are often employed as scouts"
 	hel_ideas_6 = {
		envoy_travel_time = -0.33
 	}
	defineloc hel_ideas_7 = "Khajiit rise up!"
	defineloc hel_ideas_7_desc = "Helkarn were among the first who rose against hunt-lords. They can beat any empire that thinks they can control the wild."
 	hel_ideas_7 = {
		ae_impact = -0.15
		can_chain_claim = yes
 	}
}

defineloc rim_ideas = "Rimmen Ideas"
defineloc rim_ideas_start = "Rimmen Traditions"
defineloc rim_ideas_bonus = "Rimmen Ambition"
RIM_ideas = {
 	trigger = {
 		tag = RIM
 	}
 	free = yes
 	start = {
		trade_efficiency = 0.25
		global_unrest = 2
 	}
 	bonus = {
		mercantilism_cost = -0.15
 	}
	defineloc rim_ideas_1 = "Anequina Capital"
	defineloc rim_ideas_1_desc = "Rimmen is found in the greater region of Anequina, which is known for its harsh deserts and dry savannahs. However, Rimmen is found in the Rim Territories, where the grasslands are more somewhat vibrant and lively. It is a crossover from the neighboring regions of the Nibenay and Pellitine."
 	rim_ideas_1 = {
		establish_order_cost = -0.15
 	}
	defineloc rim_ideas_2 = "Haughty Court"
	defineloc rim_ideas_2_desc = "The King and His Court come down the road. The haughty King of Rimmen. The motley traders of the Rim. The fractious folk of Rimmen."
 	rim_ideas_2 = {
		advisor_cost = -0.20
		yearly_corruption = 0.075
 	}
	defineloc rim_ideas_3 = "Oasis of Hospitality"
	defineloc rim_ideas_3_desc = "Rimmen is seen as the epitome of Elsweyri hospitality. It is an oasis in the harshlands of Northern Elsweyr, as tropical plants and trees grow on artificial canals that flow from the great Anequine aqueducts."
 	rim_ideas_3 = {
		diplomatic_reputation = 2
	}
	defineloc rim_ideas_4 = "Ivory Palaces"
	defineloc rim_ideas_4_desc = "Rimmen is a large walled-off city with water canals and domed buildings built from ivory-colored stone and lush tropical greenery. The canals get water from the aqueducts that span across the Kingdom of Rimmen. In the city, they empty in the town square, into relaxing pools of water where several people pass the time to relax and meditate."
 	rim_ideas_4 = {
		great_project_upgrade_cost = -0.10
	}
	defineloc rim_ideas_5 = "Tonenaka Shrine"
	defineloc rim_ideas_5_desc = "When the Akaviri of the then-defunct Second Empire entered Anequina, they brought their culture with them, and it changed Rimmen forever. They built the Tonenaka in the traditional Akaviri style. It is described to hold ten-thousand statues crafted from sculptors across southern Tamriel."
 	rim_ideas_5 = {
		religious_unity = 0.15
		papal_influence = 2
 	}
	defineloc rim_ideas_6 = "Rim-men"
	defineloc rim_ideas_6_desc = "The Rim-Men are a group of Imperials that live across the Rim Territories in the province of Elsweyr. The Rim-Men descended from Imperial retainers that worked and later intermingled with the Tsaesci that served the Second Empire of Cyrodiil."
 	rim_ideas_6 = {
		general_cost = -0.10
		infantry_power = 0.10
 	}
	defineloc rim_ideas_7 = "Moon Sugar Monopoly"
	defineloc rim_ideas_7_desc = "The Potentate of Rimmen was notably in control of the distribution of Moon-Sugar, fixing the price to his benefit and persecuting, or even executing anyone for selling it."
 	rim_ideas_7 = {
		embargo_efficiency = 0.33
 	}
}

defineloc mei_ideas = "Meirvale Ideas"
defineloc mei_ideas_start = "Meirvale Traditions"
defineloc mei_ideas_bonus = "Meirvale Ambition"
MEI_ideas = {
 	trigger = {
 		tag = MEI
 	}
 	free = yes
 	start = {
		state_maintenance_modifier = -0.20
		years_of_nationalism = -5
 	}
 	bonus = {
		global_sailors_modifier = 0.33
 	}
	defineloc mei_ideas_1 = "Rumdom"
	defineloc mei_ideas_1_desc = "The Queen and Her Court come down the road. The Rum-Potentate of Meirvale. The brewers and distillers bold. The joyous fermenters of Meirvale."
 	mei_ideas_1 = {
		global_sailors = 10000
		allowed_marine_fraction = 0.33
 	}
	defineloc mei_ideas_2 = "Merryvale Farms"
	defineloc mei_ideas_2_desc = "The Khajiit that live in Merryvale are known for harvesting moon sugar, which can be made into alcohol such as rum."
 	mei_ideas_2 = {
		development_cost = -0.1
		production_efficiency = 0.075
 	}
	defineloc mei_ideas_3 = "Scar"
	defineloc mei_ideas_3_desc = "In its time, Meirvale was one of the original sixteen kingdoms of Elsweyr, known for their brewers and distillers. But gradually, the Kingdom of Meirvale had ceased with the changing times and all that remained was the barren wastelands known as the Scar."
 	mei_ideas_3 = {
		build_cost = 0.15
		leader_land_shock = 1
	}
	defineloc mei_ideas_4 = "The Sorrows"
	defineloc mei_ideas_4_desc = "To this day, instead of drinking their spirits up, the people of the Scar now drink in sorrow."
 	mei_ideas_4 = {
		shock_damage_received = -0.10
		global_unrest = -2
	}
	defineloc mei_ideas_5 = "The Stitches"
	defineloc mei_ideas_5_desc = "Shanty town where bandits and low-lifes seek refuge in the remnants of once mighty rumdom."
 	mei_ideas_5 = {
		rebel_support_efficiency = 0.5
		discovered_relations_impact = -0.2
 	}
	defineloc mei_ideas_6 = "Meirvale Treasure"
	defineloc mei_ideas_6_desc = "Adventurers seek to find centuries matured rum casks."
 	mei_ideas_6 = {
		global_tax_modifier = 0.15
 	}
	defineloc mei_ideas_7 = "Crime Lords"
	defineloc mei_ideas_7_desc = "Lawless land creates its own rules and hierarchies."
 	mei_ideas_7 = {
		global_autonomy = -0.075
		sailor_maintenance_modifer = -0.15
 	}
}

defineloc cri_ideas = "Corinthe Ideas"
defineloc cri_ideas_start = "Corinthe Traditions"
defineloc cri_ideas_bonus = "Corinthe Ambition"
CRI_ideas = {
 	trigger = {
 		tag = CRI
 	}
 	free = yes
 	start = {
		advisor_pool = 1
		war_exhaustion = -0.03
 	}
 	bonus = {
		garrison_size = 0.20
 	}
	defineloc cri_ideas_1 = "Heart of Elsweyr"
	defineloc cri_ideas_1_desc = "Corinth, heart of the Province Elsweyr, greets our weary brethren..."
 	cri_ideas_1 = {
		improve_relation_modifier = 0.25
 	}
	defineloc cri_ideas_2 = "Carpenter Queen"
	defineloc cri_ideas_2_desc = "The Queen and Her Court come down the road. The Carpenter Queen of Corinthe. The lumber cats of the upland woods. The carvers and joiners of Corinthe."
 	cri_ideas_2 = {
		build_cost = -0.15
 	}
	defineloc cri_ideas_3 = "Dark Brotherhood Sanctuary"
	defineloc cri_ideas_3_desc = "Dark Brotherhood chose their main base of operation in the middle of the province."
 	cri_ideas_3 = {
		stability_cost_modifier = -0.10
		spy_offence = 0.20
	}
	defineloc cri_ideas_4 = "Dark Moon Lynx"
	defineloc cri_ideas_4_desc = "The Khajiit of Corinthe believe that the Dark Moons Lynx is a worldly incarnation of Southpaw, the legendary mount of the Khajiiti god of thieves, Rajhin the Footpad. This breed of lynx gets its name from its dark fur, which drew comparisons to the Dark Moons, a phenomenon that appears in a dark eclipse."
 	cri_ideas_4 = {
		tolerance_own = 1
		papal_influence = 1.5
	}
	defineloc cri_ideas_5 = "First Corinthe Hussars"
	defineloc cri_ideas_5_desc = "The First Corinthe Hussars is a calvary of warriors from the eponymous city and the horse of their choice was the Pellitine Mustang, a breed from the small equines of Pellitine with striped patterns for camouflage under the canopy, and the larger Anequine Mustang."
 	cri_ideas_5 = {
		cavalry_power = 0.20
		cav_to_inf_ratio = 0.10
 	}
	defineloc cri_ideas_6 = "Tenmar Forest"
	defineloc cri_ideas_6_desc = "The Khajiiti creation myth explains the hot deserts of northern Elsweyr and the wet and poisonous Tenmar Forest in the south to be made by Nirni as revenge for being tricked by Azurah."
 	cri_ideas_6 = {
		hostile_attrition = 1
 	}
	defineloc cri_ideas_7 = "Temple of Agamanus"
	defineloc cri_ideas_7_desc = "The Temple of Agamanus is a Khajiiti ruin located south of Corinthe, in the province of Elsweyr. It is dedicated to the eponymous Sphinx of Gazia, Agamanus, and prior to its abandonment, the temple greeted pilgrims on their journey."
 	cri_ideas_7 = {
		free_policy = 1
 	}
}

defineloc ala_ideas = "Alabaster Ideas"
defineloc ala_ideas_start = "Alabaster Traditions"
defineloc ala_ideas_bonus = "Alabaster Ambition"
ALA_ideas = {
 	trigger = {
 		tag = ALA
 	}
 	free = yes
 	start = {
		light_ship_cost = -0.15
		prestige_decay = -0.015
 	}
 	bonus = {
		ship_durability = 0.075
 	}
	defineloc ala_ideas_1 = "Bard City"
	defineloc ala_ideas_1_desc = "The Queen and Her Court come down the road. Bard-Queen of Alabaster. The learned poets of the coast. Dramatists of Alabaster."
 	ala_ideas_1 = {
		idea_cost = -0.125
 	}
	defineloc ala_ideas_2 = "White Walls"
	defineloc ala_ideas_21_desc = "The town is known for the great white walls that surround the city, hence the name."
 	ala_ideas_2 = {
		defensiveness = 0.15
 	}
	defineloc ala_ideas_3 = "Alabaster Arbalesters"
	defineloc ala_ideas_3_desc = "Alabaster militia uses crossbows and arbalests instead of more traditional bow mastery."
 	ala_ideas_3 = {
		backrow_artillery_damage = 0.15
	}
	defineloc ala_ideas_4 = "Jerboa Farms"
	defineloc ala_ideas_4_desc = "Small hopping rodents found in Elsweyr with long ears and legs. They breed quickly, and their meat is said to taste sweet. Ratmen do not exist though, dont believe such silly rumors."
 	ala_ideas_4 = {
		global_trade_goods_size_modifier = 0.125
	}
	defineloc ala_ideas_5 = "Alfiq City"
	defineloc ala_ideas_5_desc = "Magically gifted TOTALLY NOT HOUSECATS."
 	ala_ideas_5 = {
		leader_land_fire = 1
 	}
	defineloc ala_ideas_6 = "Elsweyr Drama"
	defineloc ala_ideas_6_desc = "Alabaster was one of the original sixteen kingdoms of Elsweyr, known for their bards, playwrights, poets,"
 	ala_ideas_6 = {
		dip_advisor_cost = -0.15
 	}
	defineloc ala_ideas_7 = "Spice Trade"
	defineloc ala_ideas_7_desc = "Its not moon sugar I promise."
 	ala_ideas_7 = {
		naval_tradition_from_trade = 0.33
 	}
}

defineloc tor_ideas = "Torval Ideas"
defineloc tor_ideas_start = "Torval Traditions"
defineloc tor_ideas_bonus = "Torval Ambition"
DUN_ideas = {
 	trigger = {
 		tag = DUN
 	}
 	free = yes
 	start = {
		galley_power = 0.15
		governing_capacity_modifier = 0.1
 	}
 	bonus = {
		naval_forcelimit_modifier = 0.1
 	}
	defineloc tor_ideas_1 = "Sacred City"
	defineloc tor_ideas_1_desc = "The King and His Court come down the road. The Sacred Mane of Torval. Servants of hirsute majesty. The loyal guards of Torval."
 	tor_ideas_1 = {
		tolerance_own = 3
 	}
	defineloc tor_ideas_2 = "The Mane"
	defineloc tor_ideas_2_desc = "Spiritual leader of Khajiit. Khajiit tradition holds that only one Mane can be alive at one time and, more specifically, believe that there is actually only one Mane who is reborn again and again in different bodies."
 	tor_ideas_2 = {
		papal_influence = 2.5
		global_missionary_strength = 0.02
 	}
	defineloc tor_ideas_3 = "Sugarcane Gardens"
	defineloc tor_ideas_3_desc = "The Mane and their tribe live in exotic palaces, which are surrounded by symmetrical sugarcane gardens where the Mane would meditate."
 	tor_ideas_3 = {
		development_cost = -0.15
	}
	defineloc tor_ideas_4 = "Lunar Guard"
	defineloc tor_ideas_4_desc = "Warrior Guard served the spiritual leader of the Khajiit, the Mane. By tradition, they are all mounted on matching Black Mane Lions, which are reserved for them alone. Riding one of those steeds near them is considered a great taboo."
 	tor_ideas_4 = {
		army_tradition = 0.75
	}
	defineloc tor_ideas_5 = "Temple of Two-Moons Dance"
	defineloc tor_ideas_5_desc = "The Temples have been known to produce the most skilled warriors. For untold years, the Temple in Torval has been the finest training ground for unarmed combat in all of Tamriel."
 	tor_ideas_5 = {
		drill_gain_modifier = 0.33
		infantry_power = 0.10
 	}
	defineloc tor_ideas_6 = "The Firedrakes"
	defineloc tor_ideas_6_desc = "Arena was originally conceived as a fighting game featuring a tournament that took the player to each of Tamriel's cities to challenge different gladiatorial teams. According to a file from that stage of development left behind in the final game, Torval's gladiatorial team would have been called the Firedrakes."
 	tor_ideas_6 = {
		fire_damage_received = -0.10
 	}
	defineloc tor_ideas_7 = "Valenwood Oak"
	defineloc tor_ideas_7_desc = Torval Palaces and its navy are crafted from Valenwood Oak.
 	tor_ideas_7 = {
		global_foreign_trade_power = 0.15
 	}
}

defineloc paa_ideas = "Pa'Alatiin Ideas"
defineloc paa_ideas_start = "Pa'Alatiin Traditions"
defineloc paa_ideas_bonus = "Pa'Alatiin Ambition"
PAA_ideas = {
 	trigger = {
 		tag = PAA
 	}
 	free = yes
 	start = {
		max_absolutism = 15
		governing_capacity_modifier = 0.15
 	}
 	bonus = {
		merc_maintenance_modifier = -0.15
 	}
	defineloc paa_ideas_1 = "Pa'alatiin"
	defineloc paa_ideas_1_desc = "The King and His Court come down the road. The Pious Prince of Pa'alatiin. The arcane adepts of oracular oaths. The prayerful priests of Pa'alatiin."
 	paa_ideas_1 = {
		all_power_cost = -0.05
 	}
	defineloc paa_ideas_2 = "Two Kingdoms"
	defineloc paa_ideas_2_desc = "After Thrassian Plague former sixteen kingdoms united into two realms, Pellitine and Anequina, who feuded for centuries."
 	paa_ideas_2 = {
		power_projection_from_insults = 0.75
		monarch_admin_power = 1
 	}
	defineloc paa_ideas_3 = "Moon Sugar Agriculture"
	defineloc paa_ideas_3_desc = "Purrs Sweet moon sugar."
 	paa_ideas_3 = {
		production_efficiency = 0.15
		build_time = 0.15
	}
	defineloc paa_ideas_4 = "Mercenary Army"
	defineloc paa_ideas_4_desc = "Pellitine had wealth enough to hire mercenaries thanks to its fertile lands and the cultivation of Moon Sugar derived from the Tenmar Forest."
 	paa_ideas_4 = {
		mercenary_discipline = 0.05
		mercenary_manpower = 0.15
	}
	defineloc paa_ideas_5 = "Wall of Life"
	defineloc paa_ideas_5_desc = "The residents of Black Heights paint their mark before they pass on to the Sands Behind the Stars."
 	paa_ideas_5 = {
		global_prosperity_growth = 0.15
		global_monthly_devastation = -0.05
 	}
	defineloc paa_ideas_6 = "Moonlit Cove"
	defineloc paa_ideas_6_desc = "The moonlight and the waters from the Southern Sea and Topal Bay are harnessed and blended together into the cove to achieve the serene and calm ambiance of the night sky, blocking out the harsh sunlight from outside. Many people come to the temple to soak in the blessed sugar waters and its shrines to soothe their mind, body, and soul."
 	paa_ideas_6 = {
		reform_progress_growth = 0.15
 	}
	defineloc paa_ideas_7 = "Halls of Colossus"
	defineloc paa_ideas_7_desc = "These ancient ruins have existed in the area long before recorded history, with no indication of who built them, or why. But as the eras go by, the Halls of Colossus was used to contain ancient weapons, from Numidium, to a piece of the Staff of Chaos."
 	paa_ideas_7 = {
		land_morale = 0.10
 	}
}
defineloc SEN_ideas = "Senchal Ideas"
defineloc SEN_ideas_start = "Senchal Traditions"
defineloc SEN_ideas_bonus = "Senchal Ambition"
SEN_ideas = {
 	trigger = {
 		tag = SEN
 	}
 	free = yes
 	start = {
		inflation_reduction = 0.1
		national_focus_years = -10
 	}
 	bonus = {
		diplomatic_reputation = 2
 	}
	defineloc SEN_ideas_1 = "Harbor-Duchy"
	defineloc SEN_ideas_1_desc = "The King and His Court come down the road. The Harbor-Duke of Senchal. Sailors and stevedores of the ports. The nautical knaves of Senchal."
 	SEN_ideas_1 = {
		global_ship_cost = -0.10
 	}
	defineloc SEN_ideas_2 = "Smuggler Port"
	defineloc SEN_ideas_2_desc = "The highly-populated harbor contains all sorts of pirates and smugglers that operate across the Southern Sea, and the Topal Bay."
 	SEN_ideas_2 = {
		sailor_maintenance_modifer = -0.15
 	}
	defineloc SEN_ideas_3 = "Tribal City"
	defineloc SEN_ideas_3_desc = "The town districts had its own sections based on social status, including the home of the clan leader."
 	SEN_ideas_3 = {
		stability_cost_modifier = -0.1
		no_stability_loss_on_monarch_death = yes
	}
	defineloc SEN_ideas_4 = "South Guard"
	defineloc SEN_ideas_4_desc = "Former port town near Senchal. Rebuilding it will allow control of Topal Bay trade into Cyrod Heartlands."
 	SEN_ideas_4 = {
		center_of_trade_upgrade_cost = -0.20
	}
	defineloc SEN_ideas_5 = "Shields of Senchal"
	defineloc SEN_ideas_5_desc = "Originally, the Shields of Senchal were known as the Thirteenth Legion that acted under the Empire of Cyrodiil of Emperor Leovic. This Legion was sent by the new Emperor to deal with the constant problems and issues that the region was facing and in order to help with the restoration of order. Despite the good intentions, the Imperials were initially met with hostility and distrust, but the locals eventually grew to respect the Thirteenth Legion, which allowed for their new name of Shields of Senchal to be given to them as they restored the city. At some point, they were not even seen as rulers by some, just enforcers of the laws that the Khajiit wanted them to enforce."
 	SEN_ideas_5 = {
		discipline = 0.075
 	}
	defineloc SEN_ideas_6 = "New Moon Cult"
	defineloc SEN_ideas_6_desc = "Dragon cult resurfacing after dragon appeared in 2E. Eventually, the Shields of Senchal became involved in the defense of the region against the Dragon incursion, as the Dragonguard prepared for the final fight against the new moon cult's dragon-lord, Laatvulon. One of the Shields battles occurred higher in the region, on the highlands near the west sentry tower. The dragon conflict came to an end after an assault on Dragonhold that led to the island's subsequent destruction and the death of the dragon-lord, Kaalgrontiid."
 	SEN_ideas_6 = {
		global_missionary_strength = 0.03
		tolerance_heathen = -1
 	}
	defineloc SEN_ideas_7 = "Elsweyr Confederacy"
	defineloc SEN_ideas_7_desc = "Both Khajiit kingdoms were united by marriage forming Elsweyr Confederacy. Transition wasnt smooth but the unification put a stop to bloody wars."
 	SEN_ideas_7 = {
		diplomats = 1
 	}
}

defineloc bru_ideas = "Bruk'ra Ideas"
defineloc bru_ideas_start = "Bruk'ra Traditions"
defineloc bru_ideas_bonus = "Bruk'ra Ambition"
BRU_ideas = {
 	trigger = {
 		tag = BRU
 	}
 	free = yes
 	start = {
		num_accepted_cultures = 1
		liberty_desire = -10
 	}
 	bonus = {
		trade_company_governing_cost = -0.15
 	}
	defineloc bru_ideas_1 = "Bruk'ra"
	defineloc bru_ideas_1_desc = "The King and His Court come down the road. The Merchant Prince of Bruk'ra. The river-traders sharp and savvy. The traffickers of Bruk'ra."
 	bru_ideas_1 = {
		merchants = 1
 	}
	defineloc bru_ideas_2 = "Bridge Masons"
	defineloc bru_ideas_2_desc = "Bruk'ra guild builds the best bridges in Elsweyr."
 	bru_ideas_2 = {
		build_time = -0.33
 	}
	defineloc bru_ideas_3 = "River Trade"
	defineloc bru_ideas_3_desc = "Brukra merchants control southern trade routes through river-canal network into Topal Bay."
 	bru_ideas_3 = {
		build_time = -0.25
	}
	defineloc bru_ideas_4 = "Traffickers"
	defineloc bru_ideas_4_desc = "Smuggling drugs and illegal ingredients is stable job in Elsweyr as there is no proper merchant control."
 	bru_ideas_4 = {
		privateer_efficiency = 0.25
	}
	defineloc bru_ideas_5 = "Secret Syncretism"
	defineloc bru_ideas_5_desc = "The wander-kings of Bruk'ra had annexed the nearby city of Leyawiin after the conquests of Darloc Brae in the early First Era. It is theorized to have occurred back when the Chapel of Zenithar was originally built, which was underdone by Saint Kaladas. The Antiquarian Circle supports this idea when they came across the stained glass of the Lunar Lattice, which, despite the fact it was made by Khajiiti glassworkers, shares similarities to the Imperial style in Divine temples. It was possibly made for the converted temple, but if it was converted at all, Imperial scholars would outright deny any of this."
 	bru_ideas_5 = {
		tolerance_heretic = 2
		tolerance_heathen = 2
 	}
	defineloc bru_ideas_6 = "Explosive Potions"
	defineloc bru_ideas_6_desc = "Alchemists and engineer guilds created potent explosives with failed potion experiments."
 	bru_ideas_6 = {
		defensiveness = -0.05
		siege_ability = 0.15
 	}
	defineloc bru_ideas_7 = "Merchant Princedom"
	defineloc bru_ideas_7_desc = "Traditionally considered as one of the sixteen kingdoms, but was ruled by council of guild leaders who elected merchant prince to be their ruler."
 	bru_ideas_7 = {
		republican_tradition = 0.75
		legitimacy = 1
		devotion = 1
		horde_unity = 1
		meritocracy = 1
 	}
}
