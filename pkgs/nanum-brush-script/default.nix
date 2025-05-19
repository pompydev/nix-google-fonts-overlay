{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "nanum-brush-script-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/nanumbrushscript/NanumBrushScript-Regular.ttf?raw=true";
      name = "NanumBrushScript-Regular.ttf";
      sha256 = "27ceaf578c96f594cdf07fe0181b251790acbb746a164e45c1f6473f89911a31";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NanumBrushScript-Regular.ttf $out/share/fonts/truetype/NanumBrushScript-Regular.ttf
  '';

  meta = with lib; {
    description = "Nanum Brush Script";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
