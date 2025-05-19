{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "big-shoulders-text-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/bigshoulderstext/BigShouldersText%5Bwght%5D.ttf?raw=true";
      name = "BigShouldersText_wght_.ttf";
      sha256 = "fce6c5cf4edec9c9dfb3e7a0f60bef927c881eab72ca17d50fddf4b55f334ed5";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 BigShouldersText_wght_.ttf $out/share/fonts/truetype/BigShouldersText_wght_.ttf
  '';

  meta = with lib; {
    description = "Big Shoulders Text";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
