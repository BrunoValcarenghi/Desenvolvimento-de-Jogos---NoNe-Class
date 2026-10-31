x += vel_x;
y += vel_y;


if (x > room_width + 32)
{
	x = -32;
}

if (y > room_height + 32)
{
	y = -32;
}