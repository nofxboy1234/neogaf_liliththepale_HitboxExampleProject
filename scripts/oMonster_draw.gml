draw_self();

draw_sprite(sHPBar, 0, x-50, y-150);
draw_sprite_part(sHPBar, 1, 0, 0, 100*hp/maxHP, 16, x-50, y-150);
