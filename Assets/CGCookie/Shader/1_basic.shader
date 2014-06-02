Shader "koala/cgcookie/ 1_basic" {
	Properties {
		_Color ("Color", Color) = (1.0,1.0,1.0,1.0)
	}
	SubShader {
        //  - 表面着色器或
        //  - 顶点和程序着色器，或
        //  - 固定功能着色器

		Pass {
			CGPROGRAM

			#pragma vertex vert
			#pragma fragment frag
			
			//user defined variables
			uniform float4 _Color;
			
			//base input structs
			struct vertexInput{
				float4 vertex : POSITION;
			};
			struct vertexOutput{
				float4 pos : SV_POSITION;
			};
			
			//vertex function
			vertexOutput vert(vertexInput v){
				vertexOutput o;
				o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
				return o;
			}
			
			//fragment function
			float4 frag(vertexOutput i) : COLOR
			{
				return _Color;
			}
			
			ENDCG
		}
	}
	//fallback commented out during development
	//Fallback "Diffuse"
}