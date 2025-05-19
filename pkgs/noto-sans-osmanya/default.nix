{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-osmanya-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notosansosmanya/NotoSansOsmanya-Regular.ttf?raw=true";
      name = "NotoSansOsmanya-Regular.ttf";
      sha256 = "8832125f106a0be9d4b7e6442493a96f2d6626b8edb2cc20f53c48e9b73fd5a7";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansOsmanya-Regular.ttf $out/share/fonts/truetype/NotoSansOsmanya-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Osmanya";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
