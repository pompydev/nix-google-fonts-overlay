{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "scada-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/scada/Scada-Regular.ttf?raw=true";
      name = "Scada-Regular.ttf";
      sha256 = "4ae8f108b8ce016017a2fe40ff65ec613eb6a4149ce3b9a9fe60cea117b55036";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/scada/Scada-Italic.ttf?raw=true";
      name = "Scada-Italic.ttf";
      sha256 = "3f479dbfe80ed74d3ff880076468f9818edd28ff9909e5f22ce698224a085c1f";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/scada/Scada-Bold.ttf?raw=true";
      name = "Scada-Bold.ttf";
      sha256 = "3a0085400cfc229bc4329e77dd5a11eb79e7fc881f5c285f813b251133ddd095";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/scada/Scada-BoldItalic.ttf?raw=true";
      name = "Scada-BoldItalic.ttf";
      sha256 = "c509976fc82880d6729bf6a4db19786f2eaf86dfe4ccf36060afb3d871e6f547";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Scada-Regular.ttf $out/share/fonts/truetype/Scada-Regular.ttf
     install -Dm644 Scada-Italic.ttf $out/share/fonts/truetype/Scada-Italic.ttf
     install -Dm644 Scada-Bold.ttf $out/share/fonts/truetype/Scada-Bold.ttf
     install -Dm644 Scada-BoldItalic.ttf $out/share/fonts/truetype/Scada-BoldItalic.ttf
  '';

  meta = with lib; {
    description = "Scada";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
