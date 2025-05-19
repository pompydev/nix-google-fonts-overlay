{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "nosifer-caps-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/nosifercaps/NosiferCaps-Regular.ttf?raw=true";
      name = "NosiferCaps-Regular.ttf";
      sha256 = "1a1d4fe8f93c32408dc6d068f43e59aaaa3fae4e2cff74dccfbb64de5005d9c1";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NosiferCaps-Regular.ttf $out/share/fonts/truetype/NosiferCaps-Regular.ttf
  '';

  meta = with lib; {
    description = "Nosifer Caps";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
