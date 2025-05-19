{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "sancreek-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/sancreek/Sancreek-Regular.ttf?raw=true";
      name = "Sancreek-Regular.ttf";
      sha256 = "8f87c42f6e6ba97125cd975c3d7d48902fc227d805948e678d5293a300e3fe55";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Sancreek-Regular.ttf $out/share/fonts/truetype/Sancreek-Regular.ttf
  '';

  meta = with lib; {
    description = "Sancreek";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
