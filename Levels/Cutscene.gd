extends Cutscene

func execute():
	start()
	
	var luiz = get_node("../World/Luiz")
	luiz.set_state_cutscene()
	
	var npc =  get_node("../World/NPC")
	
	var tween = $Tween
	var anim = $AnimationPlayer
	tween.interpolate_property(npc, "position:y", npc.position.y, 
			npc.position.y-50, 0.4, Tween.TRANS_CUBIC, Tween.EASE_OUT)
	
	tween.start()
	yield(tween, "tween_completed")
	tween.interpolate_property(npc, "position:y", npc.position.y, 
			npc.position.y+50, 0.4, Tween.TRANS_CUBIC, Tween.EASE_IN)
	tween.start()
	yield(tween, "tween_completed")
	anim.play("LittleNPCJump")
	yield(anim, "animation_finished")

	luiz.set_state_idle()
	finish()
