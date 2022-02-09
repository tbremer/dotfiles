function jpg-compress
	set rootname (echo "$argv" | sed 's/\.[^.]*$//')
	magick "$argv" -strip -interlace Plane -gaussian-blur 0.05 -quality 85% "$rootname-compressed.jpg"
end
