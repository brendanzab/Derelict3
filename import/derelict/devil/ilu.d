/*

Boost Software License - Version 1.0 - August 17th, 2003

Permission is hereby granted, free of charge, to any person or organization
obtaining a copy of the software and accompanying documentation covered by
this license (the "Software") to use, reproduce, display, distribute,
execute, and transmit the Software, and to prepare derivative works of the
Software, and to permit third-parties to whom the Software is furnished to
do so, all subject to the following:

The copyright notices in the Software and this entire statement, including
the above license grant, this restriction and the following disclaimer,
must be included in all copies of the Software, in whole or in part, and
all derivative works of the Software, unless such copies or derivative
works are solely in the form of machine-executable object code generated by
a source language processor.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE, TITLE AND NON-INFRINGEMENT. IN NO EVENT
SHALL THE COPYRIGHT HOLDERS OR ANYONE DISTRIBUTING THE SOFTWARE BE LIABLE
FOR ANY DAMAGES OR OTHER LIABILITY, WHETHER IN CONTRACT, TORT OR OTHERWISE,
ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
DEALINGS IN THE SOFTWARE.

*/
module derelict.devil.ilu;

private
{
    import derelict.util.loader;
    import derelict.util.system;
    import derelict.devil.types;

    static if(Derelict_OS_Windows)
        enum libNames = "ilu.dll";
    else static if(Derelict_OS_Posix)
        enum libNames = "libILU.so";
    else
        static assert(0, "Need to implement ILU libNames for this operating system.");
}

enum : ILenum
{
    ILU_VERSION_1_7_3=1,
    ILU_VERSION=173,

    ILU_FILTER=0x2600,
    ILU_NEAREST=0x2601,
    ILU_LINEAR=0x2602,
    ILU_BILINEAR=0x2603,
    ILU_SCALE_BOX=0x2604,
    ILU_SCALE_TRIANGLE=0x2605,
    ILU_SCALE_BELL=0x2606,
    ILU_SCALE_BSPLINE=0x2607,
    ILU_SCALE_LANCZOS3=0x2608,
    ILU_SCALE_MITCHELL=0x2609,

    // Error types
    ILU_INVALID_ENUM=0x0501,
    ILU_OUT_OF_MEMORY=0x0502,
    ILU_INTERNAL_ERROR=0x0504,
    ILU_INVALID_VALUE=0x0505,
    ILU_ILLEGAL_OPERATION=0x0506,
    ILU_INVALID_PARAM=0x0509,

    // Values
    ILU_PLACEMENT=0x0700,
    ILU_LOWER_LEFT=0x0701,
    ILU_LOWER_RIGHT=0x0702,
    ILU_UPPER_LEFT=0x0703,
    ILU_UPPER_RIGHT=0x0704,
    ILU_CENTER=0x0705,
    ILU_CONVOLUTION_MATRIX=0x0710,

    ILU_VERSION_NUM=IL_VERSION_NUM,
    ILU_VENDOR=IL_VENDOR,

    // Languages
    ILU_ENGLISH=0x800,
    ILU_ARABIC=0x801,
    ILU_DUTCH=0x802,
    ILU_JAPANESE=0x803,
    ILU_SPANISH=0x804,
}

struct ILinfo
{
    ILuint  Id;                 // the image's id
    ILubyte *Data;              // the image's data
    ILuint  Width;              // the image's width
    ILuint  Height;             // the image's height
    ILuint  Depth;              // the image's depth
    ILubyte Bpp;                // bytes per pixel (not bits) of the image
    ILuint  SizeOfData;         // the total size of the data (in bytes)
    ILenum  Format;             // image format (in IL style)
    ILenum  Type;               // image type (in IL style)
    ILenum  Origin;             // origin of the image
    ILubyte *Palette;           // the image's palette
    ILenum  PalType;            // palette type
    ILuint  PalSize;            // palette size
    ILenum  CubeFlags;          // flags for what cube map sides are present
    ILuint  NumNext;            // number of images following
    ILuint  NumMips;            // number of mipmaps
    ILuint  NumLayers;          // number of layers
}

struct ILpointf
{
    ILfloat x, y;
}

struct ILpointi
{
    ILint x, y;
}

