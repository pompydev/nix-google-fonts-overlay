{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "buda-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/buda/Buda-Light.ttf?raw=true";
      name = "Buda-Light.ttf";
      sha256 = "1c8a9bb52f69dba3b66961b792c03e5407f48070bf9ff8436103082f6dd6a720";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Buda-Light.ttf $out/share/fonts/truetype/Buda-Light.ttf
  '';

  meta = with lib; {
    description = "Buda";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
