{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "junge-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/junge/Junge-Regular.ttf?raw=true";
      name = "Junge-Regular.ttf";
      sha256 = "4671c65a0e6c02c866362938e968e083d171744e4c90fa2cfa8b809cc9f7207e";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Junge-Regular.ttf $out/share/fonts/truetype/Junge-Regular.ttf
  '';

  meta = with lib; {
    description = "Junge";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
