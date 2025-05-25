{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "ysabeau-sc-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/ysabeausc/YsabeauSC%5Bwght%5D.ttf?raw=true";
      name = "YsabeauSC_wght_.ttf";
      sha256 = "be5128bbae3feaf10b2766724c42b2cb21ccb968ae943688e61ed048d59762b8";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 YsabeauSC_wght_.ttf $out/share/fonts/truetype/YsabeauSC_wght_.ttf
  '';

  meta = with lib; {
    description = "Ysabeau SC";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
