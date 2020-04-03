# Lofi Video Generator

Want to create a video from a gif file and an youtube music video, this generator is here for you. I will  generate a 3 minute long youtube video with your watermark.

## Requirements

Currently it only supports linux and mac os as the script is written in shell. You need find yourself the alternative to run the script in windows.

* Python 3.6 or greater
* youtube-dl ( pip3 install --upgrade youtube-dl )
* ffmpeg ( sudo apt install ffmpeg )
* moviepy (pip3 install moviepy)
* imagemagick ( https://www.tecmint.com/install-imagemagick-on-debian-ubuntu/ )

## Installation

Go to a specific path and then run the following command from the terminal: 
```
git clone https://github.com/kasattejaswi/lofi-video-generator.git
```

Or alternatively, just download it and extract to a particular folder.

Open the directory and create three folders : 
```
mkdir downloadedGifs
mkdir downloadedMusic
mkdir generatedVideos
```
And thats the configuration required.

## Usage

In order to use it, you need some gif files.
Edit the file gifUrls and paste all the gif urls (One URL in each line)
Edit ytUrls and paste all the YouTube urls (One url in each line)

After all this is done, run the shell script to start making videos:
```
sh generateVideos.sh
```

The process will take some time depending upon the size of youtube videos.

After the process is completed, a python server will be started and will host a zip file which contains all the generated videos. You can type that IP with port 8000 in your mobile if you are on the same wifi network. A webpage will open and download the zip. After dowmloading, extract in your phone and post it on insta, fb wherever you like.

## Modifying values

In order to change video length and watermark details, edit lofiVideoCreator.py and replace
```
totalTime = 180 # Time in seconds ~3mins
watermark = "CHILL_MUSIC_ADDICTION"
```
with your details.


