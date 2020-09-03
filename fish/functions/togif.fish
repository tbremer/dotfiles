function togif
  set rootname (echo "$argv" | sed 's/\.[^.]*$//')


  ffmpeg \
    -i "$argv" \
    -loop 0 \
    -filter_complex "[0:v] fps=16,scale=1200:-1,split [a][b];[a] palettegen [p];[b][p] paletteuse" \
    "$rootname.gif"
end
