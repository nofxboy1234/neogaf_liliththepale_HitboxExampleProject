dy += ddy;
x += dx;
y += dy;

image_angle = point_direction(0, 0, dx, dy);
updateBox(myHitbox);
