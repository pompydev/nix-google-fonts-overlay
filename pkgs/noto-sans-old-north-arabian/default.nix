{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-old-north-arabian-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notosansoldnortharabian/NotoSansOldNorthArabian-Regular.ttf?raw=true";
      name = "NotoSansOldNorthArabian-Regular.ttf";
      sha256 = "27e42ee27587eda9c2521650cca938d4b247e00d55603b0abab0789c2eb2cccb";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansOldNorthArabian-Regular.ttf $out/share/fonts/truetype/NotoSansOldNorthArabian-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Old North Arabian";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
