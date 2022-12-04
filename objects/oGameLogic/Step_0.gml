// @description We do a bit of logic
dayMulti = day/10 + 1

if food < population and food > population/4{ // reduce joy when people are hungry
	joy -= 5 * dayMulti
} else if food < population/4{ // reduce population and joy when people are starving
	population -= (population - food)/3 * dayMulti
	joy -= 10 * dayMulti
} else if food > population*1.25{
	joy += (food - population)/3
}

food -= population / 20 // people eat food


if water < population and water > population/2{ // reduce joy when there isn't as much water as the population
	joy -= 5 * dayMulti
} else if water < population/2{ // reduce population and joy if there is a lot less water than population
	population -= (population - water)/3 * dayMulti
	joy -= 10 * dayMulti
} else if water > population*1.5{ // increase joy if there is a ton of water
	joy += (water - population)/3
}

water -= population / 20 // people drink water


if joy > 125 and food > population and water > population and population < houses{ // people get it on
	population += 5
}
