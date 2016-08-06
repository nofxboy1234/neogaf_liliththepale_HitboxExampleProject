/// hurtbox damaged

code_check = "hurtbox damaged";

ani("flinch");
state = STUN;
with (myBlockbox) {
  instance_destroy();
}
if (hp <= 0)
{
  state = DEAD;
  visible = false;
  alarm[0] = 29;
  with (myHurtbox)
  {
    instance_destroy();
  }
  repeat (7)
  {
    instance_create(x+random_range(-10, 10), y-random_range(20, 108), oSplat);
  }
}
else
{
  repeat (2)
  {
    instance_create(hitX, hitY, oSplat);
  }
}
