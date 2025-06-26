/// @description Update TV flicker
colorJustChanged = false;
var oldColorValue = roomColorTintNum;

thisColorTintTimer--;
if(thisColorTintTimer <= 0) {
    thisColorTintTimer = random_range(75, 120);
    
    if(random(100) < 35) {
        roomColorTintNum = random_range(80, 100);
    } else {
        roomColorTintNum = random_range(40, 70);
    }
    
    // Only flag if there's a significant change
    if(abs(roomColorTintNum - oldColorValue) > 20) {
        colorJustChanged = true;
    }
}