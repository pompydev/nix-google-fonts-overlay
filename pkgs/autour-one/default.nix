{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "autour-one-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/autourone/AutourOne-Regular.ttf?raw=true";
      name = "AutourOne-Regular.ttf";
      sha256 = "6a3f5bf27e9398c25bd8c4edaee8bd503d8074553537a2bf3b1d724353aab252";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 AutourOne-Regular.ttf $out/share/fonts/truetype/AutourOne-Regular.ttf
  '';

  meta = with lib; {
    description = "Autour One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
