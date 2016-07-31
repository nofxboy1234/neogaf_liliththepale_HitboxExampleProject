/// hitbox interrupted

code_check = "hitbox interrupted";

if (state != STUN) {
  state = STUN;
  ani("attackFail");
}
