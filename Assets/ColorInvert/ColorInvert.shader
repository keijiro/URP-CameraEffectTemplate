Shader "Hidden/URPCameraEffect/ColorInvert"
{
HLSLINCLUDE

#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
#include "Packages/com.unity.render-pipelines.core/Runtime/Utilities/Blit.hlsl"

half _Opacity;

half4 Frag(Varyings input) : SV_Target
{
    half2 uv = input.texcoord;
    half4 src = SAMPLE_TEXTURE2D_X(_BlitTexture, sampler_LinearClamp, uv);
    half4 inv = half4(SRGBToLinear(1 - LinearToSRGB(src.rgb)), src.a);
    return lerp(src, inv, _Opacity);
}

ENDHLSL

    SubShader
    {
        Tags { "RenderPipeline"="UniversalPipeline" "RenderType"="Opaque" }
        Pass
        {
            Name "ColorInvert"
            ZTest Always ZWrite Off Cull Off
            HLSLPROGRAM
            #pragma vertex Vert
            #pragma fragment Frag
            ENDHLSL
        }
    }
}
