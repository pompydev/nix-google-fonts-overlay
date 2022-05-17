{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "windsong-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/54ae16f51fb15a22536f7e3bf65833f520909b0a/ofl/windsong/WindSong-Regular.ttf?raw=true";
      name = "WindSong-Regular.ttf";
      sha256 = "44bea4f8cdb818e9df6eef5334c63915acb7f1877b239debb373277d16b0aac2";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/54ae16f51fb15a22536f7e3bf65833f520909b0a/ofl/windsong/WindSong-Medium.ttf?raw=true";
      name = "WindSong-Medium.ttf";
      sha256 = "df3525097cb0273f610b87da52399879f87dcce0cbddee08c3e52395108079aa";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 WindSong-Regular.ttf $out/share/fonts/truetype/WindSong-Regular.ttf
     install -Dm644 WindSong-Medium.ttf $out/share/fonts/truetype/WindSong-Medium.ttf
  '';

  meta = with lib; {
    description = "WindSong";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
