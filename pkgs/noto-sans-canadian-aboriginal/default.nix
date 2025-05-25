{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-canadian-aboriginal-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notosanscanadianaboriginal/NotoSansCanadianAboriginal%5Bwght%5D.ttf?raw=true";
      name = "NotoSansCanadianAboriginal_wght_.ttf";
      sha256 = "81b0f7e7ca48b28e343bb6a523a066743acedfbb29f374cbe4501e6d5f08f7af";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansCanadianAboriginal_wght_.ttf $out/share/fonts/truetype/NotoSansCanadianAboriginal_wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Canadian Aboriginal";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
