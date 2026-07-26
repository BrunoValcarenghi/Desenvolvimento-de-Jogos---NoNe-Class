function toca_som(_som = noone, _variacao = 0)
{
    if (!audio_exists(_som)) return;
        
    var _pitch = random_range(1 - _variacao, 1 + _variacao);
    
    audio_play_sound(_som, 0, 0, , , _pitch);
}