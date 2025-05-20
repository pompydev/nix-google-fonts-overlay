{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "roboto-serif-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/robotoserif/RobotoSerif%5BGRAD,opsz,wdth,wght%5D.ttf?raw=true";
      name = "RobotoSerif_GRAD,opsz,wdth,wght_.ttf";
      sha256 = "351ced75f3851806aa6d846b669361521eb1925cfc530396df9c1a1b77061ddb";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/robotoserif/RobotoSerif-Italic%5BGRAD,opsz,wdth,wght%5D.ttf?raw=true";
      name = "RobotoSerif-Italic_GRAD,opsz,wdth,wght_.ttf";
      sha256 = "695ffbe6bfd0893a8de90b1ea13632e7e838bc7427b818584e1daf82b36b99de";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 RobotoSerif_GRAD-opsz-wdth-wght_.ttf $out/share/fonts/truetype/RobotoSerif_GRAD-opsz-wdth-wght_.ttf
     install -Dm644 RobotoSerif-Italic_GRAD-opsz-wdth-wght_.ttf $out/share/fonts/truetype/RobotoSerif-Italic_GRAD-opsz-wdth-wght_.ttf
  '';

  meta = with lib; {
    description = "Roboto Serif";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
