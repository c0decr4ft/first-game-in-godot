extends Camera2D

# World area kept on screen, so the knight stays a similar size in any window.
const VISIBLE_SIZE = Vector2(230.4, 129.6)

func _ready():
	_fit_zoom()
	get_viewport().size_changed.connect(_fit_zoom)

func _fit_zoom():
	var view = get_viewport_rect().size
	if view.x <= 0 or view.y <= 0:
		return
	var fit = view / VISIBLE_SIZE
	var amount = min(fit.x, fit.y)
	zoom = Vector2(amount, amount)
