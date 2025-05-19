{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "red-hat-mono-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/redhatmono/RedHatMono%5Bwght%5D.ttf?raw=true";
      name = "RedHatMono_wght_.ttf";
      sha256 = "253377ac29ccce89cb1b5fb297c69812ffe993b0c436322b3656323ff30fd14f";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/redhatmono/RedHatMono-Italic%5Bwght%5D.ttf?raw=true";
      name = "RedHatMono-Italic_wght_.ttf";
      sha256 = "bdb184e308ec6dfb2790a5ec6a0b1aceb2aca32b95db447873451934eb3517b7";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 RedHatMono_wght_.ttf $out/share/fonts/truetype/RedHatMono_wght_.ttf
     install -Dm644 RedHatMono-Italic_wght_.ttf $out/share/fonts/truetype/RedHatMono-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "Red Hat Mono";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
