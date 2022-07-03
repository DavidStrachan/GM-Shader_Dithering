//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec2 u_screen;
uniform vec2 u_pixelsize;
uniform float u_squaresize;
uniform float u_magicsquare[64];
uniform float u_col_1_r;
uniform float u_col_1_g;
uniform float u_col_1_b;
uniform float u_col_2_r;
uniform float u_col_2_g;
uniform float u_col_2_b;



// STANDARD DAVE SHADER TOOLS v0.3
/*
float lerp(float _output_min, float _output_max, float _amount) { // I'm sorry I just dont think I can remember to call this one mix
	return mix(_output_min,_output_max,_amount);
}
float lerp_long(float _input_min, float _input_max, float _output_min, float _output_max, float _amount) {
    return ( mix(_input_min,_input_max,_amount) * (_output_max - _output_min) ) + _output_min;
}
float debug(float _value) {
	if			(_value == 65535.0) {// CUSTOM VALUE flash black
		float ease_amount = 0.0;
		//if (sin(iFrame / 4.0) > 0.0) {ease_amount = 1.0;}
		gl_FragColor = vec4(ease_amount,ease_amount,ease_amount,1.); 
	} else if	(_value == 0.) {
		gl_FragColor = vec4(1.,0.,1.,1.); // 0=Magenta 
	} else if	(_value == 1.) {
		gl_FragColor = vec4(0.,1.,0.,1.); // 1=Green 
	} else if	(_value > 0. && _value < 1.) {
		gl_FragColor = vec4(_value,_value,_value,1.); // 0-1 = Grey 
	} else if	(_value > 0. && _value < 255.) {
		gl_FragColor = vec4(_value/300.,_value/300.,1.,1.); // 1-255 = Blue 
	} else if	(_value > -1. && _value < 0.) {
		float ease_amount = abs(_value)/2.0;
		gl_FragColor = vec4(1.,0.5+ease_amount,0.+ease_amount,1.); // -1-0 = Orange 
	} else if	(_value < -1.) {
		gl_FragColor = vec4(1.,0.,0.,1.); // <0 = Red 
	} else if	(_value > 255.) {
		gl_FragColor = vec4(1.,1.,0.,1.); // >255 = Yellow 
	}	
		
	return 1.0;
} 
float rand( vec2 p) { // xor shader
    return fract( cos( dot( p, vec2(5.237,6.378)))*8463.648);
}
*/

void main()
{
	// HANDY values
	vec2 ratio = vec2(1.0,u_screen.y/u_screen.x); // ratio of the screen size, i.e: (1,0.5625)
	vec2 square_pos = v_vTexcoord*ratio; // Where I am on the screen with the value adjusted so the width and height of each pixel is the same 
	vec2 pixel_size = 1.0/u_screen; // Where I am on the screen with the value adjusted so the width and height of each pixel is the same 
	
	
	
	// Work out the outer square and each cell inside the square
	vec2 pos_in_pixel = mod(v_vTexcoord,u_pixelsize);				// Little grid
	vec2 pos_in_grid = mod(v_vTexcoord,u_pixelsize*u_squaresize);	// Big grid

	// This normalises the cell space so we can look it up in the grid
	vec2 convert_to_grid = pos_in_grid/u_pixelsize;
	
	
	int my_grid_id = int(floor(convert_to_grid.x) + (floor(convert_to_grid.y)*u_squaresize));
	
	// This is just clamp(0,u_squaresize*u_squaresize) but I cant get that to work
	if (my_grid_id > int(u_squaresize*u_squaresize))	{my_grid_id = int(u_squaresize*u_squaresize);} 
	if (my_grid_id < int(0.0))							{my_grid_id = int(0.0);} 
	
	
	
	// Find the pixel we are looking up (this is my (Dave's) normal HD to Pixel shader)
	vec2 pos_in_world = (u_pixelsize*0.5)+v_vTexcoord-pos_in_grid;	
	vec4 old_colour = v_vColour * texture2D( gm_BaseTexture, pos_in_world );
	
	// This is the brightness of that cell:
	float my_brightness = dot(old_colour.rgb, vec3(0.2126, 0.7152, 0.0722 ));
	// Lookup in the table the brightness needed for the pixel:
	float my_brightness_to_be_above = u_magicsquare[my_grid_id];


	// SELECT THE COLOUR
	if (my_brightness_to_be_above > my_brightness)
	{
		// COLOUR 1
		gl_FragColor = vec4(u_col_1_r,u_col_1_g,u_col_1_b,1.0);
		return;
	}
	else 
	{
		// COLOUR 2
		gl_FragColor = vec4(u_col_2_r,u_col_2_g,u_col_2_b,1.0);
		return;
	}
	

}
