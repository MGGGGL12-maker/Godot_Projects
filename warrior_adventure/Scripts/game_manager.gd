extends Node

var TotalScore: int = 0
@onready var score_label: Label = $ScoreLabel
@onready var score_label_2: Label = $ScoreLabel2

func Add_Point(score):
	TotalScore += score
	score_label.text = "You collected " + str(TotalScore) + " coins."
	score_label_2.text = "You collected " + str(TotalScore) + " coins."
	
