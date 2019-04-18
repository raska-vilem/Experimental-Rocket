use <cone_lib.scad>
include <../config.scad>

module nosecone() {
translate([0, 0, joint_height+1]) tangent_ogive_cone(container_outer_diameter/2, container_outer_diameter/2*4, 1, 1);
translate([0, 0, joint_height]) difference() {
    cylinder(d=container_outer_diameter, h=1, $fn=100);
    cylinder(d=cone_joint_outer_diameter-2, h=1, $fn=100);
}

difference() {
	cylinder(d=cone_joint_outer_diameter, h=joint_height, $fn=100);
	difference() {
		cylinder(d=cone_joint_outer_diameter-2, h=joint_height+0.1, $fn=100);
		translate([container_outer_diameter/2-4, -container_outer_diameter/2, 0]) cube([joint_height, container_outer_diameter, joint_height]);
		translate([-(container_outer_diameter/2-4+joint_height), -container_outer_diameter/2, 0]) cube([joint_height, container_outer_diameter, joint_height]);	
	}
	translate([0, 0, 1]) cube([cone_joint_outer_diameter, 3, 2], center=true);
	translate([(cone_joint_outer_diameter-2)/2, -1.5, 0]) cube([2, 3, joint_height]);
	translate([-(cone_joint_outer_diameter-2)/2-2, -1.5, 0]) cube([2, 3, joint_height]);
}
}

translate([0, 0, (container_outer_diameter*2+1+joint_height)/-2]) nosecone();