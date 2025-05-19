{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-duployan-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notosansduployan/NotoSansDuployan-Regular.ttf?raw=true";
      name = "NotoSansDuployan-Regular.ttf";
      sha256 = "2510875cbe4b602f90446e185b25eff1dc600acbc37e8a7a46bbf352603373be";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notosansduployan/NotoSansDuployan-Bold.ttf?raw=true";
      name = "NotoSansDuployan-Bold.ttf";
      sha256 = "f7766eabbec7c00e50b0e64bf130805f03da77474c203809ceedf1ae96a521db";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansDuployan-Regular.ttf $out/share/fonts/truetype/NotoSansDuployan-Regular.ttf
     install -Dm644 NotoSansDuployan-Bold.ttf $out/share/fonts/truetype/NotoSansDuployan-Bold.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Duployan";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
