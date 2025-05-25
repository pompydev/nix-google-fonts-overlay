{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "donegal-one-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/donegalone/DonegalOne-Regular.ttf?raw=true";
      name = "DonegalOne-Regular.ttf";
      sha256 = "1f9b07bbaf3813103281848f782fae74499f5dfc3b3b9f4e90ebea4aa42fbc75";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 DonegalOne-Regular.ttf $out/share/fonts/truetype/DonegalOne-Regular.ttf
  '';

  meta = with lib; {
    description = "Donegal One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
