function ff -d "fast config for ffmpeg"
    if [ $argv[1] = compress ]
        ffmpeg -i $argv[2] -vcodec libx265 -crf 28 compressed_$argv[2]
    end
end
