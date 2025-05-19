{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "moirai-one-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/moiraione/MoiraiOne-Regular.ttf?raw=true";
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
