{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "hanken-grotesk-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/hankengrotesk/HankenGrotesk%5Bwght%5D.ttf?raw=true";
      name = "HankenGrotesk_wght_.ttf";
      sha256 = "813b3f8fa0965405669a89b38e51bbefd95eef6b8e20d1cb2d8c10cce062662f";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/hankengrotesk/HankenGrotesk-Italic%5Bwght%5D.ttf?raw=true";
      name = "HankenGrotesk-Italic_wght_.ttf";
      sha256 = "ae5731726ff75301a3cb63f2e98d1babc77d55ab09fb8e229ca75f5bd46fbe32";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 HankenGrotesk_wght_.ttf $out/share/fonts/truetype/HankenGrotesk_wght_.ttf
     install -Dm644 HankenGrotesk-Italic_wght_.ttf $out/share/fonts/truetype/HankenGrotesk-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "Hanken Grotesk";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
