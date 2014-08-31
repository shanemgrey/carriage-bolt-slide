

boltSquareWidth = 8.25;
trackWidth = 10;

trackDims = [trackWidth, trackWidth*6, trackWidth];
plateDims = [trackWidth*2, trackWidth*6, trackWidth/4] ;


difference () {
union() {
    
    // Inside Track
    translate ([trackWidth/2, 0, plateDims[2]-2 ])
    roundedBox (trackDims, 1, false, $fn=40);
    // cube ([trackWidth, trackWidth*6, trackWidth], false);
    
    // Slide Plate
    // translate ([0, 0, trackWidth-0.2])
    roundedBox (plateDims, 1, false,$fn=40);
    // cube ([trackWidth*2, trackWidth*6, trackWidth/4], false);

}
    // Hole for bolt
    translate ([trackWidth-boltSquareWidth/2, trackWidth*3-boltSquareWidth/2, -1])
    cube ([boltSquareWidth, boltSquareWidth, trackWidth*5], false);
}

// size is a vector [w, h, d]
module roundedBox(size, radius, sidesonly) {
  rot = [ [0,0,0], [90,0,90], [90,90,0] ];

  // Translate shape back to origin on corners
  translate((size - [0,0,0])/2)
  if (sidesonly) {
    cube(size - [2*radius,0,0], true);
    cube(size - [0,2*radius,0], true);
     // Full length cylinders on 4 edges
    for (x = [radius-size[0]/2, -radius+size[0]/2],
           y = [radius-size[1]/2, -radius+size[1]/2]) {
      translate([x,y,0]) cylinder(r=radius, h=size[2], center=true);
    }
  }
  else {
    cube([size[0], size[1]-radius*2, size[2]-radius*2], center=true);
    cube([size[0]-radius*2, size[1], size[2]-radius*2], center=true);
    cube([size[0]-radius*2, size[1]-radius*2, size[2]], center=true);
    // Cylinders shortened and on all cube edges
    for (axis = [0:2]) {
      for (x = [radius-size[axis]/2, -radius+size[axis]/2],
             y = [radius-size[(axis+1)%3]/2, -radius+size[(axis+1)%3]/2]) {
        rotate(rot[axis]) 
          translate([x,y,0]) 
          cylinder(h=size[(axis+2)%3]-2*radius, r=radius, center=true);
      }
    }
    //sphere corners
    for (x = [radius-size[0]/2, -radius+size[0]/2],
           y = [radius-size[1]/2, -radius+size[1]/2],
           z = [radius-size[2]/2, -radius+size[2]/2]) {
      translate([x,y,z]) sphere(radius);
    }
  }
}
