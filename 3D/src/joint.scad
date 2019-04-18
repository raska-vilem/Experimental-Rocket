include <../config.scad>

$fn=170;

module joint() {
difference() {
    union() {
        cylinder(d1=joint_outer_diameter, d2=outer_diameter, h=1.5);
        translate([0, 0, 1.5]) cylinder(d=outer_diameter, h=stage_joint_height);
        translate([0, 0, stage_joint_height+1.5]) cylinder(d1=outer_diameter, d2=joint_outer_diameter, h=1.5);
        translate([0, 0, -joint_height]) cylinder(d=joint_outer_diameter, h=joint_height);
        translate([0, 0, stage_joint_height+3]) cylinder(d=joint_outer_diameter, h=joint_height);
    }
    translate([0, 0, -joint_height]) cylinder(d=joint_outer_diameter-wall_thickness*2, h=joint_height*2+3+stage_joint_height);
}
}

joint();