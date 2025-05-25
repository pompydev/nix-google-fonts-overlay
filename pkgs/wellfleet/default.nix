{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "wellfleet-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/wellfleet/Wellfleet-Regular.ttf?raw=true";
      name = "Wellfleet-Regular.ttf";
      sha256 = "347f3918762c7b61c3b98d57071b03295485bc97b6bfb6c7627bcf365cc3c9e7";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Wellfleet-Regular.ttf $out/share/fonts/truetype/Wellfleet-Regular.ttf
  '';

  meta = with lib; {
    description = "Wellfleet";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
