{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "rubik-mono-one-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/rubikmonoone/RubikMonoOne-Regular.ttf?raw=true";
      name = "RubikMonoOne-Regular.ttf";
      sha256 = "b22624b6a36e543e942106edfccd198c50b57b65b924bfe02a6f0a5699429e6b";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 RubikMonoOne-Regular.ttf $out/share/fonts/truetype/RubikMonoOne-Regular.ttf
  '';

  meta = with lib; {
    description = "Rubik Mono One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
