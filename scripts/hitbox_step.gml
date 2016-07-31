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

// Step through all the collidable objects, and run the below code
// from their point of view.
with (c) {
  // If this hitbox (other - this object) is colliding with a collidable object(c) e.g. oGround
  if (collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, other.id, false, false)) {
    // Get the halfway x-value of this hitbox
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

    // Get the halfway y-value of this hitbox
    _y = mean(other.bbox_top, other.bbox_bottom);
    // with this hitbox's parent e.g. oHero
    with (other.daddy) {
      // Where the parent will hit on x and y
      hitX = _x;
      hitY = _y;
      // hit box interrupted signal
      event_user(3);
    }

    // If this hitbox is penetrating the collidable's 1 pixel bbox buffer (e.g. oGround))
    // This hitbox is either to the right, and it's left edge is inside the collidable
    // or this hitbox is to the left, and it's right edge is inside the collidable.
    if (l != other.bbox_left || r != other.bbox_right) {
      with (other) {
        // if (daddy.id == oHero.id) {
        //   daddy.code_check = 0;
        // }

        // If there is NO collision: Then the hitbox's x value will be equal to it's current bbox_left value on this frame (Set around line 3).
        // If there IS a collision and the hitbox is to the right: The hitbox's x value will be its bbox_left or the collidable's bbox_right+1, its r will stay the same.
        // If there IS a collision and the hitbox is to the left: The hitbox's x value will be its bbox_left (l will stay the same), its r will be its bbox_right or the collidable's bbox_left-1.

        // The hitbox x-value detemines it's position, and the r value will be adjusted accordingly.
        x = l;
        // Scale this hitbox and leave a gap of 1 pixel between it and the collidable
        image_xscale = (r-l)/32;
      }

      // If after scaling the hitbox, it is COMPLETELY inside the collidable
      if (l >= r) {
        // if (other.daddy.id == oHero.id) {
        //   other.daddy.code_check = 1;
        // }

      // Destroy this hitbox immediately without letting it complete its lifetime.
        with (other) {
          instance_destroy();
        }
      }
    } else {
      // if (other.daddy.id == oHero.id) {
      //   other.daddy.code_check = 2;
      // }

      // The hitbox is right up against the collidable's 1 pixel bbox buffer.
      // Destroy the hitbox without scaling it.
      // I don't think this ever executes because it seems that this is not a collision in GMS.
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
