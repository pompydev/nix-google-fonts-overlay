{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "fondamento-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/fondamento/Fondamento-Regular.ttf?raw=true";
      name = "Fondamento-Regular.ttf";
      sha256 = "ee03a7ccb3b7cdf3cd095d0cc34f9e70c16b1779cbc7c466bf9077323a6ea764";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/fondamento/Fondamento-Italic.ttf?raw=true";
      name = "Fondamento-Italic.ttf";
      sha256 = "8303c76ccfaf81a065c3653a1d559f76e8223a3200a79451d5dedd33cebbef9e";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Fondamento-Regular.ttf $out/share/fonts/truetype/Fondamento-Regular.ttf
     install -Dm644 Fondamento-Italic.ttf $out/share/fonts/truetype/Fondamento-Italic.ttf
  '';

  meta = with lib; {
    description = "Fondamento";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
