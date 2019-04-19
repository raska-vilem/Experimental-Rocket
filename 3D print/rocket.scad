include <config.scad>
use <src/motor.scad>
use <src/nosecone.scad>
use <src/hull.scad>
use <src/joint.scad>
use <src/container.scad>

module_distance = 15;

translate([0, 0, -350]) {
motor();
translate([0, 0, stage_height+module_distance]) stage();
translate([0, 0, stage_height*2+module_distance*2]) joint();
translate([0, 0, stage_height*2+module_distance*3+stage_joint_height+3]) stage();
translate([0, 0, stage_height*3+module_distance*4+stage_joint_height+3-joint_height]) container();
translate([0, 0, stage_height*3+module_distance*5+stage_joint_height+3-joint_height+container_height+container_transition_height]) nosecone();
}