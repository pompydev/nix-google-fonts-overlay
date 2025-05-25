{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "actor-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/actor/Actor-Regular.ttf?raw=true";
      name = "Actor-Regular.ttf";
      sha256 = "a7cf62975a5ecaa8a3be2e2913ffb4a335831315478b93bec722ad982308ea38";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Actor-Regular.ttf $out/share/fonts/truetype/Actor-Regular.ttf
  '';

  meta = with lib; {
    description = "Actor";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
