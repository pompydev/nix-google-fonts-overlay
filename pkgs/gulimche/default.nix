{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "gulimche-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/gulimche/GulimChe-Regular.ttf?raw=true";
      name = "GulimChe-Regular.ttf";
      sha256 = "aba838ffa7d1bc8e95107f643bb0486434ca424edf020e5a5e9b32295029de6c";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 GulimChe-Regular.ttf $out/share/fonts/truetype/GulimChe-Regular.ttf
  '';

  meta = with lib; {
    description = "GulimChe";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
