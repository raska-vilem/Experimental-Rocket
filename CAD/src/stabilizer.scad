include <../config.scad>

points = [
    [0, 0, 0],
    [stabilizers_width, stabilizers_bottom_hop, 0],
    [stabilizers_width, stabilizers_outer_height, 0],
    [0, stabilizers_height, 0],
    [0, 0, stabilizers_thickness],
    [stabilizers_width, stabilizers_bottom_hop, stabilizers_thickness],
    [stabilizers_width, stabilizers_outer_height, stabilizers_thickness],
    [0, stabilizers_height, stabilizers_thickness]
];

faces = [
    [0,1,2,3],
    [4,5,1,0],
    [7,6,5,4],
    [5,6,2,1],
    [6,7,3,2],
    [7,4,0,3]
];

polyhedron(points, faces);