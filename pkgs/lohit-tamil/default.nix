{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "lohit-tamil-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/lohittamil/Lohit-Tamil.ttf?raw=true";
      name = "Lohit-Tamil.ttf";
      sha256 = "320d0959c0650998cd2e589b3368ad3319a0d106becb81b80c272a01dc48fe14";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Lohit-Tamil.ttf $out/share/fonts/truetype/Lohit-Tamil.ttf
  '';

  meta = with lib; {
    description = "Lohit Tamil";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
