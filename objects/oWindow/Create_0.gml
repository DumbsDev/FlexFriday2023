if oPlayer.day = 0 {
dailyQuestions = 0;
querycodemax = -1
querycode = -5
dailyQuestionsMax = 4
} else {
dailyQuestions = 0;
querycodemax = 3
querycode = (irandom_range(1,querycodemax));
dailyQuestionsMax = 3
}
text_id = querycode
randomize();
