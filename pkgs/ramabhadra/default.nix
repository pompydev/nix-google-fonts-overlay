{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "ramabhadra-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/ramabhadra/Ramabhadra-Regular.ttf?raw=true";
      name = "Ramabhadra-Regular.ttf";
      sha256 = "68c57789cdf358d70fa7f1fba7f9b93a09541018278dc2fdd98ab82d14a8ffad";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Ramabhadra-Regular.ttf $out/share/fonts/truetype/Ramabhadra-Regular.ttf
  '';

  meta = with lib; {
    description = "Ramabhadra";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
