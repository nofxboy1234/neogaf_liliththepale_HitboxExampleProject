if (state == NORM)
{
  x += image_xscale*2;
  wait--;

  c_object_01_x1 = x;
  c_object_01_y1 = y-150;
  c_object_01_x2 =  x+image_xscale*50;
  c_object_01_y2 = y-10;

  c_object_01 = collision_rectangle(c_object_01_x1, c_object_01_y1,
                                    c_object_01_x2, c_object_01_y2,
                                    c, false, false);

  c_object_02_x1 = x+image_xscale*40;
  c_object_02_y1 = y;
  c_object_02_x2 = x+image_xscale*50;
  c_object_02_y2 = y+10;

  c_object_02 = collision_rectangle(c_object_02_x1, c_object_02_y1,
                                    c_object_02_x2, c_object_02_y2,
                                    c, false, false);

  c_object_03_x1 = x;
  c_object_03_y1 = y-92;
  c_object_03_x2 = x+image_xscale*500;
  c_object_03_y2 = y-88;

  c_object_03 = collision_rectangle(c_object_03_x1, c_object_03_y1,
                                    c_object_03_x2, c_object_03_y2,
                                    oHero.myHurtbox, false, false);

  c_object_04_x1 = x;
  c_object_04_y1 = y-92;
  c_object_04_x2 = oHero.x;
  c_object_04_y2 = y-88;

  c_object_04 = collision_rectangle(c_object_04_x1, c_object_04_y1,
                                    c_object_04_x2, c_object_04_y2,
                                    c, false, false);

  c_object_05_x1 = x;
  c_object_05_y1 = y-150;
  c_object_05_x2 = x-image_xscale*50;
  c_object_05_y2 = y-10;

  c_object_05 = collision_rectangle(c_object_05_x1, c_object_05_y1,
                                    c_object_05_x2, c_object_05_y2,
                                    c, false, false);

  // if horiz collision OR (wait is less than 0 AND at the edge of a platform AND direction == image_xscale)
  if (c_object_01 || (wait < 0 && !c_object_02 && sign(x-xstart) == image_xscale))
  {
    // flip direction horizontally
    image_xscale *= -1;
  }
  // if wait less than 0 AND can see oHero AND eyeline isn't blocked by a collidable
  else if (wait < 0 && c_object_03 && !c_object_04)
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
  if (c_object_05)
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
