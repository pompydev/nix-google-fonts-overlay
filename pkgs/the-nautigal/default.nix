{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "the-nautigal-${version}";
  version = "2022-05-23-231859";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/78b7801b517f6d39ff033c9e72b3a08d08893b8b/ofl/thenautigal/TheNautigal-Regular.ttf?raw=true";
      name = "TheNautigal-Regular.ttf";
      sha256 = "c7239b999c0d8127683116c8563307f0adbd63f7b16b342c180f8196941eca67";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/78b7801b517f6d39ff033c9e72b3a08d08893b8b/ofl/thenautigal/TheNautigal-Bold.ttf?raw=true";
      name = "TheNautigal-Bold.ttf";
      sha256 = "d51898da90096cefd2edfc5aa4fea2bdde3bad012ba1de08ae659f06bb420e6f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 TheNautigal-Regular.ttf $out/share/fonts/truetype/TheNautigal-Regular.ttf
     install -Dm644 TheNautigal-Bold.ttf $out/share/fonts/truetype/TheNautigal-Bold.ttf
  '';

  meta = with lib; {
    description = "The Nautigal";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
