{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "germania-one-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/germaniaone/GermaniaOne-Regular.ttf?raw=true";
      name = "GermaniaOne-Regular.ttf";
      sha256 = "3ee3d56584bab8c9e3f59cc3360aa8a36e219dcf0a9f3c8928e3da5a19277e3f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 GermaniaOne-Regular.ttf $out/share/fonts/truetype/GermaniaOne-Regular.ttf
  '';

  meta = with lib; {
    description = "Germania One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
