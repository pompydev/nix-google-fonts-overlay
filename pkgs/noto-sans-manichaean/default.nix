{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-manichaean-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notosansmanichaean/NotoSansManichaean-Regular.ttf?raw=true";
      name = "NotoSansManichaean-Regular.ttf";
      sha256 = "692e31fc2600b1db6a369dd50b808914ebea385530b0d95ca1f103e7943e7487";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansManichaean-Regular.ttf $out/share/fonts/truetype/NotoSansManichaean-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Manichaean";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
