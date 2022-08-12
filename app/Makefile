generate:
	flutter pub run build_runner watch --delete-conflicting-outputs

release:
	flutter run --release

# FFmpeg Commands for testing

# Video Generation -----------------------------------------------------------------------------------------------------------------------------------------------
noMediaVideo:
	ffmpeg -f lavfi -i color=c=black:s=1280x720:d=5 -f lavfi -i anullsrc=channel_layout=5.1:sample_rate=48000 -t 5 -c:v libx264 -t 5 -pix_fmt yuv420p -vf "drawtext=Arimo.ttf:fontsize=50:fontcolor=white:x=(w-text_w)/2:y=(h+text_h)/2:text='Needs more information',drawtext=fontfile=Arimo.ttf:text='1. Download App':fontcolor=white:fontsize=32:box=1:boxcolor=black@0.7:boxborderw=10:x=20:y=h-th-20,drawtext=fontfile=Arimo.ttf:text='Location\: New York':fontcolor=white:fontsize=40:box=1:boxcolor=black@0.7:boxborderw=10:x=(w-text_w)/2:y=text_h" -y part3.mp4

title:
	ffmpeg -f lavfi -i color=c=black:s=1280x720:d=5  -f lavfi -i anullsrc=channel_layout=5.1:sample_rate=48000 -t 5 -c:v libx264 -t 5 -pix_fmt yuv420p -vf "drawtext=fontfile=Arimo.ttf:fontsize=32:fontcolor=white:x=(w-text_w)/2:y=(h-text_h-text_h-text_h)/2:text='Project',drawtext=Arimo.ttf:fontsize=50:fontcolor=white:x=(w-text_w)/2:y=(h+text_h)/2:text='Scenario'" -y title.mp4

credits:
	ffmpeg -f lavfi -i color=c=black:s=1280x720:d=5  -f lavfi -i anullsrc=channel_layout=5.1:sample_rate=48000 -t 5 -c:v libx264 -t 5 -pix_fmt yuv420p -vf "drawtext=fontfile=Arimo.ttf:fontsize=32:fontcolor=white:x=(w-text_w)/2:y=30:text='Created with the help of the following people\:':line_spacing=20,drawtext=Arimo.ttf:fontsize=50:fontcolor=white:x=(w-text_w)/2:y=(80):textfile=collaborators.txt:line_spacing=20" -y credits.mp4

imageToVideo:
	ffmpeg -r 30 -f image2 -s 1280x720 -loop 1 -i image.jpg -f lavfi -i anullsrc=channel_layout=5.1:sample_rate=48000 -t 5 -c:v libx264 -t 5 -pix_fmt yuv420p -vf "scale=1280:720:force_original_aspect_ratio=decrease,pad=1280:720:(ow-iw)/2:(oh-ih)/2,drawtext=fontfile=Arimo.ttf:text='1. Download App':fontcolor=white:fontsize=32:box=1:boxcolor=black@0.7:boxborderw=10:x=20:y=h-th-20,drawtext=fontfile=Arimo.ttf:text='Location\: New York':fontcolor=white:fontsize=40:box=1:boxcolor=black@0.7:boxborderw=10:x=(w-text_w)/2:y=text_h" -y output.mp4

generateVideo:
	ffmpeg -i part4.mp4 -vf "scale=1280:720:force_original_aspect_ratio=decrease,pad=1280:720:(ow-iw)/2:(oh-ih)/2,drawtext=fontfile=Arimo.ttf:text='1. Download App':fontcolor=white:fontsize=32:box=1:boxcolor=black@0.7:boxborderw=10:x=20:y=h-th-20,drawtext=fontfile=Arimo.ttf:text='Location\: New York':fontcolor=white:fontsize=40:box=1:boxcolor=black@0.7:boxborderw=10:x=(w-text_w)/2:y=text_h" -y out.mp4

# Video Concatenation -----------------------------------------------------------------------------------------------------------------------------------------------
addNoneTransition:
	ffmpeg -i part6.mp4 -i part2.mp4 -filter_complex "[0:v]settb=AVTB,fps=30/1[v0];[1:v]settb=AVTB,fps=30/1[v1];[v0][v1]xfade=transition=fade:duration=1:offset=14.18[outv];[0:a][1:a]acrossfade=duration=1[outa]" -map [outv] -map [outa] -y out.mp4

addTransition:
	ffmpeg -i part1.mp4 -i part2.mp4 -filter_complex "[0:v]settb=AVTB,fps=30/1[v0];[1:v]settb=AVTB,fps=30/1[v1];[v0][v1]xfade=transition=fade:duration=1:offset=14.18[outv];[0:a][1:a]acrossfade=duration=1[outa]" -map [outv] -map [outa] -y out.mp4

