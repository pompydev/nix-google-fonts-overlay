{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-elbasan-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notosanselbasan/NotoSansElbasan-Regular.ttf?raw=true";
      name = "NotoSansElbasan-Regular.ttf";
      sha256 = "fce315f8ec66dd6f627cd8e2d076d622ebb244ef609def9621f820f209eaf576";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansElbasan-Regular.ttf $out/share/fonts/truetype/NotoSansElbasan-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Elbasan";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
