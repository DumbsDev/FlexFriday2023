// @description We do a bit of logic
dayMulti = day/10 + 1

#region changing population
	//food changing population
	if food < population and food > population/4{ // reduce joy when people are hungry
		joy -= 5 * dayMulti
	} else if food < population/4{ // reduce population and joy when people are starving
		population -= (population - food)/3 * dayMulti
		joy -= 10 * dayMulti
	} else if food > population*1.25{
		joy += (food - population)/3
	}

	food -= population / 20 // people eat food



	//water changing population
	if water < population and water > population/2{ // reduce joy when there isn't as much water as the population
		joy -= 5 * dayMulti
	} else if water < population/2{ // reduce population and joy if there is a lot less water than population
		population -= (population - water)/3 * dayMulti
		joy -= 10 * dayMulti
	} else if water > population*1.5{ // increase joy if there is a ton of water
		joy += (water - population)/3
	}

	water -= population / 20 // people drink water



	//happiness changing population
	if joy > 125 and food > population and water > population and population < houses{ // people get it on
		population += 5
	}
#endregion

#region faction shit
	/*
	Water Cult - worships water. Gives a buff to water production and small buffs to happiness. Hard to keep high standing because they hate wasting water on growing food.
	Resistence - doesn't like water. Instead really likes the earth. Debuffs water a tiny bit and buffs population a ton. Loses you Water Cult rep and if they get too happy they go away.
	Round Earthers - Think the Earth is round. Such idiots. People like deconstructing their stupid arguments. Humouring them will keep them argueing. 
	*/
	
	#region water cult
		switch waterCult{ //ALL NUMBERS ARE UP FOR DEBATE
			case waterCult >= 20 and waterCult < 40:
				//Small benefits and no chnages to other factions. A straight upgrade.
				waterMulti = waterCult/400 + 1
				break
			case waterCult >= 40 and waterCult < 60:
				//Normal benefits and changes other factions. The begaining of deeper stratagies.
				waterMulti = waterCult/300 + 1
				resistance -= 1*(waterCult/50) + 1
				break
			case waterCult >= 60:
				//Big benefit, changes other factions, and reduces other supplies. Just another teir of the previous.
				waterMulti = waterCult/300 + 2
				foodMulti = 1 - waterCult/400
				resistance -= 1*(waterCult/50) + 1
				break
			case waterCult >= 80:
				//Big gameplay changes which affect all aspects of the game. Deffine endgame.
				waterCultMax = true
				break
			case Default:
				if waterCult >= 20{
					print("Default on line 66 oGameLogic Step")
				}
				break
			}
	#endregion
	
	#region resistence
		switch resistance{
			case resistance >= 20 and waterCult < 40:
				//Small benefits and no changes to other factions. A straight upgrade.
				foodMulti  = resistance/400 + 1
		}
	#endregion
#endregion