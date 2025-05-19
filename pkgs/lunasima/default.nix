{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "lunasima-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/lunasima/Lunasima-Regular.ttf?raw=true";
      name = "Lunasima-Regular.ttf";
      sha256 = "833ded9502e6553eece11f587f27640cab1ef44900785abe8c3b09ba11690b62";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/lunasima/Lunasima-Bold.ttf?raw=true";
      name = "Lunasima-Bold.ttf";
      sha256 = "6e5b8c0227c163d22de73ae127cf99f65b33bfd767aa294989f514dd294fe0bf";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Lunasima-Regular.ttf $out/share/fonts/truetype/Lunasima-Regular.ttf
     install -Dm644 Lunasima-Bold.ttf $out/share/fonts/truetype/Lunasima-Bold.ttf
  '';

  meta = with lib; {
    description = "Lunasima";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
