{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "xanh-mono-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/xanhmono/XanhMono-Regular.ttf?raw=true";
      name = "XanhMono-Regular.ttf";
      sha256 = "33e64b43fdcb40bd0141853601c7aaffd5be15ebd3cf56340d2473ff8be8e69c";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/xanhmono/XanhMono-Italic.ttf?raw=true";
      name = "XanhMono-Italic.ttf";
      sha256 = "e74ed4105efc797c05ec0631182e0a76bb5ecbf1b6adedb9e0170c79964b2f6f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 XanhMono-Regular.ttf $out/share/fonts/truetype/XanhMono-Regular.ttf
     install -Dm644 XanhMono-Italic.ttf $out/share/fonts/truetype/XanhMono-Italic.ttf
  '';

  meta = with lib; {
    description = "Xanh Mono";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
