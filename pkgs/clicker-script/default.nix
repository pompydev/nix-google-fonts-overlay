{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "clicker-script-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/clickerscript/ClickerScript-Regular.ttf?raw=true";
      name = "ClickerScript-Regular.ttf";
      sha256 = "0221d4376fc0a25795a32d7e309798b6693b56f65c5851f92529043b230a9117";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 ClickerScript-Regular.ttf $out/share/fonts/truetype/ClickerScript-Regular.ttf
  '';

  meta = with lib; {
    description = "Clicker Script";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
