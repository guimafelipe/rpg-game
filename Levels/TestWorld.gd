extends GameScene

onready var cutscene = $Cutscene

func _ready():
	cutscene.execute()