extern(System)
{
    alias nothrow ILboolean function() da_iluAlienify;
    alias nothrow ILboolean function(ILuint) da_iluBlurAvg;
    alias nothrow ILboolean function(ILuint) da_iluBlurGaussian;
    alias nothrow ILboolean function() da_iluBuildMipmaps;
    alias nothrow ILuint function() da_iluColoursUsed;
    alias nothrow ILboolean function(ILuint) da_iluCompareImage;
    alias nothrow ILboolean function(ILfloat) da_iluContrast;
    alias nothrow ILboolean function(ILuint, ILuint, ILuint, ILuint, ILuint, ILuint) da_iluCrop;
    alias nothrow ILvoid function(ILuint) da_iluDeleteImage;
    alias nothrow ILboolean function() da_iluEdgeDetectE;
    alias nothrow ILboolean function() da_iluEdgeDetectP;
    alias nothrow ILboolean function() da_iluEdgeDetectS;
    alias nothrow ILboolean function() da_iluEmboss;
    alias nothrow ILboolean function(ILuint, ILuint, ILuint) da_iluEnlargeCanvas;
    alias nothrow ILboolean function(ILfloat, ILfloat, ILfloat) da_iluEnlargeImage;
    alias nothrow ILboolean function() da_iluEqualize;
    alias nothrow ILconst_string function(ILenum) da_iluErrorString;
    alias nothrow ILboolean function(ILint*, ILint, ILint) da_iluConvolution;
    alias nothrow ILboolean function() da_iluFlipImage;
    alias nothrow ILboolean function(ILfloat) da_iluGammaCorrect;
    alias nothrow ILuint function() da_iluGenImage;
    alias nothrow ILvoid function(ILinfo*) da_iluGetImageInfo;
    alias nothrow ILint function(ILenum) da_iluGetInteger;
    alias nothrow ILvoid function(ILenum, ILint*) da_iluGetIntegerv;
    alias nothrow ILstring function(ILenum) da_iluGetString;
    alias nothrow ILvoid function(ILenum, ILenum) da_iluImageParameter;
    alias nothrow ILvoid function() da_iluInit;
    alias nothrow ILboolean function() da_iluInvertAlpha;
    alias nothrow ILuint function(ILconst_string) da_iluLoadImage;
    alias nothrow ILboolean function() da_iluMirror;
    alias nothrow ILboolean function() da_iluNegative;
    alias nothrow ILboolean function(ILclampf) da_iluNoisify;
    alias nothrow ILboolean function(ILuint) da_iluPixelize;
    alias nothrow ILvoid function(ILpointf*, ILuint) da_iluRegionfv;
    alias nothrow ILvoid function(ILpointi*, ILuint) da_iluRegioniv;
    alias nothrow ILboolean function(ILubyte, ILubyte, ILubyte, ILfloat) da_iluReplaceColour;
    alias nothrow ILboolean function(ILfloat) da_iluRotate;
    alias nothrow ILboolean function(ILfloat, ILfloat, ILfloat, ILfloat) da_iluRotate3D;
    alias nothrow ILboolean function(ILfloat) da_iluSaturate1f;
    alias nothrow ILboolean function(ILfloat, ILfloat, ILfloat, ILfloat) da_iluSaturate4f;
    alias nothrow ILboolean function(ILuint, ILuint, ILuint) da_iluScale;
    alias nothrow ILboolean function(ILfloat, ILfloat, ILfloat) da_iluScaleColours;
    alias nothrow ILboolean function(ILenum) da_iluSetLanguage;
    alias nothrow ILboolean function(ILfloat, ILuint) da_iluSharpen;
    alias nothrow ILboolean function() da_iluSwapColours;
    alias nothrow ILboolean function(ILfloat) da_iluWave;
}

__gshared
{
    da_iluAlienify iluAlienify;
    da_iluBlurAvg iluBlurAvg;
    da_iluBlurGaussian iluBlurGaussian;
    da_iluBuildMipmaps iluBuildMipmaps;
    da_iluColoursUsed iluColoursUsed;
    da_iluCompareImage iluCompareImage;
    da_iluContrast iluContrast;
    da_iluCrop iluCrop;
    da_iluDeleteImage iluDeleteImage;
    da_iluEdgeDetectE iluEdgeDetectE;
    da_iluEdgeDetectP iluEdgeDetectP;
    da_iluEdgeDetectS iluEdgeDetectS;
    da_iluEmboss iluEmboss;
    da_iluEnlargeCanvas iluEnlargeCanvas;
    da_iluEnlargeImage iluEnlargeImage;
    da_iluEqualize iluEqualize;
    da_iluErrorString iluErrorString;
    da_iluConvolution iluConvolution;
    da_iluFlipImage iluFlipImage;
    da_iluGammaCorrect iluGammaCorrect;
    da_iluGenImage iluGenImage;
    da_iluGetImageInfo iluGetImageInfo;
    da_iluGetInteger iluGetInteger;
    da_iluGetIntegerv iluGetIntegerv;
    da_iluGetString iluGetString;
    da_iluImageParameter iluImageParameter;
    da_iluInit iluInit;
    da_iluInvertAlpha iluInvertAlpha;
    da_iluLoadImage iluLoadImage;
    da_iluMirror iluMirror;
    da_iluNegative iluNegative;
    da_iluNoisify iluNoisify;
    da_iluPixelize iluPixelize;
    da_iluRegionfv iluRegionfv;
    da_iluRegioniv iluRegioniv;
    da_iluReplaceColour iluReplaceColour;
    da_iluRotate iluRotate;
    da_iluRotate3D iluRotate3D;
    da_iluSaturate1f iluSaturate1f;
    da_iluSaturate4f iluSaturate4f;
    da_iluScale iluScale;
    da_iluScaleColours iluScaleColours;
    da_iluSetLanguage iluSetLanguage;
    da_iluSharpen iluSharpen;
    da_iluSwapColours iluSwapColours;
    da_iluWave iluWave;

    alias iluColoursUsed    iluColorsUsed;
    alias iluSwapColours    iluSwapColors;
    alias iluReplaceColour  iluReplaceColor;
    alias iluScaleColours  iluScaleColors;
}

