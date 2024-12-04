varying vec2 v_vTexcoord;
varying vec4 v_vColour;


void main()
{
    vec4 texColor = texture2D(gm_BaseTexture, v_vTexcoord);
    vec4 color = v_vColour * texColor;

    // Invert the colors
    color.rgb = 1.0 - color.rgb;

	vec4 Color = (texture2D( gm_BaseTexture, v_vTexcoord )
	+ texture2D( gm_BaseTexture, v_vTexcoord*0.99+0.5*0.01 )
	+ texture2D( gm_BaseTexture, v_vTexcoord*0.98+0.5*0.02 )
	+ texture2D( gm_BaseTexture, v_vTexcoord*0.97+0.5*0.03 )
	+ texture2D( gm_BaseTexture, v_vTexcoord*0.96+0.5*0.04 )
	+ texture2D( gm_BaseTexture, v_vTexcoord*0.95+0.5*0.05 )
	+ texture2D( gm_BaseTexture, v_vTexcoord*0.94+0.5*0.06 )
	+ texture2D( gm_BaseTexture, v_vTexcoord*0.93+0.5*0.07 )
	+ texture2D( gm_BaseTexture, v_vTexcoord*0.92+0.5*0.08 )
	+ texture2D( gm_BaseTexture, v_vTexcoord*0.91+0.5*0.09 )) * 0.1;
	gl_FragColor =  Color *  v_vColour;
	
}