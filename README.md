# MultiLUTReborn

A "reshade-ified" variant of g-shades MultiLut Shader - includes things such as multiple passes and different LUT files.

## Differences

Since this is not the g-shade variant, things work a little differently, and this will not be "plug and play" for any g-shade preset.    
For preset creators, you have 3 atlas files to create, each with modifiably Tile Size, Tile Amount, and LUT Amounts, naming scheme is as follows:    
`MultiLUTReborn_AtlasOne.png`, `MultiLUTReborn_AtlasTwo.png` and `MultiLUTReborn_AtlasThree.png` these can be changed in the preprocessor definitions.
In this repository these three images will be exactly the same. When creating presets, make sure to add your own LUT files.
