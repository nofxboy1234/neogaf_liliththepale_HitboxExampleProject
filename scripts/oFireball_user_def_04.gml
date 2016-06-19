/// hitbox hit something

with (instance_create(x, y, oSplat)) {
  dx = -other.dx;
  dy = -other.dy;
}
instance_destroy();
