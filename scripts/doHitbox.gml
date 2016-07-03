/// doHitbox(x1, y1, x2, y2, duration, damage)
// purple

var x1 = argument0;
var y1 = argument1;

with (instance_create(x1, y1, hitbox)) {
  x1 = argument0;
  y1 = argument1;
  x2 = argument2;
  y2 = argument3;
  duration = argument4;
  damage = argument5;

  daddy = other.id;
  sugardaddy = noone;
  image_xscale = (x2-x1)/32;
  image_yscale = (y2-y1)/32;
  if (duration > 0) {
    dieTime = k.time+duration;
  } else {
    dieTime = 0;
  }
  xOffset = x-daddy.x;
  yOffset = y-daddy.y;


  return self.id;
}
