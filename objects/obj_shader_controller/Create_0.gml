

application_surface_draw_enable(false) ///  stop application surface from drawing


// CAN BE EDITED:
pixelsize = 8

// ----- 2 by 2 -----
//	magic_grid = [	1,		0.001,	
//					0.25,	0.75]	

// ----- 4 by 4 ----- magic square
//	magic_grid = [	8/16,	11/16,	14/16,	1/16,
//					13/16,	2/16,	7/16,	12/16,
//					3/16,	16/16,	9/16,	6/16,
//					10/16,	5/16,	4/16,	15/16]

// ----- 4 by 4 ----- numbers from 0 to 1
//	magic_grid = [	1/16,	2/16,	3/16,	4/16,
//					5/16,	6/16,	7/16,	8/16,
//					9/16,	10/16,	11/16,	12/16,
//					13/16,	14/16,	15/16,	16/16]

// ----- 4 by 4 ----- all the same number
//	magic_grid = [	0.3,	0.3,	0.3,	0.3,
//					0.3,	0.3,	0.3,	0.3,
//					0.3,	0.3,	0.3,	0.3,
//					0.3,	0.3,	0.3,	0.3]

// ----- 8 by 8 ----- magic square
	magic_grid = [	50/64,	11/64,	24/64,	63/64,	14/64,	37/64,	26/64,	35/64,	
					23/64,	62/64,	51/64,	12/64,	25/64,	34/64,	15/64,	38/64,	
					10/64,	49/64,	64/64,	21/64,	46/64,	13/64,	36/64,	27/64,	
					61/64,	22/64,	9/64,	52/64,	33/64,	28/64,	39/64,	16/64,	
					48/64,	7/64,	60/64,	1/64,	20/64,	41/64,	54/64,	29/64,	
					59/64,	4/64,	45/64,	8/64,	53/64,	32/64,	17/64,	42/64,	
					6/64,	47/64,	2/64,	57/64,	44/64,	19/64,	30/64,	55/64,	
					3/64,	58/64,	5/64,	46/64,	31/64,	56/64,	43/64,	18/64]

//DONT EDIT:
magic_grid_width = sqrt(array_length(magic_grid))

// Just check that everything is correct with the grid:
if (!is_wholenumber(magic_grid_width)) show_error("ERROR: Something is wrong with the grid, I expected a square grid",true);


// shader:
var i = 0
shader_params[i++] = shader_get_uniform(shader_fullscreen, "u_screen")
shader_params[i++] = shader_get_uniform(shader_fullscreen, "u_pixelsize") // as a decimal 
shader_params[i++] = shader_get_uniform(shader_fullscreen, "u_squaresize") // width/height of the magic square
shader_params[i++] = shader_get_uniform(shader_fullscreen, "u_magicsquare") // the magic square
shader_params[i++] = shader_get_uniform(shader_fullscreen, "u_col_1_r")
shader_params[i++] = shader_get_uniform(shader_fullscreen, "u_col_1_g")
shader_params[i++] = shader_get_uniform(shader_fullscreen, "u_col_1_b")
shader_params[i++] = shader_get_uniform(shader_fullscreen, "u_col_2_r")
shader_params[i++] = shader_get_uniform(shader_fullscreen, "u_col_2_g")
shader_params[i++] = shader_get_uniform(shader_fullscreen, "u_col_2_b")

