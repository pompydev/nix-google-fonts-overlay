{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "moirai-one-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/moiraione/MoiraiOne-Regular.ttf?raw=true";
      name = "MoiraiOne-Regular.ttf";
      sha256 = "432f48aa773510211ac50c9d8130e50fe135c4d8c05645828ccde7e652ea8106";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 MoiraiOne-Regular.ttf $out/share/fonts/truetype/MoiraiOne-Regular.ttf
  '';

  meta = with lib; {
    description = "Moirai One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
