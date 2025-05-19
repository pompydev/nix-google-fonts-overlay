{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "poor-story-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/poorstory/PoorStory-Regular.ttf?raw=true";
      name = "PoorStory-Regular.ttf";
      sha256 = "831ab87f7b5463f9cd83ac249bf386816f3a478f1d226427c88cac907adb7ee2";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PoorStory-Regular.ttf $out/share/fonts/truetype/PoorStory-Regular.ttf
  '';

  meta = with lib; {
    description = "Poor Story";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
