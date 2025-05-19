{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-medefaidrin-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notosansmedefaidrin/NotoSansMedefaidrin%5Bwght%5D.ttf?raw=true";
      name = "NotoSansMedefaidrin_wght_.ttf";
      sha256 = "538e31337f09ceaf290e374c2e8a649211ba56523482c2f6674e2868b5555546";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansMedefaidrin_wght_.ttf $out/share/fonts/truetype/NotoSansMedefaidrin_wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Medefaidrin";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
