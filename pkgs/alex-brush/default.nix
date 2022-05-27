{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "alex-brush-${version}";
  version = "2022-05-23-195233";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/7d87a7969ad5e54086c284c16440389a38cb7eb4/ofl/alexbrush/AlexBrush-Regular.ttf?raw=true";
      name = "AlexBrush-Regular.ttf";
      sha256 = "1bb7e64d0ec2d4c09eaa37feff9d98cb02f8214e0d03eecf4692d2487a518ad1";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 AlexBrush-Regular.ttf $out/share/fonts/truetype/AlexBrush-Regular.ttf
  '';

  meta = with lib; {
    description = "Alex Brush";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
