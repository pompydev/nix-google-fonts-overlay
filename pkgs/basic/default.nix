{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "basic-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/basic/Basic-Regular.ttf?raw=true";
      name = "Basic-Regular.ttf";
      sha256 = "077f7245f6459045495b1ca0493f2b426c421d2112d10b48a38ff8858a07397a";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Basic-Regular.ttf $out/share/fonts/truetype/Basic-Regular.ttf
  '';

  meta = with lib; {
    description = "Basic";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
