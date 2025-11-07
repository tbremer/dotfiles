function tomp4
  set rootname (echo "$argv" | sed 's/\.[^.]*$//')
  #echo "argv: $argv; rootname: $rootname.mp4;"
  ffmpeg -i "$argv" "$rootname.mp4"
end
