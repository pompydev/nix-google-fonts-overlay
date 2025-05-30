{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "sriracha-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/sriracha/Sriracha-Regular.ttf?raw=true";
      name = "Sriracha-Regular.ttf";
      sha256 = "c3128c30cb21e8724b792586c87059d1b5eceae10d9957ba2ab26c80bbed3669";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Sriracha-Regular.ttf $out/share/fonts/truetype/Sriracha-Regular.ttf
  '';

  meta = with lib; {
    description = "Sriracha";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
