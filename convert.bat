cd /d %~d0
cd %~dp0

for %%f in (%*) do (
  md "%%~dpfoutput"
  %~dp0ffmpeg/bin/ffmpeg.exe -i "%%~f" -vf lut3d=DLog-M_to_Rec709.cube:interp=tetrahedral,scale=out_color_matrix=bt709 -pix_fmt yuv420p -c:a copy "%%~dpfoutput\%%~nxf"
)