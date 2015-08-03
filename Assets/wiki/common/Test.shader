﻿Shader "wiki/Test" {
   SubShader {
      Tags { "Queue" = "Transparent" } 
         // draw after all opaque geometry has been drawn
      Pass { 
         Cull Off // draw front and back faces
         ZWrite Off // don't write to depth buffer 
            // in order not to occlude other objects
         //Blend Zero SrcAlpha // multiplicative blending 
            // for attenuation by the fragment's alpha

         //Blend SrcAlpha OneMinusSrcAlpha // use alpha blending

         CGPROGRAM 
 
         #pragma vertex vert 
         #pragma fragment frag
 
         float4 vert(float4 vertexPos : POSITION) : SV_POSITION 
         {
            return mul(UNITY_MATRIX_MVP, vertexPos);
         }
 
         float4 frag(void) : COLOR 
         {
            return float4(0.3, 0.0, 0.0, 0.09);
         }

         ENDCG
      }
   }
}