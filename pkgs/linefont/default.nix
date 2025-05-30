{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "linefont-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/linefont/Linefont%5Bwdth,wght%5D.ttf?raw=true";
      name = "Linefont_wdth,wght_.ttf";
      sha256 = "94cab92c51d91e7cac90f03144fa527a9fc6d1712bbbe09ab04c28cdf922026e";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Linefont_wdth-wght_.ttf $out/share/fonts/truetype/Linefont_wdth-wght_.ttf
  '';

  meta = with lib; {
    description = "Linefont";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
