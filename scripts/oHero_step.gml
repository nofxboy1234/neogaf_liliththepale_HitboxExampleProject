/// NORMAL state
if (state == NORM)
{ //-
  // handle left and right inputs
  // If left has been held down for at least 1 frame
  if (k.iLeft == 1)
  {
    dt = LEFT;
    image_xscale = LEFT;
    // If on the ground
    if (grounded > 0)
    {
      // Use run animation
      ani("run");
    }
  }
  else if (k.iLeft == -1)
  {
    if (k.iRight > 0)
    {
      dt = RIGHT;
      image_xscale = RIGHT;
      if (grounded > 0)
      {
        ani("run");
      }
    }
    else
    {
      dt = NONE;
      if (grounded > 0)
      {
        ani("idle");
      }
    }
  }

  if (k.iRight == 1)
  {
    dt = RIGHT;
    image_xscale = RIGHT;
    if (grounded > 0)
    {
      ani("run");
    }
  }
  else if (k.iRight == -1)
  {
    if (k.iLeft > 0)
    {
      dt = LEFT;
      image_xscale = LEFT;
      if (grounded > 0)
      {
        ani("run");
      }
    }
    else
    {
      dt = NONE;
      if (grounded > 0)
      {
        ani("idle");
      }
    }
  }

  // handle acceleration
  if (dt != NONE)
  {
    // accelerate at 1 pixel per frame
    dx += dt;
    // Limit max speed to 10 pixels per frame
    if (abs(dx) > 10)
    {
      dx -= sign(dx)*1.5;
    }
  }
  else
  {
    dx = dx/2;
    if (dx < 0.1)
    {
      dx = 0;
    }
  }

  x += dx;

  // handle horizontal collision
  // returns the object colliding with oHero.h_col_rect, e.g. c
  h_col_rect_x1 = x-15;
  h_col_rect_y1 = y-120;
  h_col_rect_x2 = x+15;
  h_col_rect_y2 = y-5;

  hc_object = collision_rectangle(h_col_rect_x1, h_col_rect_y1,
                                 h_col_rect_x2, h_col_rect_y2,
                                 c, false, false);

  with (hc_object)
  {
    other.code_check = "horizontal col";
    // If oHero's x value on the previous frame was to the right of
    // the collision rect's right edge
    if (other.xprevious > bbox_right)
    {
      // keep oHero 15 pixels to the right of hc_object (against hc_object)
      other.x = bbox_right+15;
    }
    // If oHero's x value on the previous frame was to the left of
    // the collision rect's left edge
    else if (other.xprevious < bbox_left)
    {
      // keep oHero 15 pixels to the left of hc_object (against hc_object)
      other.x = bbox_left-15;
    }
  }

  // jump
  // If on the ground AND jump has been pressed 1 -> 7 frames
  if (grounded > 0 && k.iJump > 0 && k.iJump < 8)
  {
    // not on the ground
    grounded = 0;
    // Move up 18 pixels each frame
    dy = -18;
    canJumpCancel = true;
    // Set animation to "jump"
    ani("jump");
  }
  // If in the air AND jump is not being pressed AND moving up
  else if (canJumpCancel && k.iJump == -1 && dy < 0)
  {
    // halve the moving up speed each frame
    dy /= 2;
    canJumpCancel = false;
  }

  y += dy;

  // handle vertical collision
  vt_col_rect_x1 = x-13;
  vt_col_rect_y1 = y-120;
  vt_col_rect_x2 = x+13;
  vt_col_rect_y2 = y-100;

  vc_top_object = collision_rectangle(vt_col_rect_x1, vt_col_rect_y1,
                                 vt_col_rect_x2, vt_col_rect_y2,
                                 c, false, false);

  with (vc_top_object)
  {
    other.code_check = "vertical top col";
    // with oHero
    with (other)
    {
      // oHero.y = vc_top_object.bbox_bottom+120
      // Move oHero so that it's top is touching the bottom of the
      // vc_top_object.
      y = other.bbox_bottom+120;
      // halve the moving up speed each frame
      dy /= 2;
    }
  }

  vb_col_rect_x1 = x-13;
  vb_col_rect_y1 = y;
  vb_col_rect_x2 = x+13;
  vb_col_rect_y2 = y+2;

  vc_bot_object = collision_rectangle(vb_col_rect_x1, vb_col_rect_y1,
                                 vb_col_rect_x2, vb_col_rect_y2,
                                 c, false, false);

  with (vc_bot_object)
  {
    other.code_check = "vertical bot col";
    // with oHero
    with (other)
    {
      grounded = 6;
      // If oHero's y value (origin at feet) on the previous frame was higher than
      // the collision rect's top edge
      if (yprevious < other.bbox_top)
      {
        // Move oHero so that it's bottom is touching the top of the
        // vc_bot_object.
        y = other.bbox_top;
        // oHero up movement = 0
        dy = 0;
        // If oHero is not moving right or left
        if (dt == NONE)
        {
          ani("idle");
        }
        else
        {
          ani("run");
        }
      }
    }
  }

  // If in the air
  if (--grounded <= 0)
  {
    // Add gravity
    dy += 1;
    // If Hero is moving down and they're not in "fall" animation
    if (dy > 0 && animation != "fall")
    {
      ani("fall");
    }
  }

  // attack / block
  // If on the ground AND attack has been pressed for 1 -> 7 frames
  if (grounded > 4 && k.iAttack > 0 && k.iAttack < 8)
  {
    state = ATTACK;
    ani("attack");
  }
  // If on the ground and block has been pressed for 1 frame or more
  else if (grounded > 4 && k.iBlock > 0)
  {
    // Stop any horiz orvert movement
    dx = 0;
    dy = 0;
    state = BLOCK;
    ani("shield");

    // Create a block box
    last_blockbox_x1 = x+25*image_xscale;
    last_blockbox_y1 = y-120;
    last_blockbox_x2 = x+40*image_xscale;
    last_blockbox_y2 = y-70;
    myBlockbox = doBlockbox(last_blockbox_x1, last_blockbox_y1,
                            last_blockbox_x2, last_blockbox_y2);
  }
  // Update position of the oHero's hurtbox
  updateBox(myHurtbox);
} //-

/// ATTACK state
if (state == ATTACK)
{ //-
  if (image_index == 14)
  {
    last_hitbox_x1 = x+20*image_xscale;
    last_hitbox_y1 = y-110;
    last_hitbox_x2 = x+128*image_xscale;
    last_hitbox_y2 = y-90;
    // hitbox lasts for 16 frames and deals 1 damage.
    // width = 108, height = 20
    myHitbox = doHitbox(last_hitbox_x1, last_hitbox_y1,
                        last_hitbox_x2, last_hitbox_y2,
                        16, 1);
  }

} //-

/// BLOCK state
if (state == BLOCK)
{ //-
  // attack / unblock
  if (grounded > 4 && k.iAttack > 0 && k.iAttack < 8)
  {
    state = ATTACK;
    ani("attack");
    with (myBlockbox) {
      instance_destroy();
    }
  }
  else if (k.iBlock < 1)
  {
    state = NORM;
    dy = 0;
    // boolean math checking if left and/or right are being pressed
    // e.g. true - true, 1-1 = 0, will stop horiz movement because
    // both left and right are being pressed.
    dt = (k.iRight > 0)-(k.iLeft > 0);
    if (dt == NONE)
    {
      dx = 0;
      ani("idle");
    }
    else
    {
      image_xscale = dt;
      dx = 5*dt;
      ani("run");
    }
    with (myBlockbox)
    {
      instance_destroy();
    }
  }
} //-

