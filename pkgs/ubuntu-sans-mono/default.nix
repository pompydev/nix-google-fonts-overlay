{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "ubuntu-sans-mono-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ufl/ubuntusansmono/UbuntuSansMono%5Bwght%5D.ttf?raw=true";
      name = "UbuntuSansMono_wght_.ttf";
      sha256 = "0954a9a2b1be5062592aad7ff42c8ad094de641abeb2043d9b21d137844a0dba";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ufl/ubuntusansmono/UbuntuSansMono-Italic%5Bwght%5D.ttf?raw=true";
      name = "UbuntuSansMono-Italic_wght_.ttf";
      sha256 = "55c3678f40cafe4ac39f0071151626693ea7fa70f421408015cc5fcd858afd71";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 UbuntuSansMono_wght_.ttf $out/share/fonts/truetype/UbuntuSansMono_wght_.ttf
     install -Dm644 UbuntuSansMono-Italic_wght_.ttf $out/share/fonts/truetype/UbuntuSansMono-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "Ubuntu Sans Mono";
    license = licenses.ufl;
    platforms = platforms.all;
  };
}
