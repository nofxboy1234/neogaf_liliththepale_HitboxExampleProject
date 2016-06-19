/// hitbox Step code
var l, r, dmg, _x, _y;
l = bbox_left;
r = bbox_right;
dmg = damage;

// user events
// 1: hurtbox damaged
// 2: blockbox struck
// 3: hitbox interrupted
// 4: hitbox hit some hurtbox

if (blocked && resetTime <= k.time) {
  blocked = false;
}

// if the controller's time has passed this hitbox dietime,
// or this hitbox's parent doesn't exist, destroy this hitbox.
if ((dieTime != 0 && dieTime <= k.time) || !instance_exists(daddy)) {
  instance_destroy();
  exit;
}

// Step through all the colidable objects, and run the below code
// from their point of view.
with (c) {
  // If this hitbox (other - this object) is colliding with a collidable object(c) e.g. oGround
  if (collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, other.id, false, false)) {
    // Get the x value of the middle of the collidable
    _x = mean(l, r);
    // If this hitbox is to the right
    if (other.bbox_left >= bbox_left) {
      // Get the furthest right x value - this hitbox's left x or the collidable's right x+1
      // The furthest left the hitbox can move.
      l = max(other.bbox_left, bbox_right+1);
      _x = l;
      // If this hitbox is to the left
    } else if (other.bbox_right <= bbox_right) {
    // Get the furthest left x value - this hitbox's right x or the collidable's left x-1
    // The furthest right the hitbox can move.
      r = min(other.bbox_right, bbox_left-1);
      _x = r;
    }
    // Get the y value of the middle of the collidable
    _y = mean(other.bbox_top, other.bbox_bottom);
    // with this hitbox's parent e.g. oHero
    with (other.daddy) {
      // Where the parent will hit on x and y
      hitX = _x;
      hitY = _y;
      // hit box interrupted signal
      event_user(3);
    }
    // If this hitbox is outside the collidable's 1 pixel bbox buffer (e.g. oGround))
    if (l != other.bbox_left || r != other.bbox_right) {
      with (other) {
        // Make the hitbox's x value equal to it's current x value on this frame, OR finally - the collidable's x with 1 pixel buffer.
        x = l;
        // Shrink this hitbox and leave a gap of 1 pixel between it and the collidable
        image_xscale = (r-l)/32;
      }
      // If after shrinking the hitbox, it is inside the collidable
      if (l >= r) {
      // Destroy this hitbox
        with (other) {
          instance_destroy();
        }
      }
    } else {
      // This hitbox is completely inside the collidable's 1 pixel bbox buffer (e.g. oGround))
      // Destroy the hitbox
      with (other) {
        instance_destroy();
      }
    }
  }
}

if (!blocked) {
  with (blockbox) {
    if (daddy != other.daddy && collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, other.id, false, false)) {
      other.blocked = true;
      other.resetTime = k.time+10;
      _x = mean(bbox_left, bbox_right, other.bbox_left, other.bbox_right);
      _y = mean(bbox_top, bbox_bottom, other.bbox_top, other.bbox_bottom);
      with (daddy) {
        hitX = _x;
        hitY = _y;
        event_user(2);
      }
      with (other.daddy) {
        hitX = _x;
        hitY = _y;
        event_user(3);
      }
    }
  }
}

if (!blocked) {
  with (hurtbox) {
    if (active && daddy != other.daddy && daddy != other.sugardaddy && collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, other.id, false, false)) {
      active = false;
      resetTime = max(k.time+10, other.dieTime);
      _x = mean(bbox_left, bbox_right, other.bbox_left, other.bbox_right);
      _y = mean(bbox_top, bbox_bottom, other.bbox_top, other.bbox_bottom);
      with (other) {
        with (daddy) {
          hitX = _x;
          hitY = _y;
          event_user(4);
        }
      }
      with (daddy) {
        if (dmg == 0) {
          hp = 0;
        } else {
          hp -= dmg;
        }
        hitX = _x;
        hitY = _y;
        event_user(1);
      }
    }
  }
}

// if (other == oHero)
// {
//   draw_text(32, 32*1, "oHero.hitbox.l = " + string(l));
//   // draw_text(32, 32*2, "fps = " + string(fps));
// }

// draw_set_colour(c_red)
// draw_text(32, 32*1, "oHero.hitbox.l = " + string(l));
// draw_text(32, 32*2, "fps = " + string(fps));
