day = global.day
#region tutorial and daily management
if day = 0 {
	dailyQuestions = 0;
	querycodemax = -1
	querycode = -5
	dailyQuestionsMax = 4
} else {
	dailyQuestions = 0;
	querycodemax = 3
	querycode = (irandom_range(1,querycodemax));
	dailyQuestionsMax = 10
}
text_id = querycode
randomize();
#endregion
#region question variables
huntingInOurTerritory = false
oneIsOffTheHuntersLand = 0
#endregion