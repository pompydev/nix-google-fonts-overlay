{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "biz-udmincho-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/bizudmincho/BIZUDMincho-Regular.ttf?raw=true";
      name = "BIZUDMincho-Regular.ttf";
      sha256 = "468ee6d9b149ca144809e03841bf18740ecf014e055a00da6ecaf1aaf4165af2";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/bizudmincho/BIZUDMincho-Bold.ttf?raw=true";
      name = "BIZUDMincho-Bold.ttf";
      sha256 = "1f077f8f84c1e09d5c4acdd6828048180c2f733ae5ae13271f48cf01bee4ae83";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 BIZUDMincho-Regular.ttf $out/share/fonts/truetype/BIZUDMincho-Regular.ttf
     install -Dm644 BIZUDMincho-Bold.ttf $out/share/fonts/truetype/BIZUDMincho-Bold.ttf
  '';

  meta = with lib; {
    description = "BIZ UDMincho";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
