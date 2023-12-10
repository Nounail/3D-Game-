extends CharacterBody3D

var d = 0
var dialogue = [
	"Save Me"
	,"You have the Zombie Gun Bomb You just need to kill on to win!"
]

func _ready():
	$AnimationPlayer.play("Idle")

func _on_area_3d_body_entered(body):
	$Area3D.queue_free()
	$Dialogue.show()
	$Dialogue/Control/Label.text = dialogue[d]
	d += 1
	$Dialogue/Timer.start()


func _on_timer_timeout():
	if d < dialogue.size():
		$Dialogue/Control/Label.text = dialogue[d]
		d += 1
	else:
		$Dialogue.queue_free()
