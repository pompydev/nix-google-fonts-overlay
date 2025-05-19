{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "oleo-script-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/oleoscript/OleoScript-Regular.ttf?raw=true";
      name = "OleoScript-Regular.ttf";
      sha256 = "1aa003ac938adf9bea644c406ce90eeb1913138aa1d7492242c0ca948c0f48ac";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/oleoscript/OleoScript-Bold.ttf?raw=true";
      name = "OleoScript-Bold.ttf";
      sha256 = "7e4843c9d74233f00a2815954177e33758c1c42a08d218b11c131cf7d818f1d5";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 OleoScript-Regular.ttf $out/share/fonts/truetype/OleoScript-Regular.ttf
     install -Dm644 OleoScript-Bold.ttf $out/share/fonts/truetype/OleoScript-Bold.ttf
  '';

  meta = with lib; {
    description = "Oleo Script";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
