{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "kumar-one-outline-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/kumaroneoutline/KumarOneOutline-Regular.ttf?raw=true";
      name = "KumarOneOutline-Regular.ttf";
      sha256 = "571c34cfa9c533f34de71081ddc7c7593d244d183a6114b8bac1a83a59e2f7ed";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 KumarOneOutline-Regular.ttf $out/share/fonts/truetype/KumarOneOutline-Regular.ttf
  '';

  meta = with lib; {
    description = "Kumar One Outline";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
