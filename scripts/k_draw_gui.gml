/// draw player's HP

for (i = 0; i < oHero.maxHP; i += 2;) {
  draw_sprite(sHPHeart, clamp(oHero.hp-i, 0, 2), (view_wview/2)-((oHero.maxHP|2)-2)*16+32*i, 48);
}

draw_set_colour(c_red);
//show_debug_message("fps = " + string(fps));

//  room_speed: the number of game steps that GameMaker: Studio will TRY to
//  maintain each second.
draw_text(32, 32*1, "room_speed = " + string(room_speed));

//  fps: the number of CPU steps that GameMaker: Studio is actually completing
//  in a second, CAPPED at the room_speed.
draw_text(32, 32*2, "fps = " + string(fps));

//  fps_real: the number of CPU steps that GameMaker: Studio is ACTUALLY completing
//  in a second (the real fps), and this value is generally MUCH HIGHER
//  than the room_speed, but will drop as your game gets more complex and uses
//  more processing power to maintain the set room speed.
draw_text(32, 32*3, "fps_real = " + string_format(fps_real, 3, 12));

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

draw_text(32, 32*4, "delta_time = " + string(delta_time));
draw_text(32, 32*5, "dt = " + string_format(dt, 3, 12));


if (instance_exists(oHero.myHitbox))
{
    draw_text(32, 32*6, "oHero.myHitbox.x1 = " + string(oHero.myHitbox.x1));
    draw_text(32, 32*7, "oHero.myHitbox.y1 = " + string(oHero.myHitbox.y1));
    draw_text(32, 32*8, "oHero.myHitbox.x2 = " + string(oHero.myHitbox.x2));
    draw_text(32, 32*9, "oHero.myHitbox.y2 = " + string(oHero.myHitbox.y2));
}

