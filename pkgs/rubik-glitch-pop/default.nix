{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "rubik-glitch-pop-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/rubikglitchpop/RubikGlitchPop-Regular.ttf?raw=true";
      name = "RubikGlitchPop-Regular.ttf";
      sha256 = "20545e9c47a8d5f1a23305c598c54b2c29f252079db2965e593184e765d5880f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 RubikGlitchPop-Regular.ttf $out/share/fonts/truetype/RubikGlitchPop-Regular.ttf
  '';

  meta = with lib; {
    description = "Rubik Glitch Pop";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
