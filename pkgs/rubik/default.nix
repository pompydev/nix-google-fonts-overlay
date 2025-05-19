{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "rubik-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/rubik/Rubik%5Bwght%5D.ttf?raw=true";
      name = "Rubik_wght_.ttf";
      sha256 = "1b3a7437ba2af80e465e773ed60c5036d1ba6ace492d89046dbcf18fb31e4e88";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/rubik/Rubik-Italic%5Bwght%5D.ttf?raw=true";
      name = "Rubik-Italic_wght_.ttf";
      sha256 = "08c6c4018a5ada8b517407b46897e46cf6ebb106853fbd3e89addb51d3b59c62";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Rubik_wght_.ttf $out/share/fonts/truetype/Rubik_wght_.ttf
     install -Dm644 Rubik-Italic_wght_.ttf $out/share/fonts/truetype/Rubik-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "Rubik";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
