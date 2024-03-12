extends Resource
class_name Colors

const COLORS = {
	'WHITE': 'white',
	'RED': 'red',
	'YELLOW': 'yellow',
	'BLUE': 'blue',
	'ORANGE': 'orange',
	'GREEN': 'green',
	'PURPLE': 'purple',
	'BROWN': 'brown',
}

func combineColor(oldColor, newColor):
	print(oldColor, newColor)
	if oldColor == COLORS.WHITE:
		return newColor
	if oldColor == COLORS.RED:
		if newColor == COLORS.BLUE:
			return COLORS.PURPLE
		elif newColor == COLORS.YELLOW:
			return COLORS.ORANGE
	if oldColor == COLORS.BLUE:
		if newColor == COLORS.RED:
			return COLORS.PURPLE
		elif newColor == COLORS.YELLOW:
			return COLORS.ORANGE
	if oldColor == COLORS.YELLOW:
		if newColor == COLORS.RED:
			return COLORS.ORANGE
		elif newColor == COLORS.BLUE:
			return COLORS.GREEN
	if oldColor == COLORS.ORANGE:
		if newColor == COLORS.BLUE:
			return COLORS.BROWN
	if oldColor == COLORS.GREEN:
		if newColor == COLORS.RED:
			return COLORS.BROWN
	if oldColor == COLORS.PURPLE:
		if newColor == COLORS.YELLOW:
			return COLORS.BROWN
	return oldColor
