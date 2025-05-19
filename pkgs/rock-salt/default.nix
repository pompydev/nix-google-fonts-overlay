{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "rock-salt-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/apache/rocksalt/RockSalt-Regular.ttf?raw=true";
      name = "RockSalt-Regular.ttf";
      sha256 = "c5421d1ced1949488f29d11b75b7ef967abe2d870f816246bf18fdc0f3e29c96";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 RockSalt-Regular.ttf $out/share/fonts/truetype/RockSalt-Regular.ttf
  '';

  meta = with lib; {
    description = "Rock Salt";
    license = licenses.asl20;
    platforms = platforms.all;
  };
}
