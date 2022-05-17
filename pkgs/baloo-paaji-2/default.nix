{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "baloo-paaji-2-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/54710b79418fdf4324175ba0a18ad19aa8558e72/ofl/baloopaaji2/BalooPaaji2[wght].ttf?raw=true";
      name = "BalooPaaji2_wght_.ttf";
      sha256 = "44f70c760b100c3073e2e1287d4e1e745a96f4e4082e67236882ffa8c773652e";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 BalooPaaji2_wght_.ttf $out/share/fonts/truetype/BalooPaaji2_wght_.ttf
  '';

  meta = with lib; {
    description = "Baloo Paaji 2";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
