Shader "unityCookie/tut/beginner/1 - Flat Color" {
	Properties {
		_Color ("Color", Color) = (1.0,1.0,1.0,1.0)
	}
	SubShader {
		Pass {
			CGPROGRAM

			#pragma vertex vert
			#pragma fragment frag

			uniform float4 _Color;

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