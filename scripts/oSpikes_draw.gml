// draw_self();

// Draw the sprite repeated in x-axis as opposed to scaling it in x.
var i;
for (i = 0; i < image_xscale; i++;) {
  draw_sprite(sSpikes, 0, x+64*i, y);
}
