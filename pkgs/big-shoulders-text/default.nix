{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "big-shoulders-text-${version}";
  version = "2022-05-23-211740";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/7f3f5f3c77f14cdfa507619a22dd1d72d87a5a17/ofl/bigshoulderstext/BigShouldersText%5Bwght%5D.ttf?raw=true";
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
