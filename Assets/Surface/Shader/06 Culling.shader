Shader "koala/surface/06 Culling Inside" {
    Properties {
        _Color ("Main Color", Color) = (1,1,1,0)
        _SpecColor ("Spec Color", Color) = (1,1,1,1)
        _Emission ("Emmisive Color", Color) = (0,0,0,0)
        _Shininess ("Shininess", Range (0.01, 1)) = 0.7
        _MainTex ("Base (RGB)", 2D) = "white" { }
    }

    SubShader {
        // 我们通过在子着色器中定义材质以便在多个通道中使用。
        // 此处定义材质对于所有包含的通道都采用默认值。
        Material {
            Diffuse [_Color]
            Ambient [_Color]
            Shininess [_Shininess]
            Specular [_SpecColor]
            Emission [_Emission]
        }
        Lighting On
        SeparateSpecular On

        // 设置 alpha 混合
        Blend SrcAlpha OneMinusSrcAlpha

        //渲染对象的背面部分。
        //如果对象为凸面体，这些背面部分总是比正面
        //更为深远。
        Pass {
            Cull Front
            SetTexture [_MainTex] {
                Combine Primary * Texture
            }
        }
        //渲染对象面对我们的那部分。
        //如果对象为凸面体，则正面部分要比
        //背面更靠近。
        Pass {
            Cull Back
            SetTexture [_MainTex] {
                Combine Primary * Texture
            }
        }
    }
} 