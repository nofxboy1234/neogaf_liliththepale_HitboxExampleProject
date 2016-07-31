/// draw player's HP

for (i = 0; i < oHero.maxHP; i += 2;) {
    draw_sprite(sHPHeart, clamp(oHero.hp-i, 0, 2), (view_wview/2)-((oHero.maxHP|2)-2)*16+32*i, 48);
}
if (debug) {
    draw_set_colour(c_red);
    //show_debug_message("fps = " + string(fps));

    //  room_speed: the number of game steps that GameMaker: Studio will TRY to
    //  maintain each second.
    // draw_text(32, 32*1, "room_speed = " + string(room_speed));

    //  fps: the number of CPU steps that GameMaker: Studio is actually completing
    //  in a second, CAPPED at the room_speed.
    // draw_text(32, 32*2, "fps = " + string(fps));

    //  fps_real: the number of CPU steps that GameMaker: Studio is ACTUALLY completing
    //  in a second (the real fps), and this value is generally MUCH HIGHER
    //  than the room_speed, but will drop as your game gets more complex and uses
    //  more processing power to maintain the set room speed.
    // draw_text(32, 32*3, "fps_real = " + string_format(fps_real, 3, 12));

    // delta_time is the time that has passed between this CPU step and the last.
    // In Love2d, dt is measured in seconds
    // (https://love2d.org/wiki/Tutorial:Hamster_Ball), whereas GM:S measures
    // delta_time in microseconds. There are 1 million microseconds in a second,
    // so we divide delta_time by 1000000 to get dt in seconds.
    // This is then multiplied by the 'pixels per second' value to get
    // the actual value to move in pixels on this frame:
    // distance_to_move__on_this_frame = pixels_per_sec * (delta_time / 1,000,000)

    // delta_time will affect: alarms (timers), movement code, and animations.

    // ~
    // // ideal_frame_rate for semi-fixed timestep, see:
    // // (http://gafferongames.com/game-physics/fix-your-timestep/)

    // draw_text(32, 32*4, "delta_time = " + string(delta_time));
    // draw_text(32, 32*5, "dt = " + string_format(dt, 3, 12));

    if (instance_exists(oHero))
    {
        start_x = window_get_width()-300;
        draw_set_color($FF007F);

        draw_text(start_x, 32*1, "oHero.last_hitbox_x1 = " + string(oHero.last_hitbox_x1));
        draw_text(start_x, 32*2, "oHero.last_hitbox_y1 = " + string(oHero.last_hitbox_y1));
        draw_text(start_x, 32*3, "oHero.last_hitbox_x2 = " + string(oHero.last_hitbox_x2));
        draw_text(start_x, 32*4, "oHero.last_hitbox_y2 = " + string(oHero.last_hitbox_y2));

        draw_text(start_x, 32*5, "oHero.code_check = " + string(oHero.code_check));

        draw_set_color($FF5F00);

        draw_text(start_x, 32*6, "oHero.last_blockbox_x1 = " + string(oHero.last_blockbox_x1));
        draw_text(start_x, 32*7, "oHero.last_blockbox_y1 = " + string(oHero.last_blockbox_y1));
        draw_text(start_x, 32*8, "oHero.last_blockbox_x2 = " + string(oHero.last_blockbox_x2));
        draw_text(start_x, 32*9, "oHero.last_blockbox_y2 = " + string(oHero.last_blockbox_y2));

        draw_set_color($00FF3F);

        if (instance_exists(oHero.myHurtbox))
        {
            draw_text(start_x, 32*10, "oHero.hurtbox_x1 = " + string(oHero.myHurtbox.x-32));
            draw_text(start_x, 32*11, "oHero.hurtbox_y1 = " + string(oHero.myHurtbox.y-128));
            draw_text(start_x, 32*12, "oHero.hurtbox_x2 = " + string(oHero.myHurtbox.x));
            draw_text(start_x, 32*13, "oHero.hurtbox_y2 = " + string(oHero.myHurtbox.y));
        }
    }

    draw_set_color(c_teal);
    draw_text(start_x, 32*14, "k.time = " + string(k.time));


    // if (k.x_pressed)
    // {
    //     draw_text(32, 32*10, "x button pressed");
    // }

    // if (k.square_pressed)
    // {
    //     draw_text(32, 32*11, "square button pressed");
    // }

    // if (k.circle_pressed)
    // {
    //     draw_text(32, 32*12, "circle button pressed");
    // }
}
