{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "baloo-paaji-2-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/baloopaaji2/BalooPaaji2%5Bwght%5D.ttf?raw=true";
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
