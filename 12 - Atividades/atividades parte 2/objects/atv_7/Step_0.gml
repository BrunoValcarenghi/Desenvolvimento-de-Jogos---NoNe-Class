x += vel_x;
y += vel_y;

if (x > room_width + 32)
{
	x = room_width / 2;
	y = room_height / 2;
	vel_x = 0;
	
	alarm[0] = room_speed * 2;
}
if (y > room_height + 32)
{
	x = room_width / 2;
	y = room_height / 2;
	vel_y = 0;
	
	alarm[1] = room_speed * 2;
}

