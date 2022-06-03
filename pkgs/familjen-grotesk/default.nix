{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "familjen-grotesk-${version}";
  version = "2022-06-02-125518";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/917cad5aeb6953227b5b7740ad7fadf53210f55b/ofl/familjengrotesk/FamiljenGrotesk%5Bwght%5D.ttf?raw=true";
      name = "FamiljenGrotesk_wght_.ttf";
      sha256 = "5300f02ffd415d435ea02983e710ae943340137418cb99a1672c2dd38fd84f53";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/917cad5aeb6953227b5b7740ad7fadf53210f55b/ofl/familjengrotesk/FamiljenGrotesk-Italic%5Bwght%5D.ttf?raw=true";
      name = "FamiljenGrotesk-Italic_wght_.ttf";
      sha256 = "c3b1c16b5fe240662f823af51dbe7b3d5eff4308d3d2469c527a433bb2266efc";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 FamiljenGrotesk_wght_.ttf $out/share/fonts/truetype/FamiljenGrotesk_wght_.ttf
     install -Dm644 FamiljenGrotesk-Italic_wght_.ttf $out/share/fonts/truetype/FamiljenGrotesk-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "Familjen Grotesk";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
