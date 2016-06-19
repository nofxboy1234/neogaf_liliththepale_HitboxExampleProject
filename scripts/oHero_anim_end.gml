if (state == DEAD) exit;
switch (animation) {
  case "attack":
  case "attackFail":
  case "flinch": {
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
    break;
  }
  case "block": {
    state = BLOCK;
    ani("shield");
    break;
  }
}
