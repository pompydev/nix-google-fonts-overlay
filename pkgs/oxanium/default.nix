{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "oxanium-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/oxanium/Oxanium%5Bwght%5D.ttf?raw=true";
      name = "Oxanium_wght_.ttf";
      sha256 = "2ce01d946e1e1ffc8d7eecfffbda8623bedd63eaf811a20488c4b69af45babb0";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Oxanium_wght_.ttf $out/share/fonts/truetype/Oxanium_wght_.ttf
  '';

  meta = with lib; {
    description = "Oxanium";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
