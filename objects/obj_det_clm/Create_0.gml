event_inherited()

name = "Determined Climber";
color = $241CEE; //Hex code for the color of the sprite

pushed = false;

dialog[0, 0] = "Hey, watch out! I'm practicing over here! Today's the day I reach the top of the tower, so I'm getting in one last warm up.";
dialog[0, 1] = "I'd suggest you do the same, but let's be honest: it takes a certain kind of person to get to the top, and you don't look like you're it.";

// This dialog should be played instead of the first in the second room of det_clim
second_dialog[0, 0] = "Oh, you made it this far? Huh. Well, good for you. But, hey, don't take this the wrong way, but you oughta quit while you're ahead.";
second_dialog[0, 1] = "It gets real dangerous past this, and anyone who isn't in peak mental and physical condition like yours truly is apt to get hurt.";

// This dialog should be specially played when obj_pc passes det_clim
third_dialog[1, 0] = "Your funeral, pal! When you're frozen with fear 'cause all you can think about is falling off the tower, don't say I didn't warn you!";