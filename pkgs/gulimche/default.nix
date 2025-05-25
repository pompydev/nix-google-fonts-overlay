{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "gulimche-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/gulimche/GulimChe-Regular.ttf?raw=true";
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
