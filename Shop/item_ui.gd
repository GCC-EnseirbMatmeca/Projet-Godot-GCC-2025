extends Control
class_name ItemUI

var item_name : String
var item_descrpition : String
var item_price : int
# var sprite ?
#var une zone pour détecter que la souris passe dedans

func _gui_input(event):
	if event is mouse_entered():
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			print("I've been clicked D:")



func display_description ():#affiche la description quand on met la souris dessus
	
	if mouse_entered() == 0:#check si la souris est dedans
		print(item_descrpition)

func on_object_area_area_entered(area):
	current_slot = area.get_parent()


func _on_area_2d_mouse_entered() -> void:
	mouse_entered()
	pass # Replace with function body.
