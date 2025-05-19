{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "open-sans-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/opensans/OpenSans%5Bwdth,wght%5D.ttf?raw=true";
      name = "OpenSans_wdth,wght_.ttf";
      sha256 = "36643644f318a812aab2d2ed3bb98f8cf0872527f835fe9398d95fe6b9adb878";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/opensans/OpenSans-Italic%5Bwdth,wght%5D.ttf?raw=true";
      name = "OpenSans-Italic_wdth,wght_.ttf";
      sha256 = "fe269381e992f32e135801740998544d6235061e37c93ec067ad2be3edd5b17b";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 OpenSans_wdth,wght_.ttf $out/share/fonts/truetype/OpenSans_wdth,wght_.ttf
     install -Dm644 OpenSans-Italic_wdth,wght_.ttf $out/share/fonts/truetype/OpenSans-Italic_wdth,wght_.ttf
  '';

  meta = with lib; {
    description = "Open Sans";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
