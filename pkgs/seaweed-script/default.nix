{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "seaweed-script-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/seaweedscript/SeaweedScript-Regular.ttf?raw=true";
      name = "SeaweedScript-Regular.ttf";
      sha256 = "48a7f01ce3f307b532c9c5f8582a8ed87883389933b311b8e3704e8798ba4bc7";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 SeaweedScript-Regular.ttf $out/share/fonts/truetype/SeaweedScript-Regular.ttf
  '';

  meta = with lib; {
    description = "Seaweed Script";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
