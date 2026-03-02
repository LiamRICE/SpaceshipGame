extends CanvasLayer

func set_label(id:int, role:String):
	$RichTextLabel.text = "Player Role : " + str(id) + " \nPlayer ID : " + role
