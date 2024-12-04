varying vec2 v_vTexcoord;
varying vec4 v_vColour;


void main()
{
    vec4 texColor = texture2D(gm_BaseTexture, v_vTexcoord);
    vec4 color = v_vColour * texColor;

    // Invert the colors
    color.rgb = 1.0 - color.rgb;

    gl_FragColor = color;
}