{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "chilanka-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/chilanka/Chilanka-Regular.ttf?raw=true";
      name = "Chilanka-Regular.ttf";
      sha256 = "c6ce47d1a8d387310469c8e355351ff2bd4106030c2a45f1cef0c93215075ed7";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Chilanka-Regular.ttf $out/share/fonts/truetype/Chilanka-Regular.ttf
  '';

  meta = with lib; {
    description = "Chilanka";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
