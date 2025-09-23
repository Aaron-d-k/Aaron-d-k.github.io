mkdir -p stills
rm -f stills/*.pbm
rust-script ising.rs
ffmpeg -framerate 10 -pattern_type glob -i 'stills/*.pbm' -r 15  out.gif ;
mkdir -p ../static/generated-content
cp out.gif ../static/generated-content
rm out.gif
rm stills/*.pbm

