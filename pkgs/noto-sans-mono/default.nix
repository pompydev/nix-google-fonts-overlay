{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-mono-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notosansmono/NotoSansMono%5Bwdth,wght%5D.ttf?raw=true";
      name = "NotoSansMono_wdth,wght_.ttf";
      sha256 = "2cb2adb378a8f574213e23df697050b83c54c27df465a2015552740b2769a081";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansMono_wdth,wght_.ttf $out/share/fonts/truetype/NotoSansMono_wdth,wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Mono";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
