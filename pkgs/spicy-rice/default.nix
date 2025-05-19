{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "spicy-rice-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/spicyrice/SpicyRice-Regular.ttf?raw=true";
      name = "SpicyRice-Regular.ttf";
      sha256 = "f339f9b0b3d585974ec22a374d7e0938b429c229dc0f3b3b16f34c650ab08068";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 SpicyRice-Regular.ttf $out/share/fonts/truetype/SpicyRice-Regular.ttf
  '';

  meta = with lib; {
    description = "Spicy Rice";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
