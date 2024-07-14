function ytplaylist --wraps=yt-dlp
yt-dlp --output '%(playlist_title)s/%(playlist_index)s. %(title)s.%(ext)s' $argv
end
