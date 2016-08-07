/// move camera
var _x, _y;

if (oHero.state != DEAD) {
  _x = oHero.x+oHero.image_xscale*100+oHero.dx*2-(view_wview/2); //40
  _y = oHero.y+oHero.dy*4-(view_hview/2+64);
  camX = clamp(_x, 0, room_width-view_wview);
  camY = clamp(_y, 0, room_height-view_hview);
}

camTrueX = (camX+view_xview*3)/4;
camTrueY = (camY+view_yview*3)/4;
view_xview = round(camTrueX);
view_yview = floor(camTrueY);

// the below caused oHero to jump through walls sometimes...
// instance_deactivate_all(true);
// instance_activate_region(view_xview-100, view_yview-100, view_wview+200, view_hview+200, true);
// instance_activate_object(oHero);
