{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-sharada-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notosanssharada/NotoSansSharada-Regular.ttf?raw=true";
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
