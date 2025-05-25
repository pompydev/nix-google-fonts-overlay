{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "fragment-mono-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/fragmentmono/FragmentMono-Regular.ttf?raw=true";
      name = "FragmentMono-Regular.ttf";
      sha256 = "0fe011f425873c2e0fc73a189e394e340ad48d2b9a99a576bdeec75cee000460";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/fragmentmono/FragmentMono-Italic.ttf?raw=true";
      name = "FragmentMono-Italic.ttf";
      sha256 = "c9dd3c7b24c11ba05ab1a6ec3a659c823f0e14fb26c14df0e93e82ebb60f3a25";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 FragmentMono-Regular.ttf $out/share/fonts/truetype/FragmentMono-Regular.ttf
     install -Dm644 FragmentMono-Italic.ttf $out/share/fonts/truetype/FragmentMono-Italic.ttf
  '';

  meta = with lib; {
    description = "Fragment Mono";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
