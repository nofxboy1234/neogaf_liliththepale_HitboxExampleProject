/// NORMAL state
if (state == NORM) { //-
// handle left and right inputs
if (k.iLeft == 1) {
  dt = LEFT;
  image_xscale = LEFT;
  if (grounded > 0) ani("run");
} else if (k.iLeft == -1) {
  if (k.iRight > 0) {
    dt = RIGHT;
    image_xscale = RIGHT;
    if (grounded > 0) ani("run");
  } else {
    dt = NONE;
    if (grounded > 0) ani("idle");
  }
}
if (k.iRight == 1) {
  dt = RIGHT;
  image_xscale = RIGHT;
  if (grounded > 0) ani("run");
} else if (k.iRight == -1) {
  if (k.iLeft > 0) {
    dt = LEFT;
    image_xscale = LEFT;
    if (grounded > 0) ani("run");
  } else {
    dt = NONE;
    if (grounded > 0) ani("idle");
  }
}

// handle acceleration
if (dt != NONE) {
  dx += dt;
  if (abs(dx) > 10) dx -= sign(dx)*1.5;
} else {
  dx = dx/2;
  if (dx < 0.1) dx = 0;
}

x += dx;

// handle horizontal collision
with (collision_rectangle(x-15, y-120, x+15, y-5, c, false, false)) {
  if (other.xprevious > bbox_right) {
    other.x = bbox_right+15;
  } else if (other.xprevious < bbox_left) {
    other.x = bbox_left-15;
  }
}

// jump
if (grounded > 0 && k.iJump > 0 && k.iJump < 8) {
  grounded = 0;
  dy = -18;
  canJumpCancel = true;
  ani("jump");
} else if (canJumpCancel && k.iJump == -1 && dy < 0) {
  dy /= 2;
  canJumpCancel = false;
}

y += dy;

// handle vertical collision
with (collision_rectangle(x-13, y-120, x+13, y-100, c, false, false)) {
  with (other) {
    y = other.bbox_bottom+120;
    dy /= 2;
  }
}
with (collision_rectangle(x-13, y, x+13, y+2, c, false, false)) {
  with (other) {
    grounded = 6;
    if (yprevious < other.bbox_top) {
      y = other.bbox_top;
      dy = 0;
      if (dt == NONE) {
        ani("idle");
      } else {
        ani("run");
      }
    }
  }
}
if (--grounded <= 0) {
  dy += 1;
  if (dy > 0 && animation != "fall") {
    ani("fall");
  }
}

// attack / block
if (grounded > 4 && k.iAttack > 0 && k.iAttack < 8) {
  state = ATTACK;
  ani("attack");
} else if (grounded > 4 && k.iBlock > 0) {
  dx = 0;
  dy = 0;
  state = BLOCK;
  ani("shield");

  last_blockbox_x1 = x+25*image_xscale;
  last_blockbox_y1 = y-120;
  last_blockbox_x2 = x+40*image_xscale;
  last_blockbox_y2 = y-70;
  myBlockbox = doBlockbox(last_blockbox_x1, last_blockbox_y1,
                          last_blockbox_x2, last_blockbox_y2);
}
updateBox(myHurtbox);

} //-

/// ATTACK state

if (state == ATTACK) { //-

if (image_index == 14) {

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

if (state == BLOCK) { //-

// attack / unblock
if (grounded > 4 && k.iAttack > 0 && k.iAttack < 8) {
  state = ATTACK;
  ani("attack");
  with (myBlockbox) {
    instance_destroy();
  }
} else if (k.iBlock < 1) {
  state = NORM;
  dy = 0;
  dt = (k.iRight > 0)-(k.iLeft > 0);
  if (dt == NONE) {
    dx = 0;
    ani("idle");
  } else {
    image_xscale = dt;
    dx = 5*dt;
    ani("run");
  }
  with (myBlockbox) {
    instance_destroy();
  }
}

} //-
