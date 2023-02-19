//=======================================================================================================
// MultiLut - Reborn by FoG
// Version - 1.0
// Based on Marty's LUT Shader - Otis Remaster of it - and lastly marots gshade version.
//=======================================================================================================
// Includes - Defines
//=======================================================================================================

#define MultiLUTRebornTexture_Source 1

#ifndef LUTOneTileSize
    #define LUTOneTileSize 32
#endif

#ifndef LUTOneTileAmount
    #define LUTOneTileAmount 32
#endif

#ifndef LUTOneAmount
    #define LUTOneAmount 17
#endif

#ifndef LUTOneSource
    #define LUTOneSource "MultiLUTReborn_AtlasOne.png"
#endif

#ifndef LUTTwoTileSize
    #define LUTTwoTileSize 32
#endif 

#ifndef LUTTwoTileAmount
    #define LUTTwoTileAmount 32
#endif

#ifndef LUTTwoAmount
    #define LUTTwoAmount 17
#endif

#ifndef LUTTwoSource 
    #define LUTTwoSource "MultiLUTReborn_AtlasTwo.png"
#endif

#ifndef LUTThreeTileSize
    #define LUTThreeTileSize 32
#endif

#ifndef LUTThreeTileAmount
    #define LUTThreeTileAmount 32
#endif

#ifndef LUTThreeAmount
    #define LUTThreeAmount 17
#endif

#ifndef LUTThreeSource 
    #define LUTThreeSource "MultiLUTReborn_AtlasThree.png"
#endif

#ifndef MultiLUTRebornPassTwo
    #define MultiLUTRebornPassTwo 0
#endif 

#if MultiLUTRebornPassTwo
    #define MultiLUTRebornTextureTwo_Source 1
#endif

#ifndef MultiLUTRebornPassThree
    #define MultiLUTRebornPassThree 0
#endif

#if MultiLUTRebornPassThree
    #define MultiLUTRebornTextureThree_Source 1
#endif

#define LUTReborn_FileList "Atlas One\0Atlas Two\0Atlas Three\0"
#define LUTReborn_Selections "Color0 (Usually Neutral)\0Color1\0Color2\0Color3\0Color4\0Color5\0Color6\0Color7\0Color8\0Color9\0Color10\0Color11\0Color12\0Color13\0Color14\0Color15\0Color16\0Color17\0"

#include "ReShade.fxh"

//=======================================================================================================
// Settings
//=======================================================================================================

uniform int LUTReborn_FileSelector <
    ui_category = "Pass One";
    ui_type = "combo";
    ui_items = LUTReborn_FileList;
    ui_label = "The MultiLUTReborn file to use.";
    ui_tooltip = "Select a MultiLUTReborn Atlas file.";
    ui_bind = "MultiLUTRebornTexture_Source";
> = 0;

uniform int LUTReborn_LUTSelector <
    ui_category = "Pass One";
    ui_type = "combo";
    ui_items = LUTReborn_Selections;
    ui_label = "LUT to use.";
    ui_tooltip = "LUT to use for color transformation.";
> = 0;

uniform float LUTReborn_Intensity <
    ui_category = "Pass One";
    ui_type = "slider";
    ui_label = "LUT Intensity";
    ui_tooltip = "Overall intesnity of the LUT effect.";
    ui_min = 0.00; ui_max = 1.00;
> = 1.00;

uniform float LUTReborn_Chroma <
    ui_category = "Pass One";
    ui_type = "slider";
    ui_label = "LUT Chroma Amount";
    ui_tooltip = "Intensity of color/chroma change of the LUT.";
    ui_min = 0.00; ui_max = 1.00;
> = 1.00;

uniform float LUTReborn_Luma <
    ui_category = "Pass One";
    ui_type = "slider";
    ui_label = "LUT Luma Amount";
    ui_tooltip = "Intensity of luma change of the LUT.";
    ui_min = 0.00; ui_max = 1.00;
> = 1.00;

