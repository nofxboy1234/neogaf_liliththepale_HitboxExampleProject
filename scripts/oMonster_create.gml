image_xscale = choose(-1, 1);

maxHP = 4;
hp = maxHP;
state = NORM;
wait = 0;

ani("float");

myHitbox = doHitbox(x-40, y-140, x+40, y-40, 0, 2);
myHurtbox = doHurtbox(x-35, y-130, x+35, y-20);
