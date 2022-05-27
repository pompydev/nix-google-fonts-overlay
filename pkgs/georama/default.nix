{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "georama-${version}";
  version = "2022-05-23-214203";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/d9733b43f050487e34cc24100c00c4dceecccaff/ofl/georama/Georama%5Bwdth,wght%5D.ttf?raw=true";
      name = "Georama_wdth,wght_.ttf";
      sha256 = "0a62419702ab557e0610a5a073a56f246d13a7db094ef97945a0aa56faf14ab1";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/d9733b43f050487e34cc24100c00c4dceecccaff/ofl/georama/Georama-Italic%5Bwdth,wght%5D.ttf?raw=true";
      name = "Georama-Italic_wdth,wght_.ttf";
      sha256 = "321be0ed8688ed27a2ffd3e85efb9e3c7d9229842b7d9ba90999bf36e672fb00";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Georama_wdth,wght_.ttf $out/share/fonts/truetype/Georama_wdth,wght_.ttf
     install -Dm644 Georama-Italic_wdth,wght_.ttf $out/share/fonts/truetype/Georama-Italic_wdth,wght_.ttf
  '';

  meta = with lib; {
    description = "Georama";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
