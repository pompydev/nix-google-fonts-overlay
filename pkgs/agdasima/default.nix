{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "agdasima-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/agdasima/Agdasima-Regular.ttf?raw=true";
      name = "Agdasima-Regular.ttf";
      sha256 = "512b6ec7aa802bb92cf3b816644ca11facf630b087d6e3ab3cd4b8d4eae77896";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/agdasima/Agdasima-Bold.ttf?raw=true";
      name = "Agdasima-Bold.ttf";
      sha256 = "d75fd96cf62e06d172484ad158614546437a2a988b16feed8b751f9838447ec5";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Agdasima-Regular.ttf $out/share/fonts/truetype/Agdasima-Regular.ttf
     install -Dm644 Agdasima-Bold.ttf $out/share/fonts/truetype/Agdasima-Bold.ttf
  '';

  meta = with lib; {
    description = "Agdasima";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
