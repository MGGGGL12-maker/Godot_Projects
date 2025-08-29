extends Node

var TotalScore: int = 0
@onready var score_label: Label = $ScoreLabel

func Add_Point(score):
	TotalScore += score
	score_label.text = "You collected " + str(TotalScore) + " coins."
