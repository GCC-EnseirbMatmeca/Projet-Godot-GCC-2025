shader_type canvas_item;

uniform vec4 outline_color : source_color;
uniform int active : hint_range(0,1) = 1;


void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	vec4 col = texture(TEXTURE, UV);
	
	if(col.a <= 0.01 && active == 1) //Check if is transparent :
	{
		bool isOutline = false;
		for(int i = -1; i < 2; i++)
		{
			if(isOutline) break;
			for(int j = -1; j < 2; j++)
			{
				if(isOutline) break;
				if(texture(TEXTURE, UV + vec2(float(i),float(j)) * TEXTURE_PIXEL_SIZE).a > 0.01)
				{
					isOutline = true;
				}
			}
		}
		if(isOutline)
		{
			col = vec4(1,1,1,1);
		}
	}
	COLOR = col;
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
