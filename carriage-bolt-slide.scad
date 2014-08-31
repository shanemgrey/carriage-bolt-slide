boltSquareWidth = 8.25;
trackWidth = 10;



difference () {
union() {
    
    // Inside Track
    translate ([trackWidth/2, 0, trackWidth*1.25-0.2])
    cube ([trackWidth, trackWidth*6, trackWidth], false);
    
    // Slide Plate
    translate ([0, 0, trackWidth-0.2])
    cube ([trackWidth*2, trackWidth*6, trackWidth/4], false);

}
    // Hole for bolt
    translate ([trackWidth-boltSquareWidth/2, trackWidth*3-boltSquareWidth/2, -1])
    cube ([boltSquareWidth, boltSquareWidth, trackWidth*5], false);
}