{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "annie-use-your-telescope-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/annieuseyourtelescope/AnnieUseYourTelescope-Regular.ttf?raw=true";
      name = "AnnieUseYourTelescope-Regular.ttf";
      sha256 = "221b54062adb0df36d4b8f0d2f98aef4f827fc34b974cae2ce232a5e233149b9";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 AnnieUseYourTelescope-Regular.ttf $out/share/fonts/truetype/AnnieUseYourTelescope-Regular.ttf
  '';

  meta = with lib; {
    description = "Annie Use Your Telescope";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
