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
  // orange
  draw_set_color(c_orange);
  // This rect is always drawn.
  with(oHero)
  {
    draw_set_alpha(0.2);
    draw_rectangle(h_col_rect_x1, h_col_rect_y1, h_col_rect_x2, h_col_rect_y2, false);
    draw_set_alpha(1.0);
    draw_rectangle(h_col_rect_x1, h_col_rect_y1, h_col_rect_x2, h_col_rect_y2, true);
  }

  // This rect is ONLY drawn when a collision happens, and will be the colliding object.
  // Otherwise hc_object doesn't exsit until a collision occurs.
  with (oHero.hc_object) {
    draw_set_alpha(0.2);
    draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, false);
    draw_set_alpha(1);
    draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true);
  }

  if (instance_exists(oMonster))
  {
    with(oMonster)
    {
      draw_set_color(c_yellow);
      draw_set_alpha(0.2);
      draw_rectangle(h_col_rect_front_x1, h_col_rect_front_y1, h_col_rect_front_x2, h_col_rect_front_y2, false);
      draw_set_alpha(1.0);
      draw_rectangle(h_col_rect_front_x1, h_col_rect_front_y1, h_col_rect_front_x2, h_col_rect_front_y2, true);

      draw_set_color(c_teal);
      draw_set_alpha(0.2);
      draw_rectangle(floor_col_rect_x1, floor_col_rect_y1, floor_col_rect_x2, floor_col_rect_y2, false);
      draw_set_alpha(1.0);
      draw_rectangle(floor_col_rect_x1, floor_col_rect_y1, floor_col_rect_x2, floor_col_rect_y2, true);

      draw_set_color(c_lime);
      draw_set_alpha(0.2);
      draw_rectangle(vision_rect_x1, vision_rect_y1, vision_rect_x2, vision_rect_y2, false);
      draw_set_alpha(1.0);
      draw_rectangle(vision_rect_x1, vision_rect_y1, vision_rect_x2, vision_rect_y2, true);

      // draw_set_color(c_maroon);
      // draw_set_alpha(0.2);
      // draw_rectangle(obstacle_rect_x1, obstacle_rect_y1, obstacle_rect_x2, obstacle_rect_y2, false);
      // draw_set_alpha(1.0);
      // draw_rectangle(obstacle_rect_x1, obstacle_rect_y1, obstacle_rect_x2, obstacle_rect_y2, true);

      draw_set_color(c_fuchsia);
      draw_set_alpha(0.2);
      draw_rectangle(h_col_rect_back_x1, h_col_rect_back_y1, h_col_rect_back_x2, h_col_rect_back_y2, false);
      draw_set_alpha(1.0);
      draw_rectangle(h_col_rect_back_x1, h_col_rect_back_y1, h_col_rect_back_x2, h_col_rect_back_y2, true);

      with (h_col_rect_front)
      {
        draw_set_color(c_yellow);
        draw_set_alpha(0.2);
        draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, false);
        draw_set_alpha(1);
        draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true);
      }

      with (floor_col_rect)
      {
        draw_set_color(c_teal);
        draw_set_alpha(0.2);
        draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, false);
        draw_set_alpha(1);
        draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true);
      }
      with (vision_rect)
      {
        draw_set_color(c_lime);
        draw_set_alpha(0.2);
        draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, false);
        draw_set_alpha(1);
        draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true);
      }
      // with (obstacle_rect)
      // {
      //   draw_set_color(c_maroon);
      //   draw_set_alpha(0.2);
      //   draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, false);
      //   draw_set_alpha(1);
      //   draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true);
      // }
      with (h_col_rect_back)
      {
        draw_set_color(c_fuchsia);
        draw_set_alpha(0.2);
        draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, false);
        draw_set_alpha(1);
        draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true);
      }
    }
  }

  // red
  draw_set_color(c_red);
  with(oHero)
  {
    draw_set_alpha(0.2);
    draw_rectangle(vt_col_rect_x1, vt_col_rect_y1, vt_col_rect_x2, vt_col_rect_y2, false);
    draw_set_alpha(1.0);
    draw_rectangle(vt_col_rect_x1, vt_col_rect_y1, vt_col_rect_x2, vt_col_rect_y2, true);

    draw_set_alpha(0.2);
    draw_rectangle(vb_col_rect_x1, vb_col_rect_y1, vb_col_rect_x2, vb_col_rect_y2, false);
    draw_set_alpha(1.0);
    draw_rectangle(vb_col_rect_x1, vb_col_rect_y1, vb_col_rect_x2, vb_col_rect_y2, true);
  }

  with (oHero.vc_top_object)
  {
    draw_set_alpha(0.2);
    draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, false);
    draw_set_alpha(1);
    draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true);
  }
  with (oHero.vc_bot_object)
  {
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
  // draw_text(oHero.x, oHero.y+(7*16)+text_offset, "code_check: " + string(oHero.code_check));
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

  // Draw oMonster properties
  text_offset = 0;
  if (instance_exists(oMonster))
  {
    draw_text(oMonster.x, oMonster.y+text_offset, "state: " + string(oMonster.state));
  }

  // Draw oFireball properties
  text_offset = 0;
  if (instance_exists(oFireball))
  {
    draw_text(oFireball.x, oFireball.y+text_offset, "dx: " + string(oFireball.dx));
    draw_text(oFireball.x, oFireball.y+(1*16)+text_offset, "dy: " + string(oFireball.dy));
    draw_text(oFireball.x, oFireball.y+(2*16)+text_offset, "ddy: " + string(oFireball.ddy));
  }
}