#if MultiLUTRebornPassTwo
    uniform int LUTReborn_FileSelectorTwo <
        ui_category = "Pass Two";
        ui_type = "combo";
        ui_items = LUTReborn_FileList;
        ui_label = "The MultiLUTReborn file to use.";
        ui_tooltip = "Select a MultiLUTReborn Atlas file to use on Pass Two.";
        ui_bind = "MultiLUTRebornTextureTwo_Source";
    > = 1;

    uniform int LUTReborn_LUTSelectorTwo <
        ui_category = "Pass Two";
        ui_type = "combo";
        ui_items = LUTReborn_Selections;
        ui_label = "LUT to use.";
        ui_tooltip = "LUT to use for color transformation on Pass Two";
    > = 0;

    uniform float LUTReborn_IntensityTwo <
        ui_category = "Pass Two";
        ui_type = "slider";
        ui_label = "LUT Intensity";
        ui_tooltip = "Overall intensity of the LUT effect.";
        ui_min = 0.00; ui_max = 1.00;
    > = 1.00;

    uniform float LUTReborn_ChromaTwo <
        ui_category = "Pass Two";
        ui_type = "slider";
        ui_label = "LUT Chroma Amount";
        ui_tooltip = "Intensity of color/chroma change of the LUT.";
        ui_min = 0.00; ui_max = 1.00;
    > = 1.0;

    uniform float LUTReborn_LumaTwo <
        ui_category = "Pass Two";
        ui_type = "slider";
        ui_label = "LUT Luma Amount";
        ui_tooltip = "Intensity of luma change of the LUT.";
        ui_min = 0.00; ui_max = 1.00;
    > = 1.0;
#endif

#if MultiLUTRebornPassThree
    uniform int LUTReborn_FileSelectorThree <
        ui_category = "Pass Three";
        ui_type = "combo";
        ui_items = LUTReborn_FileList;
        ui_label = "The MultiLUT file to use.";
        ui_tooltip = "Select a MultiLUTReborn Atlas file to use on Pass Three.";
        ui_bind = "MultiLUTRebornTextureThree_Source";
    > = 1;

    uniform int LUTReborn_LUTSelectorThree <
        ui_category = "Pass Three";
        ui_type = "combo";
        ui_items = LUTReborn_Selections;
        ui_label = "LUT to use.";
        ui_tooltip = "LUT to use for color transformation on Pass Three";
    > = 0;

    uniform float LUTReborn_IntensityThree <
        ui_category = "Pass Three";
        ui_type = "slider";
        ui_label = "LUT Intensity";
        ui_tooltip = "Overall intensity of the LUT effect.";
        ui_min = 0.00; ui_max = 1.00;
    > = 1.00;

    uniform float LUTReborn_ChromaThree <
        ui_category = "Pass Three";
        ui_type = "slider";
        ui_label = "LUT Chroma Amount";
        ui_tooltip = "Intensity of color/chroma change of the LUT.";
        ui_min = 0.00; ui_max = 1.00;
    > = 1.00;

    uniform float LUTReborn_LumaThree <
        ui_category = "Pass Three";
        ui_type = "slider";
        ui_label = "LUT Luma Amount";
        ui_tooltip = "Intensity of luma change of the LUT.";
        ui_min = 0.00; ui_max = 1.00;
    > = 1.00;
#endif

//=======================================================================================================
// Finishing Defines
//=======================================================================================================

#if MultiLUTReborn_Dither
    #include "TriDither.fxh"
#endif

#if MultiLUTRebornTexture_Source == 0
    #define MultiLUTRebornTexture_SourceFile LUTOneSource
    #define MultiLUTRebornTexture_SourceTileSize LUTOneTileSize
    #define MultiLUTRebornTexture_SourceTileAmount LUTOneTileAmount
    #define MultiLUTRebornTexture_SourceAmount LUTOneAmount
#elif MultiLUTRebornTexture_Source == 1
    #define MultiLUTRebornTexture_SourceFile LUTTwoSource
    #define MultiLUTRebornTexture_SourceTileSize LUTTwoTileSize
    #define MultiLUTRebornTexture_SourceTileAmount LUTTwoTileAmount
    #define MultiLUTRebornTexture_SourceAmount LUTTwoAmount
#elif MultiLUTRebornTexture_Source == 2
    #define MultiLUTRebornTexture_SourceFile LUTThreeSource
    #define MultiLUTRebornTexture_SourceTileSize LUTThreeTileSize
    #define MultiLUTRebornTexture_SourceTileAmount LUTThreeTileAmount
    #define MultiLUTRebornTexture_SourceAmount LUTThreeAmount
#endif

#if MultiLUTRebornTextureTwo_Source == 0
    #define MultiLUTRebornTextureTwo_SourceFile LUTOneSource
    #define MultiLUTRebornTextureTwo_SourceTileSize LUTOneTileSize
    #define MultiLUTRebornTextureTwo_SourceTileAmount LUTOneTileAmount
    #define MultiLUTRebornTextureTwo_SourceAmount LUTOneAmount
