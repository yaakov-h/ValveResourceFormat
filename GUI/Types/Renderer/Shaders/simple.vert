﻿#version 330

//Includes - resolved by VRF
#include "compression.incl"
//End of includes

//Parameter defines - These are default values and can be overwritten based on material/model parameters
#define param_fulltangent 1
//End of parameter defines

in vec3 vPOSITION;
in vec4 vNORMAL;
in vec2 vTEXCOORD;
in vec4 vTANGENT;
in ivec4 vBLENDINDICES;
in vec4 vBLENDWEIGHT;

out vec3 vFragPosition;

out vec3 vNormalOut;
out vec3 vTangentOut;
out vec3 vBitangentOut;

out vec2 vTexCoordOut;

uniform mat4 projection;
uniform mat4 modelview;
uniform mat4 transform;

void main()
{
	gl_Position = projection * modelview * transform * vec4(vPOSITION, 1.0);
	vFragPosition = vPOSITION;

	//Unpack normals
#if param_fulltangent == 1
    vec4 transformedNormal = transpose(inverse(transform)) * vec4(DecompressNormal(vNORMAL), 0.0);
	vNormalOut = transformedNormal.xyz;
#else
    vec4 transformedNormal = transpose(inverse(transform)) * vec4(DecompressNormal(vNORMAL), 0.0);
	vNormalOut = transformedNormal.xyz;
#endif

	vTexCoordOut = vTEXCOORD;
}
