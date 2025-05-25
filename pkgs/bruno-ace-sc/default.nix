{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "bruno-ace-sc-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/brunoacesc/BrunoAceSC-Regular.ttf?raw=true";
      name = "BrunoAceSC-Regular.ttf";
      sha256 = "97fc6885b4c0345793ddf13bedd7864bc0f45ed47ad05628e42cafc5d8e795d5";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 BrunoAceSC-Regular.ttf $out/share/fonts/truetype/BrunoAceSC-Regular.ttf
  '';

  meta = with lib; {
    description = "Bruno Ace SC";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
