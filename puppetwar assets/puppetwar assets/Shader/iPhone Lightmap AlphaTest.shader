//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "iPhone/Lightmap/Lightmap AlphaTest" {
Properties {
 _Color ("Main Color", Color) = (1,1,1,1)
 _MainTex ("Base (RGB)", 2D) = "white" {}
 _LightMap ("Lightmap (RGB)", 2D) = "white" {}
 _Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
}
SubShader { 
 Pass {
  Name "BASE"
  BindChannels {
   Bind "vertex", Vertex
   Bind "texcoord1", TexCoord0
   Bind "texcoord", TexCoord1
  }
  AlphaTest Greater [_Cutoff]
  SetTexture [_LightMap] { combine texture }
  SetTexture [_MainTex] { combine texture * previous, texture alpha }
 }
}
}