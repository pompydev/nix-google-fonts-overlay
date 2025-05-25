{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-old-persian-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notosansoldpersian/NotoSansOldPersian-Regular.ttf?raw=true";
      name = "NotoSansOldPersian-Regular.ttf";
      sha256 = "fa2d24830f472b8c0974079be5150caffd4fd0b9d6daf431453f277720895fdb";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansOldPersian-Regular.ttf $out/share/fonts/truetype/NotoSansOldPersian-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Old Persian";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
