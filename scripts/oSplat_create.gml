sprite_index = choose(sSplat1, sSplat2, sSplat3);
image_speed = 0.25+random(0.2);
image_xscale = random(0.2)+0.4;
image_yscale = choose(1, -1)*image_xscale;
image_angle = random(360);

dx = random_range(-8, 8);
dy = random_range(-8, 8);
