{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "arizonia-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/arizonia/Arizonia-Regular.ttf?raw=true";
      name = "Arizonia-Regular.ttf";
      sha256 = "8df1c10bc15d0aba145d4599c25cafad83db686d2cefa42619f069b6f1bbce62";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Arizonia-Regular.ttf $out/share/fonts/truetype/Arizonia-Regular.ttf
  '';

  meta = with lib; {
    description = "Arizonia";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
