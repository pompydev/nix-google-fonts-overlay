{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "herr-von-muellerhoff-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/herrvonmuellerhoff/HerrVonMuellerhoff-Regular.ttf?raw=true";
      name = "HerrVonMuellerhoff-Regular.ttf";
      sha256 = "ba8ac10807a79462b7c8265b2eebb8419e5017fdc1a5828b1a071d9e8478772e";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 HerrVonMuellerhoff-Regular.ttf $out/share/fonts/truetype/HerrVonMuellerhoff-Regular.ttf
  '';

  meta = with lib; {
    description = "Herr Von Muellerhoff";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
