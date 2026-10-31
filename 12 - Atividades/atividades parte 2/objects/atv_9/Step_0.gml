x += vel_x;

vel_x -= 0.1;

if (x > room_width + 32)
{
	x = -32;
}

if (vel_x < 0) vel_x = 0;