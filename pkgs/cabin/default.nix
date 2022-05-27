{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "cabin-${version}";
  version = "2022-05-23-211740";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/e0e68be377b55f90b78cf34146bbc7ff47c0bff1/ofl/cabin/Cabin%5Bwdth,wght%5D.ttf?raw=true";
      name = "Cabin_wdth,wght_.ttf";
      sha256 = "a16576e6cec01cf994c46838ed1c17ffdb62cf6da8430edfbcb011f57dd62457";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/e0e68be377b55f90b78cf34146bbc7ff47c0bff1/ofl/cabin/Cabin-Italic%5Bwdth,wght%5D.ttf?raw=true";
      name = "Cabin-Italic_wdth,wght_.ttf";
      sha256 = "f033cc4391bdcbb674169c997e3cafbf3417b1fd790a1d9bd31eafa0ca8afea4";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Cabin_wdth,wght_.ttf $out/share/fonts/truetype/Cabin_wdth,wght_.ttf
     install -Dm644 Cabin-Italic_wdth,wght_.ttf $out/share/fonts/truetype/Cabin-Italic_wdth,wght_.ttf
  '';

  meta = with lib; {
    description = "Cabin";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
