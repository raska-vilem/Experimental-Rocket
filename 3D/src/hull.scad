include <../config.scad>

$fn = 120;

module stage() {
difference() {
	cylinder(d=outer_diameter, h=stage_height);
	cylinder(d=outer_diameter-wall_thickness*2, h=stage_height);
}
}

translate([0, 0, -stage_height/2]) stage();