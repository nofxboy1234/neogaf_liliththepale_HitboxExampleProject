/// hitbox interupted

with (instance_create(x, y, oSplat)) {
  dx = -other.dx;
  dy = -other.dy;
}
x -= dx;
if (collision_rectangle(x-5, y-5, x+5, y+5, c, true, true)) {
  instance_destroy();
} else {
  dx *= -0.8;
  dy -= 6;
  ddy = 0.5;
  myHitbox.sugardaddy = noone;
}
