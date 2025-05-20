{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "anek-bangla-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/anekbangla/AnekBangla%5Bwdth,wght%5D.ttf?raw=true";
      name = "AnekBangla_wdth,wght_.ttf";
      sha256 = "8b4ec2eaf7400ea9903718a4addf3135475292e6e0b04db7735d0f999289d919";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 AnekBangla_wdth-wght_.ttf $out/share/fonts/truetype/AnekBangla_wdth-wght_.ttf
  '';

  meta = with lib; {
    description = "Anek Bangla";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
