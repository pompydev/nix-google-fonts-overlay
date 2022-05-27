{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "radio-canada-${version}";
  version = "2022-05-23-231859";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/cbaca09ad5d43f0d3cbc2725d89ddfc977674436/ofl/radiocanada/RadioCanada%5Bwdth,wght%5D.ttf?raw=true";
      name = "RadioCanada_wdth,wght_.ttf";
      sha256 = "d44d90a3e8d07b0f95aa9f4a742189810878fac5a2bf28ea4316f631f1e8c572";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/cbaca09ad5d43f0d3cbc2725d89ddfc977674436/ofl/radiocanada/RadioCanada-Italic%5Bwdth,wght%5D.ttf?raw=true";
      name = "RadioCanada-Italic_wdth,wght_.ttf";
      sha256 = "660ff50e73703e49fafa157734832bfa3a30d209bc64a85ee65a4d61b817530e";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 RadioCanada_wdth,wght_.ttf $out/share/fonts/truetype/RadioCanada_wdth,wght_.ttf
     install -Dm644 RadioCanada-Italic_wdth,wght_.ttf $out/share/fonts/truetype/RadioCanada-Italic_wdth,wght_.ttf
  '';

  meta = with lib; {
    description = "Radio Canada";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
