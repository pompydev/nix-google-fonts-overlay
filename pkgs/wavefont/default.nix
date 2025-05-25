{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "wavefont-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/wavefont/Wavefont%5BROND,YELA,wght%5D.ttf?raw=true";
      name = "Wavefont_ROND,YELA,wght_.ttf";
      sha256 = "1fbb81718f9e46647f105f6d641d7c5b0e1796f0d0e4a75e9d3134f1acc2f0a3";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Wavefont_ROND-YELA-wght_.ttf $out/share/fonts/truetype/Wavefont_ROND-YELA-wght_.ttf
  '';

  meta = with lib; {
    description = "Wavefont";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
