{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "cherish-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/cherish/Cherish-Regular.ttf?raw=true";
      name = "Cherish-Regular.ttf";
      sha256 = "5d6588a51682057329566baf12a11c405dea771a9dcec61ac5fe9a83d9db6b13";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Cherish-Regular.ttf $out/share/fonts/truetype/Cherish-Regular.ttf
  '';

  meta = with lib; {
    description = "Cherish";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
