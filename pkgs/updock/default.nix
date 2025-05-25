{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "updock-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/updock/Updock-Regular.ttf?raw=true";
      name = "Updock-Regular.ttf";
      sha256 = "2b9138ac107e6b5831828474c5f9e773c2da3a762afb76841deb6ecf5fd99ef6";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Updock-Regular.ttf $out/share/fonts/truetype/Updock-Regular.ttf
  '';

  meta = with lib; {
    description = "Updock";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
