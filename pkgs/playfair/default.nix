{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playfair-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/playfair/Playfair%5Bopsz,wdth,wght%5D.ttf?raw=true";
      name = "Playfair_opsz,wdth,wght_.ttf";
      sha256 = "33cfecbc9948cf9eafe54dc9f36d19a03b393cf12221b20be235926d1ca1db61";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/playfair/Playfair-Italic%5Bopsz,wdth,wght%5D.ttf?raw=true";
      name = "Playfair-Italic_opsz,wdth,wght_.ttf";
      sha256 = "ae0d7a72a93804925040c277b4cd7e0607f48bb68dbbce70e3da6b5949f911ca";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Playfair_opsz-wdth-wght_.ttf $out/share/fonts/truetype/Playfair_opsz-wdth-wght_.ttf
     install -Dm644 Playfair-Italic_opsz-wdth-wght_.ttf $out/share/fonts/truetype/Playfair-Italic_opsz-wdth-wght_.ttf
  '';

  meta = with lib; {
    description = "Playfair";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
