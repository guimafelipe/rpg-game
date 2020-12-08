extends Cutscene

func execute():
	var luiz = get_node("../World/Luiz")
	var npc =  get_node("../World/NPC")
	luiz.set_state_cutscene()
	
