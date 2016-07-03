/// doBlockbox(x1, y1, x2, y2)
// blue

var x1 = argument0;
var y1 = argument1;

with (instance_create(x1, y1, blockbox)) {
  x1 = argument0;
  y1 = argument1;
  x2 = argument2;
  y2 = argument3;
  // other is the object where this "with" block is being called from. e.g. oHero
  daddy = other.id;
  image_xscale = (x2-x1)/32;
  image_yscale = (y2-y1)/32;

  // Get offset relative to parent
  // e.g. daddy.x = 20 and blockbox.x = 10, xOffset = -10 - keep the blockbox
  // 10 pixels to the left of daddy every frame.
  xOffset = x-daddy.x;
  yOffset = y-daddy.y;
  return self.id;
}
