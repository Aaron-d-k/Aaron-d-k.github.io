rm stills/*.pbm
rust-script ising.rs
ffmpeg -framerate 10 -pattern_type glob -i 'stills/*.pbm' -r 15  out.gif ;
cp out.gif ../static/generated-content
rm stills/*.pbm

