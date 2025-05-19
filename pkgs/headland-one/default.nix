{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "headland-one-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/headlandone/HeadlandOne-Regular.ttf?raw=true";
      name = "HeadlandOne-Regular.ttf";
      sha256 = "b09ae2dd08b296e1e0d9af93f5c34899d6a04d6c57aff766409f8a96d085f3a4";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 HeadlandOne-Regular.ttf $out/share/fonts/truetype/HeadlandOne-Regular.ttf
  '';

  meta = with lib; {
    description = "Headland One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