#elif MultiLUTRebornTextureTwo_Source == 1
    #define MultiLUTRebornTextureTwo_SourceFile LUTTwoSource
    #define MultiLUTRebornTextureTwo_SourceTileSize LUTTwoTileSize
    #define MultiLUTRebornTextureTwo_SourceTileAmount LUTTwoTileAmount
    #define MultiLUTRebornTextureTwo_SourceAmount LUTTwoAmount
#elif MultiLUTRebornTextureTwo_Source == 2
    #define MultiLUTRebornTextureTwo_SourceFile LUTThreeSource
    #define MultiLUTRebornTextureTwo_SourceTileSize LUTThreeTileSize
    #define MultiLUTRebornTextureTwo_SourceTileAmount LUTThreeTileAmount
    #define MultiLUTRebornTextureTwo_SourceAmount LUTThreeAmount
#endif

#if MultiLUTRebornTextureThree_Source == 0
    #define MultiLUTRebornTextureThree_SourceFile LUTOneSource
    #define MultiLUTRebornTextureThree_SourceTileSize LUTOneTileSize
    #define MultiLUTRebornTextureThree_SourceTileAmount LUTOneTileAmount
    #define MultiLUTRebornTextureThree_SourceAmount LUTOneAmount
#elif MultiLUTRebornTextureThree_Source == 1
    #define MultiLUTRebornTextureThree_SourceFile LUTTwoSource
    #define MultiLUTRebornTextureThree_SourceTileSize LUTTwoTileSize
    #define MultiLUTRebornTextureThree_SourceTileAmount LUTTwoTileAmount
    #define MultiLUTRebornTextureThree_SourceAmount LUTTwoAmount
#elif MultiLUTRebornTextureThree_Source == 2
    #define MultiLUTRebornTextureThree_SourceFile LUTThreeSource
    #define MultiLUTRebornTextureThree_SourceTileSize LUTThreeTileSize
    #define MultiLUTRebornTextureThree_SourceTileAmount LUTThreeTileAmount
    #define MultiLUTRebornTextureThree_SourceAmount LUTThreeAmount
#endif

//=======================================================================================================
// Samplers - Textures
//=======================================================================================================

texture texMultiLUTReborn < source = MultiLUTRebornTexture_SourceFile; > { Width = MultiLUTRebornTexture_SourceTileSize * MultiLUTRebornTexture_SourceTileAmount; Height = MultiLUTRebornTexture_SourceTileSize * MultiLUTRebornTexture_SourceAmount; Format = RGBA8; };
sampler SamplerMultiLUTReborn { Texture = texMultiLUTReborn; };

#if MultiLUTRebornPassTwo
    texture texMultiLUTRebornTwo < source = MultiLUTRebornTextureTwo_SourceFile; > { Width = MultiLUTRebornTextureTwo_SourceTileSize * MultiLUTRebornTextureTwo_SourceTileAmount; Height = MultiLUTRebornTextureTwo_SourceTileSize * MultiLUTRebornTextureTwo_SourceAmount; Format = RGBA8; };
    sampler SamplerMultiLUTRebornTwo { Texture = texMultiLUTRebornTwo; };
#endif

#if MultiLUTRebornPassThree
    texture texMultiLUTRebornThree <source = MultiLUTRebornTextureThree_SourceFile; > { Width = MultiLUTRebornTextureThree_SourceTileSize * MultiLUTRebornTextureThree_SourceTileAmount; Height = MultiLUTRebornTextureThree_SourceTileSize * MultiLUTRebornTextureThree_SourceAmount; Format = RGBA8; };
    sampler SamplerMultiLUTRebornThree { Texture = texMultiLUTRebornThree; };
#endif

