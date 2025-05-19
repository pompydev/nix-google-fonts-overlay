{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "cascadia-mono-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/cascadiamono/CascadiaMono%5Bwght%5D.ttf?raw=true";
      name = "CascadiaMono_wght_.ttf";
      sha256 = "78864a1b4d03767a44731454a6f24c6b7d6e93fb5f62932860eb02e409cd50cb";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/cascadiamono/CascadiaMono-Italic%5Bwght%5D.ttf?raw=true";
      name = "CascadiaMono-Italic_wght_.ttf";
      sha256 = "53f999d8032b8e16332507d0e18ad638e59cbe72cae52c3ee62ec99337942e51";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 CascadiaMono_wght_.ttf $out/share/fonts/truetype/CascadiaMono_wght_.ttf
     install -Dm644 CascadiaMono-Italic_wght_.ttf $out/share/fonts/truetype/CascadiaMono-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "Cascadia Mono";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
