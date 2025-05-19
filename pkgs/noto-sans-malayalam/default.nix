{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-malayalam-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notosansmalayalam/NotoSansMalayalam%5Bwdth,wght%5D.ttf?raw=true";
      name = "NotoSansMalayalam_wdth,wght_.ttf";
      sha256 = "312e0e7c3cc15fa09eb42a8f749eeb246b593ed420e3c81aafe8d910c3a6fb56";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansMalayalam_wdth,wght_.ttf $out/share/fonts/truetype/NotoSansMalayalam_wdth,wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Malayalam";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
