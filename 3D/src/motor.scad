include <../config.scad>

$fn = 120;

motor_prumer = motor_diameter;
motor_vyska = motor_height;

raketa_prumer = outer_diameter;
raketa_vyska = stage_height;

stabilizator_tloustka = stabilizers_thickness;
stabilizator_vyska = stabilizers_height;

stena = wall_thickness;

function vnitrniVzdalenost() = (raketa_prumer/2-stena)-(motor_prumer/2+motor_wall_thickness);
function uhel(number) = 360/number;

CubePoints = [
  [0, 0, 0],
  [vnitrniVzdalenost(), 0, 15],
  [vnitrniVzdalenost(), 1, 15],
  [0, 1, 0],
  [0, 0, 20],
  [vnitrniVzdalenost(), 0, 40],
  [vnitrniVzdalenost(), 1, 40],
  [0, 1, 20]];
  
CubeFaces = [
  [0,1,2,3],  // bottom
  [4,5,1,0],  // front
  [7,6,5,4],  // top
  [5,6,2,1],  // right
  [6,7,3,2],  // back
  [7,4,0,3]]; // left
  
module drzaky(pocet) {
    module drzak() {
         translate([0, -0.5, 0]) polyhedron(points=CubePoints, faces=CubeFaces);
    }
    for (i = [0:uhel(pocet):360]) {
        rotate([0, 0, i]) translate([motor_prumer/2+motor_wall_thickness, 0, motor_vyska-20]) drzak();
    }
}

module motor_block() {
    difference() {
        cylinder(r=motor_prumer/2+motor_wall_thickness, h=motor_vyska);
        cylinder(d=motor_prumer, h=motor_vyska);
    }
}

module trup() {
    difference() {
        cylinder(d=raketa_prumer, h=1);
        cylinder(d=motor_prumer+motor_wall_thickness, h=1);
    }
    difference() {
        cylinder(d=raketa_prumer, h=raketa_vyska);
        cylinder(r=raketa_prumer/2-stena, h=raketa_vyska);
    }
}
module pripoj() {
    difference() {
        translate([0, 0, 10]) cylinder(r1=raketa_prumer/2, r2=raketa_prumer/2-1.25, h=1);
        cylinder(r=raketa_prumer/2-2, h=26);
    }
    difference() {
        union() {
            cylinder(r=raketa_prumer/2-stena, h=25);
            
        }
        translate([0, 0, 10]) union() {
            difference() {
                cylinder(r=raketa_prumer/2-stena, h=20);
                cylinder(r=raketa_prumer/2-1.25, h=21);
            }
        }
        cylinder(r1=raketa_prumer/2-stena, r2=raketa_prumer/2-2, h=10);
        cylinder(r=raketa_prumer/2-2, h=26);
    }
}
module stabilizatory(pocet) {
    module stabilizator() {
        translate([raketa_prumer/2, 0, 0]) difference() {
            union() {
                translate([0, stabilizator_tloustka/2, 0]) cube([5, 1.5, stabilizator_vyska]);
                translate([0, -stabilizator_tloustka/2-1.5, 0]) cube([5, 1.5, stabilizator_vyska]);
            }
            translate([0, 0, stabilizator_vyska]) rotate([0, stabilizers_angle, 0]) translate([0, -(stabilizator_tloustka+3)/2, 0]) cube([30, stabilizator_tloustka+3, 5]);
        }
    }
    for (i = [0:uhel(pocet):360]) {
        rotate([0, 0, i]) stabilizator();
    }
}
module motor() {
    stabilizatory(stabilizers_count);
    translate([0, 0, raketa_vyska-10]) pripoj();
    drzaky(3);
    trup();
    motor_block();
}

translate([0, 0, -raketa_vyska/2]) motor();
