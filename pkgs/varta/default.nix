{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "varta-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/varta/Varta%5Bwght%5D.ttf?raw=true";
      name = "Varta_wght_.ttf";
      sha256 = "45933f4041ba1df953c13bdab388bf3127c7081b2e7dfbe71e36f9214d05760f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Varta_wght_.ttf $out/share/fonts/truetype/Varta_wght_.ttf
  '';

  meta = with lib; {
    description = "Varta";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
