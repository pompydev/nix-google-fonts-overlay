{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "jacquard-24-charted-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/jacquard24charted/Jacquard24Charted-Regular.ttf?raw=true";
      name = "Jacquard24Charted-Regular.ttf";
      sha256 = "3db5951a07e33560837054e4fa6110cc07866e58bfe14363f81314c2460ff0f2";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Jacquard24Charted-Regular.ttf $out/share/fonts/truetype/Jacquard24Charted-Regular.ttf
  '';

  meta = with lib; {
    description = "Jacquard 24 Charted";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
