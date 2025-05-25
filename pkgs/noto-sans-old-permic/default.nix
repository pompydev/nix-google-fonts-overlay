{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-old-permic-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notosansoldpermic/NotoSansOldPermic-Regular.ttf?raw=true";
      name = "NotoSansOldPermic-Regular.ttf";
      sha256 = "a0a446342fbb13aee85bdfd77b27362ca9b5a4fd8f8fa4318ee33e41dc581bf6";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansOldPermic-Regular.ttf $out/share/fonts/truetype/NotoSansOldPermic-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Old Permic";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
