{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "rowdies-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/rowdies/Rowdies-Light.ttf?raw=true";
      name = "Rowdies-Light.ttf";
      sha256 = "fa368ef5ab634438738b930dcd24842d6726cb203339fa1e54fcc52cfd081b65";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/rowdies/Rowdies-Regular.ttf?raw=true";
      name = "Rowdies-Regular.ttf";
      sha256 = "29c98412d1a6e1991ea6cbd36b5fd7cf579d69c1ba14ba857a16c7e8dd9d00a4";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/rowdies/Rowdies-Bold.ttf?raw=true";
      name = "Rowdies-Bold.ttf";
      sha256 = "e56ac3fe30e56243483083a6ba271387e332f77920e850ce7dc1baead4fbede2";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Rowdies-Light.ttf $out/share/fonts/truetype/Rowdies-Light.ttf
     install -Dm644 Rowdies-Regular.ttf $out/share/fonts/truetype/Rowdies-Regular.ttf
     install -Dm644 Rowdies-Bold.ttf $out/share/fonts/truetype/Rowdies-Bold.ttf
  '';

  meta = with lib; {
    description = "Rowdies";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
