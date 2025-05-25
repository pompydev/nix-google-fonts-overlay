{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "windsong-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/windsong/WindSong-Regular.ttf?raw=true";
      name = "WindSong-Regular.ttf";
      sha256 = "44bea4f8cdb818e9df6eef5334c63915acb7f1877b239debb373277d16b0aac2";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/windsong/WindSong-Medium.ttf?raw=true";
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
