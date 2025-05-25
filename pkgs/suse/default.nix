{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "suse-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/suse/SUSE%5Bwght%5D.ttf?raw=true";
      name = "SUSE_wght_.ttf";
      sha256 = "6e611a272c067d9e32b7d62490b048c0ba93c2ed5c9fbf10c0521476113b84ce";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 SUSE_wght_.ttf $out/share/fonts/truetype/SUSE_wght_.ttf
  '';

  meta = with lib; {
    description = "SUSE";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
