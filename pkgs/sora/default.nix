{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "sora-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/69109d1f48319d1d474a8d2f70018efc2346a3a7/ofl/sora/Sora[wght].ttf?raw=true";
      name = "Sora[wght].ttf";
      sha256 = "84ff7096ae3ec6c8be47d906d1a0ba4de7f2ce78c615275c77301964a316e16c";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'Sora[wght].ttf' $out/share/fonts/truetype/'Sora[wght].ttf'
  '';

  meta = with lib; {
    description = "Sora";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
