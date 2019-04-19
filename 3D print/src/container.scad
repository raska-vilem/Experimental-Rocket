include <../config.scad>
$fn=170;

module container() {
    translate([0, 0, joint_height]) union() {
        difference() {
            cylinder(d1=outer_diameter, d2=container_outer_diameter, h=container_transition_height);
            cylinder(d1=joint_outer_diameter-wall_thickness*2, d2=container_outer_diameter-container_wall_thickness*2, h=container_transition_height);
        }
        translate([0, 0, -joint_height]) difference() {
            cylinder(d=joint_outer_diameter, h=joint_height);
            cylinder(d=joint_outer_diameter-wall_thickness*2, h=joint_height);
        }
        translate([0, 0, container_transition_height]) difference() {
            cylinder(d=container_outer_diameter, h=container_height);
            cylinder(d=container_outer_diameter-container_wall_thickness*2, h=container_height);
        }
    }
}

translate([0, 0, (container_transition_height+container_height+joint_height)/-2]) container();