/// hitbox interupted

// bounce splats away from wall or shield etc
with (instance_create(x, y, oSplat))
{
  dx = -other.dx;
  dy = -other.dy;
}

// bounce away from wall or shield etc.
x -= dx;
// if it hits a collidable, destroy fireball
if (collision_rectangle(x-5, y-5, x+5, y+5, c, true, true))
{
  instance_destroy();
}
else
{
  // slow down fireball x movement in the opposite direction
  dx *= -0.8;
  // bounce up slightly to create a curved fall path
  dy -= 6;
  // increase the fall speed every frame (gravity). Counteracts initial
  // -6 upward movement over each frame to cause curved fall path.
  ddy = 0.5;
  myHitbox.sugardaddy = noone;
}
