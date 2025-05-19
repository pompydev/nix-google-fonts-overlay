{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "ravi-prakash-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/raviprakash/RaviPrakash-Regular.ttf?raw=true";
      name = "RaviPrakash-Regular.ttf";
      sha256 = "f539bdb2673b3e1b69a279da763d178a6e4b4cafe5a12c85be0f5e03b547fcb6";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 RaviPrakash-Regular.ttf $out/share/fonts/truetype/RaviPrakash-Regular.ttf
  '';

  meta = with lib; {
    description = "Ravi Prakash";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
