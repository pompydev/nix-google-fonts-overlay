{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "geist-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/geist/Geist%5Bwght%5D.ttf?raw=true";
      name = "Geist_wght_.ttf";
      sha256 = "611e93a8401ee574c9fb3250bdaf5c52262aee3231015e9336359c1b2242cb13";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Geist_wght_.ttf $out/share/fonts/truetype/Geist_wght_.ttf
  '';

  meta = with lib; {
    description = "Geist";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
