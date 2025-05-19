{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-signwriting-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notosanssignwriting/NotoSansSignWriting-Regular.ttf?raw=true";
      name = "NotoSansSignWriting-Regular.ttf";
      sha256 = "1da27fe7b8e959efaf338818f2a6c1aa2c02ff97cf60c34c6d0825675ebc53fb";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansSignWriting-Regular.ttf $out/share/fonts/truetype/NotoSansSignWriting-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans SignWriting";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
