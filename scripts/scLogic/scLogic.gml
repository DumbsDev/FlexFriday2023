function improveFaction(faction, magnitude){
	switch (faction){
		case "water cult":
			global.waterCult += magnitude
			break
			
		case "farmers union":
			global.farmersUnion += magnitude
			break
	
		case "emperors court":
			global.emperorsCourt += magnitude
			break
		
		default:
			print("Invalid faction in improveFaction")
			break
	}
	
}

function reduceFaction(faction, magnitude){
	switch (faction){
		case "water cult":
			waterCult -= magnitude
			break
			
		case "farmers union":
			global.farmersUnion -= magnitude
			break

		case "emperors court":
			global.emperorsCourt -= magnitude
			break
		
		default:
			print("Invalid faction in reduceFaction")
			break
	}
	
}

function dailyWaterChange(){
	if not global.waterCultMax{
		print("Lost Water From People Drinking")
		print("Pre-change Water: " + string(global.water))
		global.water -= global.population / 2 // people drink water
		print("Post-change Water: " + string(global.water))
		print("")
	}
}

function dailyFoodChange(){
	if not global.farmersUnionMax{
		print("Lost Food From People Eating")
		print("Pre-change Food: " + string(global.food))
		global.food -= global.population / 2 // people eat food
		print("Post-change Food: " + string(global.food))
		print("")
	}
}


function dailyPopChange(){
	//food changing population
	if not global.farmersUnionMax{
		if global.food < global.population / 4 { // reduce population when people are starving
			print("Lost Population From Lack Of Food")
			print("Food: " + string(global.food))
			print("Pre-change Population: " + string(global.population))
			global.population -= (global.population - global.food)/3
			print("Post-change Population: " + string(global.population))
		}
	}

	if not global.waterCultMax{
		if global.water < global.population / 2 { // reduce population if there is a lot less water than population
			print("Lost Population From Large Lack of Water")
			print("Water: " + string(global.water))
			print("Pre-change Population: " + string(global.population))
			global.population -= (global.population - global.water) / 3
			print("Post-change Population: " + string(global.population))
			print("")	
		}
	}

	//happiness changing population
	if global.joy > 30 and global.food > global.population and global.water > global.population{ // people get it on
		print("People Have Sex")
		print("Joy: " + string(global.joy))
		print("Food: " + string(global.food))
		print("Water: " + string(global.water))
		print("Houses: " + string(global.houses))
		print("Pre-change Population: " + string(global.population))
		if population <= (global.houses*3 - 5) {
			global.population += 5
		} else {
			global.population = global.houses*3
		}
		print("Post-change Population: " + string(global.population))
	}
	
	//lose condition
	if not global.population > 0 {
		room_goto(rm_lose)
	}
}

function dailyGoldChange(){
	print("Taxes happen")
	print("Population: " + string(global.population))
	print("Tax-Rate: " + string(global.population))
	print("Pre-Change Gold: " + string(global.gold))
	global.gold += global.population * global.taxrate
	print("Post-change Gold: " + string(global.gold))
}

