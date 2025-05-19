{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "ancizar-serif-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/ancizarserif/AncizarSerif%5Bwght%5D.ttf?raw=true";
      name = "AncizarSerif_wght_.ttf";
      sha256 = "fcc35d7fe2780846344d7187515d483bb69f3d9bcc49c4833a219e4d9109db98";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/ancizarserif/AncizarSerif-Italic%5Bwght%5D.ttf?raw=true";
      name = "AncizarSerif-Italic_wght_.ttf";
      sha256 = "b30f075790e14795508a42dda7b8f6269509e15a13a4c653b3665662bdfbf45c";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 AncizarSerif_wght_.ttf $out/share/fonts/truetype/AncizarSerif_wght_.ttf
     install -Dm644 AncizarSerif-Italic_wght_.ttf $out/share/fonts/truetype/AncizarSerif-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "Ancizar Serif";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
