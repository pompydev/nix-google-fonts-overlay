{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "brawler-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/brawler/Brawler-Regular.ttf?raw=true";
      name = "Brawler-Regular.ttf";
      sha256 = "5f7fcee66ef84c8b27f92b7cdb973039a6194ab3efcce4b328e4755ccb676831";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/brawler/Brawler-Bold.ttf?raw=true";
      name = "Brawler-Bold.ttf";
      sha256 = "860d9f5094c46bd508bc0477da733461bf5eb8f466080909a3d42ffcb67923ae";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Brawler-Regular.ttf $out/share/fonts/truetype/Brawler-Regular.ttf
     install -Dm644 Brawler-Bold.ttf $out/share/fonts/truetype/Brawler-Bold.ttf
  '';

  meta = with lib; {
    description = "Brawler";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
