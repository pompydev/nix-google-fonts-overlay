{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "reem-kufi-ink-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/reemkufiink/ReemKufiInk-Regular.ttf?raw=true";
      name = "ReemKufiInk-Regular.ttf";
      sha256 = "643b51388a35934792b8ac9803cb47ecaf7c5c57cd0f35892348100d50f8dd01";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 ReemKufiInk-Regular.ttf $out/share/fonts/truetype/ReemKufiInk-Regular.ttf
  '';

  meta = with lib; {
    description = "Reem Kufi Ink";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
