{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "caprasimo-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/caprasimo/Caprasimo-Regular.ttf?raw=true";
      name = "Caprasimo-Regular.ttf";
      sha256 = "786ab84ee787d40df55be78cb4361e485a1c6687195cbcccf3538cb5e46ced90";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Caprasimo-Regular.ttf $out/share/fonts/truetype/Caprasimo-Regular.ttf
  '';

  meta = with lib; {
    description = "Caprasimo";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
