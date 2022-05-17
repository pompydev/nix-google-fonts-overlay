{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "baloo-tammudu-2-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/ece08a06735a5c407cba20e373f1b1f6e17f590f/ofl/balootammudu2/BalooTammudu2[wght].ttf?raw=true";
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
