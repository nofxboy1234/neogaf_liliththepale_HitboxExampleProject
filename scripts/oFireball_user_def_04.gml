/// hitbox hit some hurtbox

// bounce splats in the opposite direction
with (instance_create(x, y, oSplat)) {
  dx = -other.dx;
  dy = -other.dy;
}
// destroy fireball
instance_destroy();