//=======================================================================================================
// Functions
//=======================================================================================================
float3 apply(in const float3 color, in const int tex, in const float lut) {
    const float2 texelsize = 1.0 / float2(MultiLUTRebornTexture_SourceTileSize * MultiLUTRebornTexture_SourceTileAmount, MultiLUTRebornTexture_SourceTileSize);
    float3 lutcoord = float3((color.xy * MultiLUTRebornTexture_SourceTileSize - color.xy + 0.5) * texelsize, (color.z * MultiLUTRebornTexture_SourceTileSize - color.z));

    const float lerpfact = frac(lutcoord.z);
    lutcoord.x += (lutcoord.z - lerpfact) * texelsize.y;
    lutcoord.y = lut / MultiLUTRebornTexture_SourceAmount + lutcoord.y / MultiLUTRebornTexture_SourceAmount;

    return lerp(tex2D(SamplerMultiLUTReborn, lutcoord.xy).xyz, tex2D(SamplerMultiLUTReborn, float2(lutcoord.x + texelsize.y, lutcoord.y)).xyz, lerpfact);
}
#if MultiLUTRebornPassTwo
    float3 applytwo(in const float3 color, in const int tex, in const float lut) {
        const float2 texelsize = 1.0 / float2(MultiLUTRebornTextureTwo_SourceTileSize * MultiLUTRebornTextureTwo_SourceTileAmount, MultiLUTRebornTextureTwo_SourceTileSize);
        float3 lutcoord = float3((color.xy * MultiLUTRebornTextureTwo_SourceTileSize - color.xy + 0.5) * texelsize, (color.z * MultiLUTRebornTextureTwo_SourceTileSize - color.z));

        const float lerpfact = frac(lutcoord.z);
        lutcoord.x += (lutcoord.z - lerpfact) * texelsize.y;
        lutcoord.y = lut / MultiLUTRebornTextureTwo_SourceAmount + lutcoord.y / MultiLUTRebornTextureTwo_SourceAmount;

        return lerp(tex2D(SamplerMultiLUTRebornTwo, lutcoord.xy).xyz, tex2D(SamplerMultiLUTRebornTwo, float2(lutcoord.x + texelsize.y, lutcoord.y)).xyz, lerpfact);
    }
#endif

#if MultiLUTRebornPassThree
    float3 applythree(in const float3 color, in const int tex, in const float lut) {
        const float2 texelsize = 1.0 / float2(MultiLUTRebornTextureThree_SourceTileSize * MultiLUTRebornTextureThree_SourceTileAmount, MultiLUTRebornTextureThree_SourceTileSize);
        float3 lutcoord = float3((color.xy * MultiLUTRebornTextureThree_SourceTileSize - color.xy + 0.5) * texelsize, (color.z * MultiLUTRebornTextureThree_SourceTileSize - color.z));
        
        const float lerpfact = frac(lutcoord.z);
        lutcoord.x += (lutcoord.z - lerpfact) * texelsize.y;
        lutcoord.y = lut / MultiLUTRebornTextureThree_SourceAmount + lutcoord.y / MultiLUTRebornTextureThree_SourceAmount;

        return lerp(tex2D(SamplerMultiLUTRebornThree, lutcoord.xy).xyz, tex2D(SamplerMultiLUTRebornThree, float2(lutcoord.x + texelsize.y, lutcoord.y)).xyz, lerpfact);
    }
#endif

void PS_MultiLUTReborn_Apply(float4 vpos : SV_Position, float2 texcoord : TEXCOORD, out float3 res : SV_Target) {
    const float3 color = tex2D(ReShade::BackBuffer, texcoord).xyz;

    #if !MultiLUTRebornPassTwo && !MultiLUTRebornPassThree
        const float3 lutcolor = lerp(color, apply(color, LUTReborn_FileSelector, LUTReborn_LUTSelector), LUTReborn_Intensity);
    #else
        float3 lutcolor = lerp(color, apply(color, LUTReborn_FileSelector, LUTReborn_LUTSelector), LUTReborn_Intensity);
    #endif

    res = lerp(normalize(color), normalize(lutcolor), LUTReborn_Chroma) * lerp(length(color), length(lutcolor), LUTReborn_Luma);

    #if MultiLUTRebornPassTwo
        res = saturate(res);
        lutcolor = lerp(res, applytwo(res, LUTReborn_FileSelectorTwo, LUTReborn_LUTSelectorTwo), LUTReborn_IntensityTwo);

        res = lerp(normalize(res), normalize(lutcolor), LUTReborn_ChromaTwo) * lerp(length(res), length(lutcolor), LUTReborn_LumaTwo);
    #endif

    #if MultiLUTRebornPassThree
        res = saturate(res);
        lutcolor = lerp(res, applythree(res, LUTReborn_FileSelectorThree, LUTReborn_LUTSelectorThree), LUTReborn_IntensityThree);

        res = lerp(normalize(res), normalize(lutcolor), LUTReborn_ChromaThree) * lerp(length(res), length(lutcolor), LUTReborn_LumaThree);
    #endif

    #if MultiLUTReborn_Dither
        res += TriDither(res, texcoord, BUFFER_COLOR_BIT_DEPTH);
    #endif
}
//=======================================================================================================
// Techniques
//=======================================================================================================

technique MultiLUTReborn
{
    pass MultiLUTReborn_Apply
    {
        VertexShader = PostProcessVS;
        PixelShader = PS_MultiLUTReborn_Apply;
    }
}