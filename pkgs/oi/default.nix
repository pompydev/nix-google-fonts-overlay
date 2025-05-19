{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "oi-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/oi/Oi-Regular.ttf?raw=true";
      name = "Oi-Regular.ttf";
      sha256 = "a406eece17ef2416ffefd6f57e4d5272ab2fa226c001ccf6aee7838231175203";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Oi-Regular.ttf $out/share/fonts/truetype/Oi-Regular.ttf
  '';

  meta = with lib; {
    description = "Oi";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
