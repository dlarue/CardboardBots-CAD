//include <./SmartCarGearMotor.scad>;
include <./SmartCarGearMotor-Gearbox.scad>;

mmBaseL=35;
mmBaseW=21;
mmSideL=mmBaseL;
mmSideH=22;
mmSideW=3;

mOffset=25.2;

mmPinR=1.4;
mmPinH=25.0; // flush is 22
mAxlePinR=4;
mAxleTorqPinR=2.25;
$fn=30;

translate([-3+mmBaseL/2,0,0]) mirror([0,1,0]) mount(); 
translate([-10-mmBaseL/2,0,0]) mount();
//mirror([0,1,0]) mount();

module mount( ) {
difference() {
    union(){
    translate([mOffset-mmBaseL,-mmSideH/2,0])
        cube([mmSideL,mmSideH,mmSideW]); // side mounting plate
    translate([mOffset-mmBaseL,13,0]) 
        rotate([90,0,0]) cube([mmBaseL,mmBaseW,2]); // bottom glue plate
    translate([mOffset-mmBaseL,-mmSideH/2+2,0])
        rotate([0,-90,0]) cube([mmSideL/2-4,mmSideH,mmSideW]); // back plate


    translate([20.6,-8.8,0]) 
        rotate([0,0,0]) #cylinder(r=mmPinR,h=mmPinH); //motor mount pins-Hot Melt
    translate([20.6,8.8,0]) 
        rotate([0,0,0]) #cylinder(r=mmPinR,h=mmPinH); //motor mount pins-Hot Melt
        
    }
    //use <./SmartCarGearMotor.scad>;
    translate([0,0,12.4]) rotate([90,0,0])#object1(1);
    translate([0.5,0,0]) rotate([0,0,0]) #cylinder(r=mAxlePinR,h=25); //motor axle pins clearance
    translate([11.3,0,mmSideW-1.8]) rotate([0,0,0]) #cylinder(r=mAxleTorqPinR,h=25); //gearbox anti-torque pin clearance
    
}
}