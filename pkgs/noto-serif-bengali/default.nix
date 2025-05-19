{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-serif-bengali-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notoserifbengali/NotoSerifBengali%5Bwdth,wght%5D.ttf?raw=true";
      name = "NotoSerifBengali_wdth,wght_.ttf";
      sha256 = "0d3a0677049a2e09e186b5a61a08465e1f43d1ac0172397d05a0aae7e3ae4848";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSerifBengali_wdth,wght_.ttf $out/share/fonts/truetype/NotoSerifBengali_wdth,wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Serif Bengali";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
