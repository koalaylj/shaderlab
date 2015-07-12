Shader "wiki/Cg shader with all built-in vertex input parameters" { 
   SubShader { 
      Pass { 
         CGPROGRAM 
 
         #pragma vertex vert  
         #pragma fragment frag 
         #include "UnityCG.cginc"

         // struct vertexInput {
         //    float4 vertex : POSITION;
         //    float4 tangent : TANGENT;  
         //    float3 normal : NORMAL;
         //    float4 texcoord : TEXCOORD0;  
         //    float4 texcoord1 : TEXCOORD1; 
         //    fixed4 color : COLOR; 
         // };

         struct vertexOutput {
            float4 pos : SV_POSITION;
            float4 col : TEXCOORD0;
         };
 
         vertexOutput vert(appdata_full input) 
         {
            vertexOutput output;
 
            output.pos =  mul(UNITY_MATRIX_MVP, input.vertex);
            output.col = input.texcoord; // set the output color
            //output.col = float4(input.texcoord.x, 0.0, 0.0, 1.0);
            //output.col = float4((input.normal + float3(1.0, 1.0, 1.0)) / 2.0, 1.0);
            //output.col = input.texcoord - float4(1.5, 2.3, 1.1, 1.0);
            //output.col = radians(input.texcoord);
            
            // other possibilities to play with:

            // output.col = input.vertex;
            // output.col = input.tangent;
            // output.col = float4(input.normal, 1.0);
            // output.col = input.texcoord;
            // output.col = input.texcoord1;
            // output.col = input.color;

            return output;
         }
 
         float4 frag(vertexOutput input) : COLOR 
         {
            return input.col; 
         }
 
         ENDCG  
      }
   }
}