# Created by: Tejaswi Kasat
# Version : 0.1
# This will create a lo-fi music video with watermarks

# All import statements
import os
import moviepy.editor as mp
import moviepy.video.fx.all as vfx


# All variables must be declared below
videosPath = "generatedVideos"
gifsPath = "downloadedGifs"
audioPath = "downloadedMusic"
totalTime = 180 # Time in seconds ~3mins

gifNames = os.listdir(gifsPath)
audioNames = os.listdir(audioPath)

for itr in range(0,len(gifNames)):
    try:
        gifPath = gifsPath + "/" + gifNames[itr]
        audioClipPath = audioPath + "/" + audioNames[itr]
        videoClip = mp.VideoFileClip(gifPath)

        # Calculating loops
        duration = videoClip.duration
        numOfLoops = totalTime/duration

        # Setting to Video
        videoClip = videoClip.fx(vfx.loop, n=numOfLoops)    
        audioClip = mp.AudioFileClip(audioClipPath)
        txt_clip = mp.TextClip("chill_music_addiction",fontsize=15,font='DejaVu-Sans-Bold',color='white', bg_color='black')
        txt_clip = txt_clip.set_position(("left","bottom")).set_duration(videoClip.duration)
        final = mp.CompositeVideoClip([videoClip,txt_clip])
        final.audio = audioClip
        final.write_videofile(videosPath+"/"+gifNames[itr]+".mp4",codec = "libx264", fps=30, audio=True, audio_codec='aac')
    except:
        print("***************Some error occurred**********************")
