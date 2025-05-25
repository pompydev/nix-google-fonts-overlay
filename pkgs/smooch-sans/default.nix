{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "smooch-sans-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/smoochsans/SmoochSans%5Bwght%5D.ttf?raw=true";
      name = "SmoochSans_wght_.ttf";
      sha256 = "6d82f480d71365d9c6c4f96ad1f3cab44053ea3f0b63650b1e0e539d915aff49";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 SmoochSans_wght_.ttf $out/share/fonts/truetype/SmoochSans_wght_.ttf
  '';

  meta = with lib; {
    description = "Smooch Sans";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
