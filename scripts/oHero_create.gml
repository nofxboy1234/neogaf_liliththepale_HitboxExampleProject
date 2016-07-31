/// initiate variables
x += 0.5;

dx = 0;
dy = 0;
// distance over time (speed)
dt = NONE;

grounded = true;
canJumpCancel = false;

maxHP = 6;
hp = maxHP;
state = NORM;

ani("idle");

hurtbox_x1 = x-16;
hurtbox_y1 = y-128;
hurtbox_x2 = x+16;
hurtbox_y2 = y;
myHurtbox = doHurtbox(hurtbox_x1, hurtbox_y1,
                      hurtbox_x2, hurtbox_y2);

last_hitbox_x1 = -1;
last_hitbox_y1 = -1;
last_hitbox_x2 = -1;
last_hitbox_y2 = -1;
myHitbox = noone;

last_blockbox_x1 = -1;
last_blockbox_y1 = -1;
last_blockbox_x2 = -1;
last_blockbox_y2 = -1;
myBlockbox = noone;

code_check = -1;
