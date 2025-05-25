{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "federant-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/federant/Federant-Regular.ttf?raw=true";
      name = "Federant-Regular.ttf";
      sha256 = "d40cb09c85114c2b0c9442636412e997d8258b383e1d1a684e7e32b21d07a5c2";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Federant-Regular.ttf $out/share/fonts/truetype/Federant-Regular.ttf
  '';

  meta = with lib; {
    description = "Federant";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
