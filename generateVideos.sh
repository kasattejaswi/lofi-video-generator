#!/bin/bash

# Dependencies
# --------------
# youtube-dl
# ffmpeg
# MoviePy


cleanExistingData(){
	rm -vf generatedVideos/*
	rm -vf downloadedGifs/*
	rm -vf downloadedMusic/*
}


getYoutubeData(){
	# Get audio files
	urlList=`cat ytUrls`


	# For YouTube 
	# -------------------------------------
	# Open downloadedMusic folder

	cd downloadedMusic

	for urlItr in ${urlList}
	do
        	youtube-dl -x --audio-format aac --postprocessor-args "-ss 00:00:00.00 -t 00:03:00.00" ${urlItr}
		echo "Done"
	done

}


getGifsData(){
	# For Gifs
	# -------------------------------------
	cd ..
	gifUrlList=`cat gifUrls`
	
	# Open Gifs folder
	cd downloadedGifs

	for urlItr in ${gifUrlList}
	do
        	echo "Downloading: ${urlItr}"
		name=`uuidgen`
		curl ${urlItr} --output "${name}.gif"
	done
}

generateVideos(){
	cd ..
	python3 lofiVideoCreator.py
}
fname=`uuidgen`
convertToZip(){
	mkdir ${fname}
	zname=`uuidgen`
	zip -r ${fname}/"${zname}.zip" generatedVideos
}


hostFiles(){
	cd ${fname}
	ifconfig | grep 192.168
	echo "Starting server at port 8000"
	python3 -m http.server
}


cleanExistingData
getYoutubeData
getGifsData
generateVideos
convertToZip
hostFiles


