/// doHurtbox(x1, y1, x2, y2)
// green
with (instance_create(argument0, argument1, hurtbox)) {
  daddy = other.id;
  image_xscale = (argument2-argument0)/32;
  image_yscale = (argument3-argument1)/32;
  xOffset = x-daddy.x;
  yOffset = y-daddy.y;
  return self.id;
}
