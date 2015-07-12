Shader "wiki/Cg shader for RGB cube" { 
   SubShader { 
      Pass { 
         CGPROGRAM 
 
         #pragma vertex vert // vert function is the vertex shader 
         #pragma fragment frag // frag function is the fragment shader
 
         // for multiple vertex output parameters an output structure 
         // is defined:
         struct vertexOutput {
            float4 pos : SV_POSITION;
            float4 col : TEXCOORD0;
         };
 
         vertexOutput vert(float4 vertexPos : POSITION)  // void vert(float4 vertexPos:POSITION, out float4 pos:SV_POSITION, out float4 col:TEXCOORD0)  
         {
            vertexOutput output; // we don't need to type 'struct' here
 
            output.pos =  mul(UNITY_MATRIX_MVP, vertexPos);
            output.col = vertexPos + float4(0.5, 0.5, 0.5, 0.0);
               // Here the vertex shader writes output data
               // to the output structure. We add 0.5 to the 
               // x, y, and z coordinates, because the 
               // coordinates of the cube are between -0.5 and
               // 0.5 but we need them between 0.0 and 1.0. 
            return output;
         }
 
         float4 frag(vertexOutput input) : COLOR  // float4 frag(float4 pos:SV_POSITION, float4 col:TEXCOORD0):COLOR
         {
         	return input.col;
            //return float4((input.col.r + input.col.g + input.col.b)/3,(input.col.r + input.col.g + input.col.b)/3,(input.col.r + input.col.g + input.col.b)/3,1);   // gray value of the same brightness
               // Here the fragment shader returns the "col" input 
               // parameter with semantic TEXCOORD0 as nameless
               // output parameter with semantic COLOR.
         }
 
         ENDCG  
      }
   }
}