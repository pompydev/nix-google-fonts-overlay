{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-serif-np-hmong-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notoserifnphmong/NotoSerifNPHmong%5Bwght%5D.ttf?raw=true";
      name = "NotoSerifNPHmong_wght_.ttf";
      sha256 = "6917f29fdcb76668b8ad4c85038d54815b5899c49242c82b76c3b3dcc2bb216f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSerifNPHmong_wght_.ttf $out/share/fonts/truetype/NotoSerifNPHmong_wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Serif NP Hmong";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
