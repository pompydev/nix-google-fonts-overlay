{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "zen-antique-soft-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/zenantiquesoft/ZenAntiqueSoft-Regular.ttf?raw=true";
      name = "ZenAntiqueSoft-Regular.ttf";
      sha256 = "ab566917267087f4ee3ee9662ce09ff13070e42c704e1e84b6de4c75457da1a5";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 ZenAntiqueSoft-Regular.ttf $out/share/fonts/truetype/ZenAntiqueSoft-Regular.ttf
  '';

  meta = with lib; {
    description = "Zen Antique Soft";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