class DerelictILULoader : SharedLibLoader
{

    protected
    {
        override void loadSymbols()
        {
            bindFunc(cast(void**)&iluAlienify, "iluAlienify");
            bindFunc(cast(void**)&iluBlurAvg, "iluBlurAvg");
            bindFunc(cast(void**)&iluBlurGaussian, "iluBlurGaussian");
            bindFunc(cast(void**)&iluBuildMipmaps, "iluBuildMipmaps");
            bindFunc(cast(void**)&iluColoursUsed, "iluColoursUsed");
            bindFunc(cast(void**)&iluCompareImage, "iluCompareImage");
            bindFunc(cast(void**)&iluContrast, "iluContrast");
            bindFunc(cast(void**)&iluCrop, "iluCrop");
            bindFunc(cast(void**)&iluDeleteImage, "iluDeleteImage");
            bindFunc(cast(void**)&iluEdgeDetectE, "iluEdgeDetectE");
            bindFunc(cast(void**)&iluEdgeDetectP, "iluEdgeDetectP");
            bindFunc(cast(void**)&iluEdgeDetectS, "iluEdgeDetectS");
            bindFunc(cast(void**)&iluEmboss, "iluEmboss");
            bindFunc(cast(void**)&iluEnlargeCanvas, "iluEnlargeCanvas");
            bindFunc(cast(void**)&iluEnlargeImage, "iluEnlargeImage");
            bindFunc(cast(void**)&iluEqualize, "iluEqualize");
            bindFunc(cast(void**)&iluErrorString, "iluErrorString");
            bindFunc(cast(void**)&iluConvolution, "iluConvolution");
            bindFunc(cast(void**)&iluFlipImage, "iluFlipImage");
            bindFunc(cast(void**)&iluGammaCorrect, "iluGammaCorrect");
            bindFunc(cast(void**)&iluGenImage, "iluGenImage");
            bindFunc(cast(void**)&iluGetImageInfo, "iluGetImageInfo");
            bindFunc(cast(void**)&iluGetInteger, "iluGetInteger");
            bindFunc(cast(void**)&iluGetIntegerv, "iluGetIntegerv");
            bindFunc(cast(void**)&iluGetString, "iluGetString");
            bindFunc(cast(void**)&iluImageParameter, "iluImageParameter");
            bindFunc(cast(void**)&iluInit, "iluInit");
            bindFunc(cast(void**)&iluInvertAlpha, "iluInvertAlpha");
            bindFunc(cast(void**)&iluLoadImage, "iluLoadImage");
            bindFunc(cast(void**)&iluMirror, "iluMirror");
            bindFunc(cast(void**)&iluNegative, "iluNegative");
            bindFunc(cast(void**)&iluNoisify, "iluNoisify");
            bindFunc(cast(void**)&iluPixelize, "iluPixelize");
            bindFunc(cast(void**)&iluRegionfv, "iluRegionfv");
            bindFunc(cast(void**)&iluRegioniv, "iluRegioniv");
            bindFunc(cast(void**)&iluReplaceColour, "iluReplaceColour");
            bindFunc(cast(void**)&iluRotate, "iluRotate");
            bindFunc(cast(void**)&iluRotate3D, "iluRotate3D");
            bindFunc(cast(void**)&iluSaturate1f, "iluSaturate1f");
            bindFunc(cast(void**)&iluSaturate4f, "iluSaturate4f");
            bindFunc(cast(void**)&iluScale, "iluScale");
            bindFunc(cast(void**)&iluScaleColours, "iluScaleColours");
            bindFunc(cast(void**)&iluSetLanguage, "iluSetLanguage");
            bindFunc(cast(void**)&iluSharpen, "iluSharpen");
            bindFunc(cast(void**)&iluSwapColours, "iluSwapColours");
            bindFunc(cast(void**)&iluWave, "iluWave");
        }
    }

    public
    {
        this()
        {
            super(libNames);
        }
    }
}

__gshared DerelictILULoader DerelictILU;

shared static this()
{
    DerelictILU = new DerelictILULoader();
}

shared static ~this()
{
    if(SharedLibLoader.isAutoUnloadEnabled())
        DerelictILU.unload();
}