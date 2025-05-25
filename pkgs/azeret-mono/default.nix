{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "azeret-mono-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/azeretmono/AzeretMono%5Bwght%5D.ttf?raw=true";
      name = "AzeretMono_wght_.ttf";
      sha256 = "f13962c26c1baa864aff7768364001f9bca6e506f41b9a3037c0d6a31e2ca736";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/azeretmono/AzeretMono-Italic%5Bwght%5D.ttf?raw=true";
      name = "AzeretMono-Italic_wght_.ttf";
      sha256 = "d8fef266d11964b6420c89ebb76706a00afa31c80e58d0510db928a65a05de45";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 AzeretMono_wght_.ttf $out/share/fonts/truetype/AzeretMono_wght_.ttf
     install -Dm644 AzeretMono-Italic_wght_.ttf $out/share/fonts/truetype/AzeretMono-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "Azeret Mono";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
