shader_type canvas_item;

float square(in vec2 p, in float s) {
    vec2 d = abs(p) - s;
    return length(max(d, 0.0)) + min(max(d.x, d.y), 0.0);
}

void fragment() {
    vec2 iResolution = vec2(180.0, 200.0); // Set the desired resolution
    vec2 uv = (FRAGCOORD.xy * 2.0 - iResolution.xy) / iResolution.y;
    vec2 uv0 = uv;
    uv *= vec2(0.9, 1.0); // Adjust the scale to fit 180x200

    vec3 col = vec3(0.0); // Initial black color

    for (float i = 1.0; i < 4.0; i++) {
        uv = fract(uv * 2.0) - 0.5;

        float d = square(uv, 1.0);
        d *= length(uv0); // To see the squares, comment this line
        d = cos(d * 8.0 - TIME * i * 0.3);
        d = abs(d);

        // Assign red color with more black emphasis
        col = mix(vec3(1.0, 0.0, 0.0), col, smoothstep(0.2, 0.5, d));
    }

    COLOR = vec4(col, 1.0);
}
