{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "happy-monkey-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/happymonkey/HappyMonkey-Regular.ttf?raw=true";
      name = "HappyMonkey-Regular.ttf";
      sha256 = "154d17efd5043e9f76ea4b8a15743fe19634c7adbe3531d6af68bec8a0c7fad3";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 HappyMonkey-Regular.ttf $out/share/fonts/truetype/HappyMonkey-Regular.ttf
  '';

  meta = with lib; {
    description = "Happy Monkey";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
