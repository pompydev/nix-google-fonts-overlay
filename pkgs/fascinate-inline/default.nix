{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "fascinate-inline-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/fascinateinline/FascinateInline-Regular.ttf?raw=true";
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
