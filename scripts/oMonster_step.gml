if (state == NORM)
{
  x += image_xscale*2;
  wait--;

  h_col_rect_front_x1 = x;
  h_col_rect_front_y1 = y-150;
  h_col_rect_front_x2 =  x+image_xscale*50;
  h_col_rect_front_y2 = y-10;

  h_col_rect_front = collision_rectangle(h_col_rect_front_x1, h_col_rect_front_y1,
                                    h_col_rect_front_x2, h_col_rect_front_y2,
                                    c, false, false);

  floor_col_rect_x1 = x+image_xscale*40;
  floor_col_rect_y1 = y;
  floor_col_rect_x2 = x+image_xscale*50;
  floor_col_rect_y2 = y+10;

  floor_col_rect = collision_rectangle(floor_col_rect_x1, floor_col_rect_y1,
                                    floor_col_rect_x2, floor_col_rect_y2,
                                    c, false, false);

  vision_rect_x1 = x;
  vision_rect_y1 = y-92;
  vision_rect_x2 = x+image_xscale*500;
  vision_rect_y2 = y-88;

  vision_rect = collision_rectangle(vision_rect_x1, vision_rect_y1,
                                    vision_rect_x2, vision_rect_y2,
                                    oHero.myHurtbox, false, false);

  obstacle_rect_x1 = x;
  obstacle_rect_y1 = y-92;
  obstacle_rect_x2 = oHero.x;
  obstacle_rect_y2 = y-88;

  obstacle_rect = collision_rectangle(obstacle_rect_x1, obstacle_rect_y1,
                                    obstacle_rect_x2, obstacle_rect_y2,
                                    c, false, false);

  h_col_rect_back_x1 = x;
  h_col_rect_back_y1 = y-150;
  h_col_rect_back_x2 = x-image_xscale*50;
  h_col_rect_back_y2 = y-10;

  h_col_rect_back = collision_rectangle(h_col_rect_back_x1, h_col_rect_back_y1,
                                    h_col_rect_back_x2, h_col_rect_back_y2,
                                    c, false, false);

  // if horiz collision OR (wait is less than 0 AND at the edge of a platform AND direction == image_xscale)
  if (h_col_rect_front || (wait < 0 && !floor_col_rect && sign(x-xstart) == image_xscale))
  {
    // flip direction horizontally
    image_xscale *= -1;
  }
  // if wait less than 0 AND can see oHero AND eyeline isn't blocked by a collidable
  else if (wait < 0 && vision_rect && !obstacle_rect)
  // else if (vision_rect && !obstacle_rect)
  {
    state = ATTACK;
    ani("shoot");
  }
}
else if (state == STUN)
{
  // knock back in x slightly
  x -= image_xscale*10/(1+image_index);
  // if back half collision box is hitting a collidable object
  if (h_col_rect_back)
  {
    // goto x pos on previous frame
    x = xprevious;
  }
}
else if (state == ATTACK)
{
  if (image_index == 48)
  {
    with (instance_create(x+image_xscale*32, y-90, oFireball))
    {
      daddy = other.id;
      with (myHitbox)
      {
        sugardaddy = other.daddy;
      }
      // Shoot fireball in the direction oMonster is facing at 10 pixels/frame
      dx = other.image_xscale*10;
    }
  }
}

updateBox(myHitbox);
updateBox(myHurtbox);
