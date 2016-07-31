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

  // Draw oHero properties
  draw_set_color(c_red);
  text_offset = -400
  draw_text(oHero.x, oHero.y+text_offset, "x: " + string(oHero.x));
  draw_text(oHero.x, oHero.y+(1*16)+text_offset, "y: " + string(oHero.y));
  draw_text(oHero.x, oHero.y+(2*16)+text_offset, "dx: " + string(oHero.dx));
  draw_text(oHero.x, oHero.y+(3*16)+text_offset, "dy: " + string(oHero.dy));
  draw_text(oHero.x, oHero.y+(4*16)+text_offset, "dt: " + string(oHero.dt));
  draw_text(oHero.x, oHero.y+(5*16)+text_offset, "grounded: " + string(oHero.grounded));
  draw_text(oHero.x, oHero.y+(6*16)+text_offset, "canJumpCancel: " + string(oHero.canJumpCancel));
  draw_text(oHero.x, oHero.y+(7*16)+text_offset, "code_check: " + string(oHero.code_check));
  draw_text(oHero.x, oHero.y+(8*16)+text_offset, "k.iJump: " + string(k.iJump));
  draw_text(oHero.x, oHero.y+(9*16)+text_offset, "k.iAttack: " + string(k.iAttack));
  draw_text(oHero.x, oHero.y+(10*16)+text_offset, "k.iBlock: " + string(k.iBlock));
  draw_text(oHero.x, oHero.y+(11*16)+text_offset, "k.iLeft: " + string(k.iLeft));
  draw_text(oHero.x, oHero.y+(12*16)+text_offset, "k.iRight: " + string(k.iRight));
  draw_text(oHero.x, oHero.y+(13*16)+text_offset, "maxHP: " + string(oHero.maxHP));
  draw_text(oHero.x, oHero.y+(14*16)+text_offset, "hp: " + string(oHero.hp));


  draw_text(oHero.x, oHero.y+(15*16)+text_offset, "state: " + string(oHero.state));

  draw_text(oHero.x, oHero.y+(16*16)+text_offset, "animation: " + string(oHero.animation));
}