function dailyJoyChange(){
	if not global.farmersUnionMax{
		if global.food > global.population/4{ // reduce joy when people are hungry
			print("Lost Joy From Lack Of Food")
			print("Food: " + string(global.food))
			print("Population: " + string(global.population))
			print("Pre-change Joy: " + string(global.joy))
			global.joy -= 2
			print("Post-change Joy" + string(global.joy))
			print("")
		}
	}

	if global.food > global.population*1.25{ // increase joy if people have a bunch of food
		print("Gained Joy From Surplus of Food")
		print("Food: " + string(global.food))
		print("Population: " + string(global.population))
		print("Pre-change Joy: " + string(global.joy))
		global.joy += (global.food - global.population)/3
		print("Post-change Joy: " + string(global.joy))
		print("")
	}

	//water changing joy
	if not global.waterCultMax{
		if global.water < global.population and global.water > global.population / 2 { // reduce joy when there isn't as much water as the population
			print("Lost Joy Because There Was a Bit Less Water Than Population")
			print("Water: " + string(global.water))
			print("Population: " + string(global.population))
			print("Pre-change Joy: " + string(global.joy))
			global.joy -= 2
			print("Post-change Joy: " + string(global.joy))
			print("")
		} else if global.water < global.population / 2 {
			print("Lost Joy From Large Lack of Water")
			print("Water: " + string(global.water))
			print("Population: " + string(global.population))
			print("Pre-change Joy: " + string(global.joy))
			global.joy -= 3
			print("Post-change Joy: " + string(global.joy))
		}
	}

	if global.water > global.population * 1.5 { // increase joy if there is a ton of water
		print("Gain Joy From Surplus Water")
		print("Water: " + string(global.water))
		print("Population: " + string(global.population))
		print("Pre-change Joy: " + string(global.joy))
		global.joy += (global.water - global.population) / 3
		print("Post-change Joy: " + string(global.joy))
		print("")	
	}
}

function improveStat(stat, magnitude=15){
	switch stat{
		case "food":
			global.food += magnitude * global.foodMulti
			break
		
		case "water":
			global.water += magnitude * global.waterMulti
			break
		
		case "gold":
			global.gold += magnitude
			break

		case "happiness":
			global.joy += magnitude * global.joyMulti
			break
	}
}


function reduceStat(stat, magnitude=15){
	switch stat{
		case "food":
			global.food -= magnitude
			break
		
		case "water":
			global.water -= magnitude
			break
		
		case "gold":
			global.gold -= magnitude
			break
		
		case "happiness":
			global.joy -= magnitude
			break
	}
}

function factionLogic(){
	

	#region faction stuff
		/*
		Water Cult - worships water. Gives a buff to water production.
		Former's Union - Really likes the earth. Gives a buff to food production.
		Emperor's Court - This is where you want to get someday. Gives a buff to happiness. 
		*/
		
		//  --------------------------------MAX BUFFS--------------------------------------
		// Water Cult - No essential need for water. Water still increases stats.
		// Farmer's Union - No essential need for food. Food still increases stats.
		// Emperor's Court - You win.
		
		#region water cult
			if global.waterCult >= 80{
				global.waterCultMax = true
				global.waterMulti = global.waterCult/100 + 2
			} else if global.waterCult >= 60{
				global.waterMulti = global.waterCult/150 + 2
			} else if global.waterCult >= 40{
				global.waterMulti = global.waterCult/150 + 1
			} else if global.waterCult >= 20{
				global.waterMulti = global.waterCult/200 + 1
			} else if global.waterCult < 20{
				global.waterMulti = 1
			}
		#endregion
		
		#region farmers union
			if global.farmersUnion >= 80{
				global.farmersUnionMax = true
				global.foodMulti = global.farmersUnion/100 + 2
			} else if global.farmersUnion >= 60{
				global.foodMulti = global.farmersUnion/150 + 2
			} else if global.farmersUnion >= 40{
				global.foodMulti = global.farmersUnion/150 + 1
			} else if global.farmersUnion >= 20{
				global.foodMulti = global.farmersUnion/200 + 1
			} else if global.farmersUnion < 20{
				global.foodMulti = 1
			}
		#endregion

		#region emperors court
			if global.emperorsCourt >= 80{
				global.emperorsCourtMax = true
				global.joyMulti = global.emperorsCourt/100 + 2
			} else if global.emperorsCourt >= 60{
				global.joyMulti = global.emperorsCourt/150 + 2
			} else if global.emperorsCourt >= 40{
				global.joyMulti = global.emperorsCourt/150 + 1
			} else if global.emperorsCourt >= 20{
				global.joyMulti = global.emperorsCourt/200 + 1
			} else if global.emperorsCourt < 20{
				global.joyMulti = 1
			}
		#endregion
		
	#endregion
}