{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-old-sogdian-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notosansoldsogdian/NotoSansOldSogdian-Regular.ttf?raw=true";
      name = "NotoSansOldSogdian-Regular.ttf";
      sha256 = "3686573e4175d14e8681cdd7bdf10b57762ded8bc3e5a5fa0083e4e14f4f2613";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansOldSogdian-Regular.ttf $out/share/fonts/truetype/NotoSansOldSogdian-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Old Sogdian";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
