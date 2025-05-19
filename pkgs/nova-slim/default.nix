{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "nova-slim-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/novaslim/NovaSlim.ttf?raw=true";
      name = "NovaSlim.ttf";
      sha256 = "78cf188017f211f64ea14fd1c946cc15dcfdec867f4759a50aff0b4350e38eed";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NovaSlim.ttf $out/share/fonts/truetype/NovaSlim.ttf
  '';

  meta = with lib; {
    description = "Nova Slim";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
