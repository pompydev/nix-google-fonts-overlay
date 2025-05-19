{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "scheherazade-new-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/scheherazadenew/ScheherazadeNew-Regular.ttf?raw=true";
      name = "ScheherazadeNew-Regular.ttf";
      sha256 = "1774e85edd81a52398da5734b92473781f4926a58f5589b225924e2e8bf23b4d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/scheherazadenew/ScheherazadeNew-Medium.ttf?raw=true";
      name = "ScheherazadeNew-Medium.ttf";
      sha256 = "3bb4e817bbe193fb2e831b9cde713cea85daffc229df058ba52588d9ae554589";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/scheherazadenew/ScheherazadeNew-SemiBold.ttf?raw=true";
      name = "ScheherazadeNew-SemiBold.ttf";
      sha256 = "e0f92109f631398f833bf7f8659fcbe83badbf7a45bff628e9e8a06411396580";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/scheherazadenew/ScheherazadeNew-Bold.ttf?raw=true";
      name = "ScheherazadeNew-Bold.ttf";
      sha256 = "e5fe99c7e07de1074116bab0061c071ca4769480dd3adbb5982dcbaa3b4a7bb0";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 ScheherazadeNew-Regular.ttf $out/share/fonts/truetype/ScheherazadeNew-Regular.ttf
     install -Dm644 ScheherazadeNew-Medium.ttf $out/share/fonts/truetype/ScheherazadeNew-Medium.ttf
     install -Dm644 ScheherazadeNew-SemiBold.ttf $out/share/fonts/truetype/ScheherazadeNew-SemiBold.ttf
     install -Dm644 ScheherazadeNew-Bold.ttf $out/share/fonts/truetype/ScheherazadeNew-Bold.ttf
  '';

  meta = with lib; {
    description = "Scheherazade New";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
