{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "hubot-sans-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/hubotsans/HubotSans%5Bwdth,wght%5D.ttf?raw=true";
      name = "HubotSans_wdth,wght_.ttf";
      sha256 = "229c7682f64b499668d2f47ac803bbde0b5a63225326c8659ea436748ab29965";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/hubotsans/HubotSans-Italic%5Bwdth,wght%5D.ttf?raw=true";
      name = "HubotSans-Italic_wdth,wght_.ttf";
      sha256 = "785b129a5b9c8f04b4e8883dd26235ef7ae58d862068726a3e254092c28bc829";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 HubotSans_wdth,wght_.ttf $out/share/fonts/truetype/HubotSans_wdth,wght_.ttf
     install -Dm644 HubotSans-Italic_wdth,wght_.ttf $out/share/fonts/truetype/HubotSans-Italic_wdth,wght_.ttf
  '';

  meta = with lib; {
    description = "Hubot Sans";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
