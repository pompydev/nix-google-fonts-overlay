{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "poor-story-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/poorstory/PoorStory-Regular.ttf?raw=true";
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
