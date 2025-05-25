{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-sharada-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notosanssharada/NotoSansSharada-Regular.ttf?raw=true";
      name = "NotoSansSharada-Regular.ttf";
      sha256 = "2ccfb8e72773d318c03b8414ad82686c97ee65a9825fdb1a388e376c4df13372";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansSharada-Regular.ttf $out/share/fonts/truetype/NotoSansSharada-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Sharada";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
