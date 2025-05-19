{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "space-mono-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/spacemono/SpaceMono-Regular.ttf?raw=true";
      name = "SpaceMono-Regular.ttf";
      sha256 = "95837e182baeeada83368f7748db28357f0a1b75c6b84ff7065b5edf933c8e18";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/spacemono/SpaceMono-Italic.ttf?raw=true";
      name = "SpaceMono-Italic.ttf";
      sha256 = "eca264c8690a91fe837d19a6badf2d88961610c4c8aafcb196526192a9f258c5";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/spacemono/SpaceMono-Bold.ttf?raw=true";
      name = "SpaceMono-Bold.ttf";
      sha256 = "405e73d41afb7e5906efce206a326af5c956f38e255f35421c260e861e599c59";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/spacemono/SpaceMono-BoldItalic.ttf?raw=true";
      name = "SpaceMono-BoldItalic.ttf";
      sha256 = "cdcc95eddee312879a9728494e595f591cb159f3f276d79bc58673dec7e57138";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 SpaceMono-Regular.ttf $out/share/fonts/truetype/SpaceMono-Regular.ttf
     install -Dm644 SpaceMono-Italic.ttf $out/share/fonts/truetype/SpaceMono-Italic.ttf
     install -Dm644 SpaceMono-Bold.ttf $out/share/fonts/truetype/SpaceMono-Bold.ttf
     install -Dm644 SpaceMono-BoldItalic.ttf $out/share/fonts/truetype/SpaceMono-BoldItalic.ttf
  '';

  meta = with lib; {
    description = "Space Mono";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
