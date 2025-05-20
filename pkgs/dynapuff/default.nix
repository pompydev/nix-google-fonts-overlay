{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "dynapuff-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/dynapuff/DynaPuff%5Bwdth,wght%5D.ttf?raw=true";
      name = "DynaPuff_wdth,wght_.ttf";
      sha256 = "c3752fc6dd8aaa46a88637f061a9a4e6ab44c02c5f0afd65528b91ae8ff6f948";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 DynaPuff_wdth-wght_.ttf $out/share/fonts/truetype/DynaPuff_wdth-wght_.ttf
  '';

  meta = with lib; {
    description = "DynaPuff";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
