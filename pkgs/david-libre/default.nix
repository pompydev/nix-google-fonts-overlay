{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "david-libre-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/davidlibre/DavidLibre-Regular.ttf?raw=true";
      name = "DavidLibre-Regular.ttf";
      sha256 = "923f06e0f6dc84e1649d8cc5d5e12a8d663adf6aba83ba15baa5d559fb47b86e";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/davidlibre/DavidLibre-Medium.ttf?raw=true";
      name = "DavidLibre-Medium.ttf";
      sha256 = "fa3e35197472768520a489b77009b75bfc55601f61a0c4d0c1b23ca7f87701ce";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/davidlibre/DavidLibre-Bold.ttf?raw=true";
      name = "DavidLibre-Bold.ttf";
      sha256 = "7610819c7888c8e7ecdfc573089113ec5355cf95078614ae0e30b509b05468f8";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 DavidLibre-Regular.ttf $out/share/fonts/truetype/DavidLibre-Regular.ttf
     install -Dm644 DavidLibre-Medium.ttf $out/share/fonts/truetype/DavidLibre-Medium.ttf
     install -Dm644 DavidLibre-Bold.ttf $out/share/fonts/truetype/DavidLibre-Bold.ttf
  '';

  meta = with lib; {
    description = "David Libre";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
