{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "twinkle-star-${version}";
  version = "2022-05-23-231859";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b3920ce98d80868d10d21cdd8d488e7cba30be97/ofl/twinklestar/TwinkleStar-Regular.ttf?raw=true";
      name = "TwinkleStar-Regular.ttf";
      sha256 = "fa38cff73e64d3da161a857cdc3babfb8427149356cb61f40a17310261652604";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 TwinkleStar-Regular.ttf $out/share/fonts/truetype/TwinkleStar-Regular.ttf
  '';

  meta = with lib; {
    description = "Twinkle Star";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