generateIntermediate:
	ffmpeg -i part1.mp4 -c copy -y intermediate1.ts

concat:
	ffmpeg -i "concat:intermediate1.ts|intermediate2.ts" -y out.mp4

# Gif Generation -----------------------------------------------------------------------------------------------------------------------------------------------
fadeGif:
	ffmpeg -f lavfi -i "color=c=gray:s=180x136:r=15:d=2,format=rgb24,drawtext=text='fade':x=(w-text_w)/2:y=(h-text_h)/2:box=1:boxborderw=4:boxcolor=white:fontfile=Arimo.ttf:fontsize=20" -f lavfi -i "color=c=lightgrey:s=180x136:r=15:d=2,format=rgb24,drawtext=text='fade':x=(w-text_w)/2:y=(h-text_h)/2:box=1:boxborderw=4:boxcolor=white:fontfile=Arimo.ttf:fontsize=20" -filter_complex "[0][1]xfade=duration=1:offset=1:transition=fade,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" -y fade.gif

dissolveGif:
	ffmpeg -f lavfi -i "color=c=gray:s=180x136:r=15:d=2,format=rgb24,drawtext=text='dissolve':x=(w-text_w)/2:y=(h-text_h)/2:box=1:boxborderw=4:boxcolor=white:fontfile=Arimo.ttf:fontsize=20" -f lavfi -i "color=c=lightgrey:s=180x136:r=15:d=2,format=rgb24,drawtext=text='dissolve':x=(w-text_w)/2:y=(h-text_h)/2:box=1:boxborderw=4:boxcolor=white:fontfile=Arimo.ttf:fontsize=20" -filter_complex "[0][1]xfade=duration=1:offset=1:transition=dissolve,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" -y dissolve.gif

hblurGif:
	ffmpeg -f lavfi -i "color=c=gray:s=180x136:r=15:d=2,format=rgb24,drawtext=text='hblur':x=(w-text_w)/2:y=(h-text_h)/2:box=1:boxborderw=4:boxcolor=white:fontfile=Arimo.ttf:fontsize=20" -f lavfi -i "color=c=lightgrey:s=180x136:r=15:d=2,format=rgb24,drawtext=text='hblur':x=(w-text_w)/2:y=(h-text_h)/2:box=1:boxborderw=4:boxcolor=white:fontfile=Arimo.ttf:fontsize=20" -filter_complex "[0][1]xfade=duration=1:offset=1:transition=hblur,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" -y hblur.gif

noneGif:
	ffmpeg -f lavfi -i "color=c=gray:s=180x136:r=15:d=2,format=rgb24,drawtext=text='none':x=(w-text_w)/2:y=(h-text_h)/2:box=1:boxborderw=4:boxcolor=white:fontfile=Arimo.ttf:fontsize=20" -f lavfi -i "color=c=lightgrey:s=180x136:r=15:d=2,format=rgb24,drawtext=text='none':x=(w-text_w)/2:y=(h-text_h)/2:box=1:boxborderw=4:boxcolor=white:fontfile=Arimo.ttf:fontsize=20" -filter_complex "[0][1]xfade=duration=0:offset=1:transition=fade,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" -y none.gif

# Audio Mixing -----------------------------------------------------------------------------------------------------------------------------------------------
bufferToAudio:
	ffmpeg -i audio.aac -af "apad=pad_dur='5'" -y out.aac

replaceAudio:
	ffmpeg -i part1.mp4 -i audio.aac -filter_complex " [1:0] apad " -shortest -y part6.mp4

audioToVideo:
	ffmpeg -i sample.mp4 -i out.aac -filter_complex "[0:a][1:a]amerge=inputs=2[a]" -map 0:v -map "[a]" -c:v copy -ac 2 -y out.mp4

# Other Commands -----------------------------------------------------------------------------------------------------------------------------------------------
getDuration:
	ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 part1.mp4

addText:
	ffmpeg -i sample.mp4 -vf "drawtext=fontfile=Arimo.ttf:text='1. Download App':fontcolor=white:fontsize=50:box=1:boxcolor=black@0.7:boxborderw=20:x=20:y=h-th-20,drawtext=fontfile=Arimo.ttf:text='Location\: New York':fontcolor=white:fontsize=60:box=1:boxcolor=black@0.7:boxborderw=20:x=(w-text_w)/2:y=text_h" -y out.mp4
