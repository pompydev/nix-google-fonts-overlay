{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-hebrew-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notosanshebrew/NotoSansHebrew%5Bwdth,wght%5D.ttf?raw=true";
      name = "NotoSansHebrew_wdth,wght_.ttf";
      sha256 = "7ef36a2c3593758cdb622e1bdef4f84523e92fbc3ccc667438dd80ff54c2de88";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansHebrew_wdth-wght_.ttf $out/share/fonts/truetype/NotoSansHebrew_wdth-wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Hebrew";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
