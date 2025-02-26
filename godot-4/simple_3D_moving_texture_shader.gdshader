shader_type spatial;
//render_mode unshaded; // To achieve a look without lights and shadows, just delete the two slashes at the start of the code.

uniform vec2 direction_and_speed = vec2(0.01, 0.00);
uniform vec2 scale = vec2(1.0);
uniform bool flip = false;
uniform float transparency : hint_range(0, 1) = 1;
uniform sampler2D albedo: source_color, filter_linear; // To achieve a pixel art look, change from filter_linear to filter_nearest.

void fragment() {
	vec2 uv = UV * scale - direction_and_speed * TIME;
	if (flip) { uv = 1.0 - uv; }
	ALPHA = transparency;
	ALBEDO = texture(albedo, uv).rgb;
}