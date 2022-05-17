{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "tiro-telugu-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/8b6e3db5736ada990c57b751491ddee929841921/ofl/tirotelugu/TiroTelugu-Regular.ttf?raw=true";
      name = "TiroTelugu-Regular.ttf";
      sha256 = "029e73df7459cc316ef252fddbaf1312d62d6392b9292e96ed83958a679d3eff";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/8b6e3db5736ada990c57b751491ddee929841921/ofl/tirotelugu/TiroTelugu-Italic.ttf?raw=true";
      name = "TiroTelugu-Italic.ttf";
      sha256 = "7429c5a86260a7c1d893c5380bf9ee326fffe21591441cbaade94448b4f2fb9e";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 TiroTelugu-Regular.ttf $out/share/fonts/truetype/TiroTelugu-Regular.ttf
     install -Dm644 TiroTelugu-Italic.ttf $out/share/fonts/truetype/TiroTelugu-Italic.ttf
  '';

  meta = with lib; {
    description = "Tiro Telugu";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
