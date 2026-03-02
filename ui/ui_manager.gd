extends Control

### CONSTANTS ###
const main_page = "ui_main"
const PAGES = {
	"ui_main":preload("uid://ba0deecnjanuy"),
	"ui_settings":preload("uid://blnn06ffjcto"),
	"ui_game":preload("uid://dfipjuoj75e7h"),
	"ui_join_game":preload("uid://dxoobnjav8cdp"),
	"ui_host_game":preload("uid://0j2wfl2u10xh"),
	"scene_game":preload("uid://cef27of5xjuj8"),
}


### TRACKING VARIABLES ###
var current_page = main_page
var instantiated_pages = {}
var displayed_pages = []


### INITIALISING METHODS ###
func _ready() -> void:
	# attach the pages to the UI Manager
	for page:String in PAGES.keys():
		if page.begins_with("ui"):
			print("Initialising ", page)
			var instantiated_page = PAGES.get(page).instantiate()
			add_child(instantiated_page)
			instantiated_pages.get_or_add(page, instantiated_page)
	# display the main page
	for key in instantiated_pages.keys():
		if key == main_page:
			instantiated_pages.get(key).visible = true
		else:
			instantiated_pages.get(key).visible = false


### NAVIGATION METHODS ###
func navigate_to(page:String):
	print("Navigating from ", current_page, " to ", page)
	# Check input for invalid pages
	if page not in instantiated_pages.keys():
		page = "ui_main"
	# Disable current page
	instantiated_pages.get(current_page).visible = false
	# Activate new page
	instantiated_pages.get(page).visible = true
	current_page = page


func hide_ui():
	# Check input for invalid pages
	for page in instantiated_pages.keys():
		instantiated_pages.get(page).visible = false
	current_page = null
	


func load_scene(scene:String) -> bool:
	if scene in PAGES.keys():
		print("Loading ", scene)
		get_tree().change_scene_to_packed(PAGES.get(scene))
		return true
	else:
		return false


func display_page(page:String) -> bool:
	if page in PAGES.keys():
		instantiated_pages.get(page).visible = true
		displayed_pages.append(page)
		return true
	else:
		return false


func hide_page(page:String) -> bool:
	if page in instantiated_pages.keys() and page in displayed_pages:
		displayed_pages.erase(page)
		instantiated_pages.get(page).visible = false
		return true
	else:
		return false


func get_packed_scene(scene_name:String) -> PackedScene:
	if scene_name in PAGES.keys():
		return PAGES.get(scene_name)
	else:
		return null


func _debug_set_game_ui_statistics(id:int, role:String):
	instantiated_pages.get("ui_game").set_label(id, role)
