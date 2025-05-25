{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-mandaic-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notosansmandaic/NotoSansMandaic-Regular.ttf?raw=true";
      name = "NotoSansMandaic-Regular.ttf";
      sha256 = "28f9cdd5221c0c0ce42871996a3ca716e0f2f7be5131423e51021c6397be0fdc";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansMandaic-Regular.ttf $out/share/fonts/truetype/NotoSansMandaic-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Mandaic";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
