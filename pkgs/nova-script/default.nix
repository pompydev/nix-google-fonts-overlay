{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "nova-script-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/novascript/NovaScript-Regular.ttf?raw=true";
      name = "NovaScript-Regular.ttf";
      sha256 = "470a4b2ca317b49f8bfc21d2b8f70d506b2652643664e1c3898852e72122a28d";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NovaScript-Regular.ttf $out/share/fonts/truetype/NovaScript-Regular.ttf
  '';

  meta = with lib; {
    description = "Nova Script";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
