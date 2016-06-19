if (state == NORM) {
  x += image_xscale*2;
  wait--;
  if (collision_rectangle(x, y-150, x+image_xscale*50, y-10, c, false, false) || (wait < 0 && !collision_rectangle(x+image_xscale*40, y, x+image_xscale*50, y+10, c, false, false) && sign(x-xstart) == image_xscale)) {
    image_xscale *= -1;
  } else if (wait < 0 && collision_rectangle(x, y-92, x+image_xscale*500, y-88, oHero.myHurtbox, false, false) && !collision_rectangle(x, y-92, oHero.x, y-88, c, false, false)) {
    state = ATTACK;
    ani("shoot");
  }
} else if (state == STUN) {
  x -= image_xscale*10/(1+image_index);
  if (collision_rectangle(x, y-150, x-image_xscale*50, y-10, c, false, false)) {
    x = xprevious;
  }
} else if (state == ATTACK) {
  if (image_index == 48) {
    with (instance_create(x+image_xscale*32, y-90, oFireball)) {
      daddy = other.id;
      with (myHitbox) sugardaddy = other.daddy;
      dx = other.image_xscale*10;
    }
  }
}

updateBox(myHitbox);
updateBox(myHurtbox);
