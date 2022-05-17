{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "sen-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/10fb163796367343ddf30a0c7d3b1e4110d1a9d0/ofl/sen/Sen-Regular.ttf?raw=true";
      name = "Sen-Regular.ttf";
      sha256 = "29be436d202d43b520b4fb7592ab794f01e84aeaf1ac370f86e7c5458264de0d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/10fb163796367343ddf30a0c7d3b1e4110d1a9d0/ofl/sen/Sen-Bold.ttf?raw=true";
      name = "Sen-Bold.ttf";
      sha256 = "c4d9f104aad770957c41cc45e2876fbd28e1ce143e0387bc2b4e6ebf1209c906";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/10fb163796367343ddf30a0c7d3b1e4110d1a9d0/ofl/sen/Sen-ExtraBold.ttf?raw=true";
      name = "Sen-ExtraBold.ttf";
      sha256 = "008ce421f96a72fbe30aaed61fd0951942086aa80d95f861364b6bb69b5f3c8e";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Sen-Regular.ttf $out/share/fonts/truetype/Sen-Regular.ttf
     install -Dm644 Sen-Bold.ttf $out/share/fonts/truetype/Sen-Bold.ttf
     install -Dm644 Sen-ExtraBold.ttf $out/share/fonts/truetype/Sen-ExtraBold.ttf
  '';

  meta = with lib; {
    description = "Sen";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
