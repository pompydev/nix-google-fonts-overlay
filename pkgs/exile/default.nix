{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "exile-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/exile/Exile-Regular.ttf?raw=true";
      name = "Exile-Regular.ttf";
      sha256 = "b8a059a844d6269e9136bec589d79455d0568eadd347e8769a46b1cd9babc6a2";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Exile-Regular.ttf $out/share/fonts/truetype/Exile-Regular.ttf
  '';

  meta = with lib; {
    description = "Exile";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
