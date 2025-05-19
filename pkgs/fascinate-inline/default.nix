{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "fascinate-inline-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/fascinateinline/FascinateInline-Regular.ttf?raw=true";
      name = "FascinateInline-Regular.ttf";
      sha256 = "413101810fe420520122880404d1f8e892269e6a6afa2e00e980f65ef632ee3b";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 FascinateInline-Regular.ttf $out/share/fonts/truetype/FascinateInline-Regular.ttf
  '';

  meta = with lib; {
    description = "Fascinate Inline";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
