{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "cherry-swash-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/cherryswash/CherrySwash-Regular.ttf?raw=true";
      name = "CherrySwash-Regular.ttf";
      sha256 = "ce98243d428163be0d59fc02d3133507cd5afe78c501aa320c09c5deaa78a4a3";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/cherryswash/CherrySwash-Bold.ttf?raw=true";
      name = "CherrySwash-Bold.ttf";
      sha256 = "5cca323c29a80e19400a06be7c0c46e19db8ff2966cbbff7e05eac33354124ba";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 CherrySwash-Regular.ttf $out/share/fonts/truetype/CherrySwash-Regular.ttf
     install -Dm644 CherrySwash-Bold.ttf $out/share/fonts/truetype/CherrySwash-Bold.ttf
  '';

  meta = with lib; {
    description = "Cherry Swash";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
