extends AudioStreamPlayer

@export var fade_duration: float = 1.00
@export var transition_type: int = 1 # TRANS_SINE
@export var music_volume: int = -5

var audioplayer: AudioStreamPlayer = self

func play_withfadein(bgm: String):
	audioplayer.stream = load(bgm)
	fadein()
	play()

func fadein():
	var tween_in: Tween = create_tween()
	tween_in.tween_property(audioplayer, "volume_db", music_volume, fade_duration)
	Tween.interpolate_value(-80, 0, 0, fade_duration, Tween.TRANS_LINEAR, Tween.EASE_IN)


func _play(bgm: String):
	play_withfadein(bgm)
