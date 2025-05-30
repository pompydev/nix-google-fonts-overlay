{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "della-respira-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/dellarespira/DellaRespira-Regular.ttf?raw=true";
      name = "DellaRespira-Regular.ttf";
      sha256 = "81518be5b7baf69db5b8e4cff1a447ac2f6bf7a6029ca4963a67e1fb1b0b9218";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 DellaRespira-Regular.ttf $out/share/fonts/truetype/DellaRespira-Regular.ttf
  '';

  meta = with lib; {
    description = "Della Respira";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
