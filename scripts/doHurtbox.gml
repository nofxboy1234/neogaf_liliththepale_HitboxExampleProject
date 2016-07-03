/// doHurtbox(x1, y1, x2, y2)
// green
var x1 = argument0;
var y1 = argument1;

with (instance_create(x1, y1, hurtbox)) {
    x1 = argument0;
    y1 = argument1;
    x2 = argument2;
    y2 = argument3;

  daddy = other.id;
  image_xscale = (x2-x1)/32;
  image_yscale = (y2-y1)/32;
  xOffset = x-daddy.x;
  yOffset = y-daddy.y;
  return self.id;
}
