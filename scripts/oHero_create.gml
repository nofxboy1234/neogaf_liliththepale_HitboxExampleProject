/// initiate variables

dx = 0;
dy = 0;
dt = NONE;
grounded = true;
canJumpCancel = false;

maxHP = 6;
hp = maxHP;
state = NORM;

ani("idle");

myHurtbox = doHurtbox(x-16, y-128, x+16, y);
myHitbox = noone;
myBlockbox = noone;
