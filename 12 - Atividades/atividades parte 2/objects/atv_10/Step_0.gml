x += vel_x;
y += vel_y;


if (y > room_height - 32 or y < 32)
{
	vel_y  = -vel_y;
	if (vel_y > 0)
	{
		vel_y += 1;
	}
	else
	{
		vel_y -= 1;
	}
}
else if (x > room_width - 32 or x < 32)
{
	vel_x = -vel_x;
	if (vel_x > 0)
	{
		vel_x += 1;
	}
	else
	{
		vel_x -= 1;
	}
}

if (vel_x > 20)
{
	vel_x = 20;
}
else if (vel_x < -20)
{
	vel_x = -20;
}
if (vel_y > 20)
{
	vel_y = 20;
}
else if (vel_y < -20)
{
	vel_y = -20;
}