{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "bytesized-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/bytesized/Bytesized-Regular.ttf?raw=true";
      name = "Bytesized-Regular.ttf";
      sha256 = "867b090a29cf5b45378692d3163439bb51875a3ddf4e37dcabf62030d04f1d51";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Bytesized-Regular.ttf $out/share/fonts/truetype/Bytesized-Regular.ttf
  '';

  meta = with lib; {
    description = "Bytesized";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
