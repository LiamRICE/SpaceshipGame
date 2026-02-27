extends Control

### CONSTANTS ###
const main_page = "main"
const PAGES = {
	"main":preload("uid://ba0deecnjanuy"),
	"settings":preload("uid://blnn06ffjcto"),
}


### TRACKING VARIABLES ###
var current_page = main_page
var displayed_pages = []


### INITIALISING METHODS ###
func _ready() -> void:
	# display the main page
	for key in PAGES.keys():
		if key == main_page:
			PAGES.get(key).visible = true
		else:
			PAGES.get(key).visible = false


### NAVIGATION METHODS ###
func navigate_to(page:String):
	# Check input for invalid pages
	if page not in PAGES.keys():
		page = "main"
	# Disable current page
	PAGES.get(current_page).visible = false
	# Activate new page
	PAGES.get(page).visible = true


func display_page(page:String) -> bool:
	if page in PAGES.keys():
		PAGES.get(page).visible = true
		displayed_pages.append(page)
		return true
	else:
		return false


func hide_page(page:String) -> bool:
	if page in PAGES.keys() and page in displayed_pages:
		displayed_pages.erase(page)
		PAGES.get(page).visible = false
		return true
	else:
		return false
