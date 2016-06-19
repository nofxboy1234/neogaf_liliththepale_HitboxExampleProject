/// doBlockbox(x1, y1, x2, y2)
// blue
with (instance_create(argument0, argument1, blockbox)) {
  // other is the object where this "with" block is being called from. e.g. oHero
  daddy = other.id;
  image_xscale = (argument2-argument0)/32;
  image_yscale = (argument3-argument1)/32;

  // Get offset relative to parent
  // e.g. daddy.x = 20 and blockbox.x = 10, xOffset = -10 - keep the blockbox
  // 10 pixels to the left of daddy every frame.
  xOffset = x-daddy.x;
  yOffset = y-daddy.y;
  return self.id;
}
