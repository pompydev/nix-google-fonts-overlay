{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-mro-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notosansmro/NotoSansMro-Regular.ttf?raw=true";
      name = "NotoSansMro-Regular.ttf";
      sha256 = "fe05fbcf65aa3a42f446437a6e2db4e9ccf2a1d2fd85fddfd93af3df1d729cf9";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansMro-Regular.ttf $out/share/fonts/truetype/NotoSansMro-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Mro";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
