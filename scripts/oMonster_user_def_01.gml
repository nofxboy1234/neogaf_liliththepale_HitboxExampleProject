/// hurtbox damaged

ani("recoil");
state = STUN;
if (hitX != x) {
  image_xscale = sign(hitX-x);
}
if (hp <= 0) {
  repeat (7) {
    instance_create(x+random_range(-10, 10), y-random_range(60, 100), oSplat);
  }
  instance_destroy();
} else {
  repeat (2) {
    instance_create(hitX, hitY, oSplat);
  }
}
