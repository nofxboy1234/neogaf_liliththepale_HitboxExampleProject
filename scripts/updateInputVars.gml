/// updateInputVars()

if (keyboard_check(ord("Z")) || keyboard_check(vk_up) || gamepad_button_check(0, gp_face1)) {
  iJump += 1;
  k.x_pressed = true;
} else if (iJump > 0) {
  iJump = -1;
} else {
  iJump = 0;
}

if (keyboard_check(ord("X")) || keyboard_check(vk_space) || gamepad_button_check(0, gp_face3)) {
  iAttack += 1;
  k.square_pressed = true;
} else if (iAttack > 0) {
  iAttack = -1;
} else {
  iAttack = 0;
}

if (keyboard_check(ord("C")) || keyboard_check(vk_shift) || gamepad_button_check(0, gp_face2)) {
  iBlock += 1;
  k.circle_pressed = true;
} else if (iBlock > 0) {
  iBlock = -1;
} else {
  iBlock = 0;
}

if (keyboard_check(vk_left) || gamepad_button_check(0, gp_padl) || gamepad_axis_value(0, gp_axislh) < -0.3) {
  iLeft += 1;
} else if (iLeft > 0) {
  iLeft = -1;
} else {
  iLeft = 0;
}

if (keyboard_check(vk_right) || gamepad_button_check(0, gp_padr) || gamepad_axis_value(0, gp_axislh) > 0.3) {
  iRight += 1;
} else if (iRight > 0) {
  iRight = -1;
} else {
  iRight = 0;
}
