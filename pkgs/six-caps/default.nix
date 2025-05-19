{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "six-caps-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/sixcaps/SixCaps.ttf?raw=true";
      name = "SixCaps.ttf";
      sha256 = "7b54a46671722fb670647c9c3951e6e618b6a9d876fc5d9ae34dfd311628ae5a";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 SixCaps.ttf $out/share/fonts/truetype/SixCaps.ttf
  '';

  meta = with lib; {
    description = "Six Caps";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
