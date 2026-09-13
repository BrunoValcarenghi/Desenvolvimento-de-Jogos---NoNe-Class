function audio_random(_sfx, _volume = global.volume, _min = .5, _max = 2){
	
	if audio_is_playing(_sfx) audio_stop_sound(_sfx)
	audio_play_sound(_sfx, 10, 0, _volume, 0, random_range(_min, _max))

}