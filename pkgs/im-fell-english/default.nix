{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "im-fell-english-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/imfellenglish/IMFeENrm28P.ttf?raw=true";
      name = "IMFeENrm28P.ttf";
      sha256 = "fe9705bbde51af802719246d4608d08d37bde956ab99d9a590da996a5221a24c";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/imfellenglish/IMFeENit28P.ttf?raw=true";
      name = "IMFeENit28P.ttf";
      sha256 = "47cd75dce54b1f2e0831359d22d5e688f519d68ae45706b664fd310fd0e3ccf7";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 IMFeENrm28P.ttf $out/share/fonts/truetype/IMFeENrm28P.ttf
     install -Dm644 IMFeENit28P.ttf $out/share/fonts/truetype/IMFeENit28P.ttf
  '';

  meta = with lib; {
    description = "IM Fell English";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
