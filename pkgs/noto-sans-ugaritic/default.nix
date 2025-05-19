{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-ugaritic-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notosansugaritic/NotoSansUgaritic-Regular.ttf?raw=true";
      name = "NotoSansUgaritic-Regular.ttf";
      sha256 = "68d5a37ab45ba3ab091dda2aa392698963a90e2b399e131394892b8224da6491";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansUgaritic-Regular.ttf $out/share/fonts/truetype/NotoSansUgaritic-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Ugaritic";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
