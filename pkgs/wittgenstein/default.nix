{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "wittgenstein-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/wittgenstein/Wittgenstein%5Bwght%5D.ttf?raw=true";
      name = "Wittgenstein_wght_.ttf";
      sha256 = "773d52be838aabb9a1912909a9c2af5ac6c54939443433b648c51b039e987e3a";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/wittgenstein/Wittgenstein-Italic%5Bwght%5D.ttf?raw=true";
      name = "Wittgenstein-Italic_wght_.ttf";
      sha256 = "f046ab65c2acc48869301db17a97cf73174ba9748af8ca10f574af0d8f3cb5b3";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Wittgenstein_wght_.ttf $out/share/fonts/truetype/Wittgenstein_wght_.ttf
     install -Dm644 Wittgenstein-Italic_wght_.ttf $out/share/fonts/truetype/Wittgenstein-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "Wittgenstein";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
