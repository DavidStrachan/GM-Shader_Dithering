/// @description Insert description here



shader_set(shader_fullscreen)

var i = 0
shader_set_uniform_f(shader_params[i++],room_width,room_height)
shader_set_uniform_f(shader_params[i++],(pixelsize/room_width),
										(pixelsize/room_height))
shader_set_uniform_f(shader_params[i++],magic_grid_width)
shader_set_uniform_f_array(shader_params[i++],magic_grid)
shader_set_uniform_f(shader_params[i++],0) // col1
shader_set_uniform_f(shader_params[i++],0) // col1
shader_set_uniform_f(shader_params[i++],0) // col1
shader_set_uniform_f(shader_params[i++],1) // col2
shader_set_uniform_f(shader_params[i++],1) // col2
shader_set_uniform_f(shader_params[i++],1) // col2

draw_surface_stretched(application_surface,0,0,window_get_width(),window_get_height())
shader_reset()





