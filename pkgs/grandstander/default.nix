{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "grandstander-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/grandstander/Grandstander%5Bwght%5D.ttf?raw=true";
      name = "Grandstander_wght_.ttf";
      sha256 = "fbc7d1d934e6aa7842f7e8420cd833eca9eb123d61880075eec68751369e2f13";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/grandstander/Grandstander-Italic%5Bwght%5D.ttf?raw=true";
      name = "Grandstander-Italic_wght_.ttf";
      sha256 = "22ba556757942fd2b3d87aa087ce88d7222492c5440c4f009144770dcb68bd0d";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Grandstander_wght_.ttf $out/share/fonts/truetype/Grandstander_wght_.ttf
     install -Dm644 Grandstander-Italic_wght_.ttf $out/share/fonts/truetype/Grandstander-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "Grandstander";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
