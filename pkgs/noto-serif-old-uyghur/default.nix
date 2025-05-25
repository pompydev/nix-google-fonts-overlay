{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-serif-old-uyghur-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notoserifolduyghur/NotoSerifOldUyghur-Regular.ttf?raw=true";
      name = "NotoSerifOldUyghur-Regular.ttf";
      sha256 = "c6505bee89c56d6feee73d811030c27c76d4c046274fbca5ce1d24c13508b974";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSerifOldUyghur-Regular.ttf $out/share/fonts/truetype/NotoSerifOldUyghur-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Serif Old Uyghur";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
