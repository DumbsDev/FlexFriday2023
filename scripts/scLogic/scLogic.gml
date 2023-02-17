function improveFaction(faction, magnitude){
	switch (faction){
		case "water cult":
			waterCult += magnitude
			break
			
		case "farmers union":
			resistance += magnitude
			break
			
		case "bandits":
			roundEarthers += magnitude
			break
		
		case "emperors court":
			roundEarthers += magnitude
			break
		
		default:
			print("Invalid Faction")
			break
	}
	
}

function reduceFaction(faction, magnitude){
	switch (faction){
		case "water cult":
			waterCult -= magnitude
			break
			
		case "farmers union":
			resistance -= magnitude
			break
			
		case "bandits":
			roundEarthers -= magnitude
			break
		
		case "emperors court":
			roundEarthers -= magnitude
			break
		
		default:
			print("Invalid Faction")
			break
	}
	
}

function dailyWaterChange(){
	print("People Drink Water")
	print("Population: " + string(global.population))
	print("Pre-change Water: " + string(global.water))
	global.water -= global.population / 2 // people drink water
	print("Post-change Water: " + string(global.water))
	print("")
}

function dailyFoodChange(){
	dayMulti = global.day / 10 + 1

	print("Lost Food From People Eating")
	print("Pre-change Food: " + string(global.food))
	global.food -= global.population / 2 // people eat food
	print("Post-change Food: " + string(global.food))
	print("")
}

function dailyPopChange(){
	dayMulti = global.day / 10 + 1

	//food changing population
	if global.food < global.population / 4 { // reduce population when people are starving
		print("Lost Population From Lack Of Food")
		print("Food: " + string(global.food))
		print("Pre-change Population: " + string(global.population))
		global.population -= (global.population - global.food)/3 * dayMulti
		print("Post-change Population: " + string(global.population))
	}
		
	if global.water < global.population / 2 { // reduce population if there is a lot less water than population
		print("Lost Population From Large Lack of Water")
		print("Water: " + string(global.water))
		print("Pre-change Population: " + string(global.population))
		global.population -= (global.population - global.water) / 3 * dayMulti
		print("Post-change Population: " + string(global.population))
		print("")
		
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
}

function dailyGoldChange(){
	print("Taxes happen")
	print("Population: " + string(global.population))
	print("Tax-Rate: " + string(global.population))
	print("Pre-Change Gold: " + string(global.gold))
	global.gold += global.population * global.taxrate
}

function dailyJoyChange(){
	dayMulti = global.day / 10 + 1

	if global.food > global.population/4{ // reduce joy when people are hungry
		print("Lost Joy From Lack Of Food")
		print("Food: " + string(global.food))
		print("Population: " + string(global.population))
		print("Pre-change Joy: " + string(global.joy))
		global.joy -= 2 * dayMulti
		print("Post-change Joy" + string(global.joy))
		print("")
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
	if global.water < global.population and global.water > global.population / 2 { // reduce joy when there isn't as much water as the population
		print("Lost Joy Because There Was a Bit Less Water Than Population")
		print("Water: " + string(global.water))
		print("Population: " + string(global.population))
		print("Pre-change Joy: " + string(global.joy))
		global.joy -= 2 * dayMulti
		print("Post-change Joy: " + string(global.joy))
		print("")
	} else if global.water < global.population / 2 {
		print("Lost Joy From Large Lack of Water")
		print("Water: " + string(global.water))
		print("Population: " + string(global.population))
		print("Pre-change Joy: " + string(global.joy))
		global.joy -= 3 * dayMulti
		print("Post-change Joy: " + string(global.joy))
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

function improveStat(stat, magnitude){
	switch stat{
		case "food":
			global.food += magnitude
			break
		
		case "water":
			global.water += magnitude
			break
		
		case "money":
			global.gold += magnitude
			break

		case "happiness":
			global.joy += magnitude
			break
	}
}


function reduceStat(stat, magnitude){
	switch stat{
		case "food":
			global.food -= magnitude
			break
		
		case "water":
			global.water -= magnitude
			break
		
		case "money":
			global.gold -= magnitude
			break
		
		case "happiness":
			global.joy -= magnitude
			break
	}
}

//function factionLogic(){
	

	#region faction shit
		/*
		Water Cult - worships water. Gives a buff to water production and small buffs to happiness. Hard to keep high standing because they hate wasting water on growing food.
		Resistence - doesn't like water. Instead really likes the earth. Debuffs water a tiny bit and buffs population a ton. Loses you Water Cult rep and if they get too happy they go away.
		Round Earthers - Think the Earth is round. Such idiots. People like deconstructing their stupid arguments. Humouring them will keep them argueing. 
		*/
		
		//  --------------------------------MAX BUFFS--------------------------------------
		// Water Cult - No essential need for water. Still boosts happiness
		// Resistance - No essential need for food. Still boosts population.
		// Round Earthers - Increase population by 2 always
		
		#region water cult
			//ALL NUMBERS ARE UP FOR DEBATE
			//if global.waterCult >= 80{
/* 				//Big gameplay changes which affect all aspects of the game. Deffine endgame.
				global.waterCultMax = true
				global.waterMulti = global.waterCult/300 + 2
				global.foodMulti = 1 - global.waterCult/400
			} else if global.waterCult >= 60{
				//Big benefit, changes other factions, and reduces other supplies. Just another teir of the previous.
				global.waterMulti = global.waterCult/300 + 2
				global.foodMulti = 1 - global.waterCult/400
			} else if global.waterCult >= 40{
				//Normal benefits and changes other factions. The begaining of deeper stratagies.
				global.waterMulti = global.waterCult/300 + 1
			} else if global.waterCult >= 20{
				//Small benefits and no chnages to other factions. A straight upgrade.
				global.waterMulti = global.waterCult/400 + 1
			} */
		#endregion
		/*
		#region resistence
			switch resistance{
				case resistance >= 20 and waterCult < 40:
					//Small benefits and no changes to other factions. A straight upgrade.
					foodMulti  = resistance/400 + 1
			}
		#endregion
		*/
	#endregion
//}