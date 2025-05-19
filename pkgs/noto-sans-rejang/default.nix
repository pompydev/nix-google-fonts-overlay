{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-rejang-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notosansrejang/NotoSansRejang-Regular.ttf?raw=true";
      name = "NotoSansRejang-Regular.ttf";
      sha256 = "27a3f1e60bf4ed7b7a5956fea6505e7ac0861397e0ff0acc112ab42451dc40e3";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansRejang-Regular.ttf $out/share/fonts/truetype/NotoSansRejang-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Rejang";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
