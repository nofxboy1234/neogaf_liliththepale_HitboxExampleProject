if (!active && resetTime <= k.time) {
  active = true;
}
if (!instance_exists(daddy)) {
  instance_destroy();
}
