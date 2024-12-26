extends Node


enum POINTS{
	UP=1,
	DOWN=-1
}

var player_score = 0
var player_life = 3
func update_score(number: POINTS):
	player_score+=number

func update_credits(number: POINTS):
	player_life+=number

func update(updater, number: POINTS):
	call(updater,number)

func reset():
	player_life=3
	player_score=0
