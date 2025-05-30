{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "nova-slim-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/novaslim/NovaSlim.ttf?raw=true";
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
