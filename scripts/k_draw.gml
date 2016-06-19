/// draw debug data
if (debug) {
  // blue
  draw_set_color($FF5F00);
  with (blockbox) {
    draw_set_alpha(0.2);
    draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, false);
    draw_set_alpha(1);
    draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true);
  }
  // green
  draw_set_color($00FF3F);
  with (hurtbox) {
    draw_set_alpha(0.2);
    draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, false);
    draw_set_alpha(1);
    draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true);
  }
  // purple
  draw_set_color($FF007F);
  with (hitbox) {
    draw_set_alpha(0.2);
    draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, false);
    draw_set_alpha(1);
    draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true);
  }
}


