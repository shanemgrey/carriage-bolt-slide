// Plate that sits over bolt for holding clips.

boltThickness = 8.3; 
plateDia = 70;
plateThickness = 3;
holeSets = 4;
holeWidth = 4;
holeSeperation = 24;
holeFromCenter = 24;

difference () {
    cylinder(r=plateDia/2, plateThickness, center=true, $fn = 100);
    union () {
        for ( i = [0 : 360/holeSets : 360] )
        {
        rotate( i,[2])
        zipHoles (holeFromCenter, holeSeperation/2, plateThickness*2, holeWidth, plateThickness);
        }
        // Center Bolt Hole
        cylinder(r=boltThickness/2, plateThickness*2, center=true, $fn = 20);
    }
}

// pair of holes for zipties
module zipHoles (x, y, z, holeWidth, plateThickness) {
    translate ([x, y-holeWidth/2, -z])
    cube ([holeWidth, holeWidth, plateThickness*5], false);
    translate ([x, -y-holeWidth/2, -z])
    cube ([holeWidth, holeWidth, plateThickness*5], false);
}
