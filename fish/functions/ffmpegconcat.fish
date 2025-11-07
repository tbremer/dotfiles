function ffmpegconcat
  set -l inputdir (ls $argv)
  set str

  for file in $inputdir
    set str "$str
file '$argv$file'"
  end

  read -P "Destination of file: " out
  echo "$str" | ffmpeg \
    -f concat \
    -safe 0 \
    -protocol_whitelist "file,http,https,tcp,tls,pipe" \
    -i pipe: \
    -c copy "$out"
end
