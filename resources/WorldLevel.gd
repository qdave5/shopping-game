extends Resource
class_name WorldLevel

export var level : int = 1

func nextLevel():
	level += 1

func resetLevel():
	level = 1
