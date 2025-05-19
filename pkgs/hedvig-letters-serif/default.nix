{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "hedvig-letters-serif-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/hedviglettersserif/HedvigLettersSerif%5Bopsz%5D.ttf?raw=true";
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
