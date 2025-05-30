{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "hedvig-letters-serif-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/hedviglettersserif/HedvigLettersSerif%5Bopsz%5D.ttf?raw=true";
      name = "HedvigLettersSerif_opsz_.ttf";
      sha256 = "4892f22754178b5d18360b24b16bfac38b4a2344395316d66ebd1f3d11ca28c6";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 HedvigLettersSerif_opsz_.ttf $out/share/fonts/truetype/HedvigLettersSerif_opsz_.ttf
  '';

  meta = with lib; {
    description = "Hedvig Letters Serif";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
