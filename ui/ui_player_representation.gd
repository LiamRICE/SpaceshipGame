extends HBoxContainer

func set_values(player_name:String, player_id:int):
	%PlayerNameLabel.text = player_name
	%PlayerIDLabel.text = str(player_id)


func get_id() -> int:
	var id = %PlayerIDLabel.text
	return int(id)
