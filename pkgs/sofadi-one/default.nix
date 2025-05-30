{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "sofadi-one-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/sofadione/SofadiOne-Regular.ttf?raw=true";
      name = "SofadiOne-Regular.ttf";
      sha256 = "e88fa20679a9e3568b66ee0bb973bc8bebf73bb868297a2dffd30a99354c0a2f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 SofadiOne-Regular.ttf $out/share/fonts/truetype/SofadiOne-Regular.ttf
  '';

  meta = with lib; {
    description = "Sofadi One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
