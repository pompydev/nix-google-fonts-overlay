{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-tangsa-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notosanstangsa/NotoSansTangsa%5Bwght%5D.ttf?raw=true";
      name = "NotoSansTangsa_wght_.ttf";
      sha256 = "2ed50f0ba084742ce2dfe4909bc529131272d9468b1aa341d5866fbc1a1be48f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansTangsa_wght_.ttf $out/share/fonts/truetype/NotoSansTangsa_wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Tangsa";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
