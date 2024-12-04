attribute vec4 in_Position;
attribute vec2 in_Texcoord;
attribute vec4 in_Colour;

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * in_Position;
    v_vTexcoord = in_Texcoord;
    v_vColour = in_Colour;
	
}
