{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "baloo-tammudu-2-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/balootammudu2/BalooTammudu2%5Bwght%5D.ttf?raw=true";
      name = "BalooTammudu2_wght_.ttf";
      sha256 = "4771a1c50423a07f36919fac4d882cc0ac43e451faf043c8558d7a209298d56c";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 BalooTammudu2_wght_.ttf $out/share/fonts/truetype/BalooTammudu2_wght_.ttf
  '';

  meta = with lib; {
    description = "Baloo Tammudu 2";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
