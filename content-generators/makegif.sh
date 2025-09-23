mkdir -p stills
rm -f stills/*.pbm
rust-script ising.rs
ffmpeg -framerate 10 -pattern_type glob -i 'stills/*.pbm' -r 15  ising.gif ;
mkdir -p ../static/generated-content
cp ising.gif ../static/generated-content
rm ising.gif
rm stills/*.pbm

