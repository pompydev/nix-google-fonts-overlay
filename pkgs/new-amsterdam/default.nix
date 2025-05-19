{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "new-amsterdam-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/newamsterdam/NewAmsterdam-Regular.ttf?raw=true";
      name = "NewAmsterdam-Regular.ttf";
      sha256 = "f52d8430042c0c09fe3080eb9a7d8d3f8f5f7f18879474d3837ff7a43c07e219";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NewAmsterdam-Regular.ttf $out/share/fonts/truetype/NewAmsterdam-Regular.ttf
  '';

  meta = with lib; {
    description = "New Amsterdam";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
