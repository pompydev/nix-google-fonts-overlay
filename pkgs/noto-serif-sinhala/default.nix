{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-serif-sinhala-${version}";
  version = "2022-03-09-183858";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notoserifsinhala/NotoSerifSinhala%5Bwdth,wght%5D.ttf?raw=true";
      name = "NotoSerifSinhala_wdth,wght_.ttf";
      sha256 = "68e11b60ea661d42ad0fdd18a2ba4c6e333e6b88e1ad396c0a42a98058d9b573";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSerifSinhala_wdth,wght_.ttf $out/share/fonts/truetype/NotoSerifSinhala_wdth,wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Serif Sinhala";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
