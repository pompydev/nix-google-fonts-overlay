{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "karla-tamil-inclined-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/karlatamilinclined/KarlaTamilInclined-Regular.ttf?raw=true";
      name = "KarlaTamilInclined-Regular.ttf";
      sha256 = "d563ace3a74ca1ce9c02cd32fb6dca5de7974f53de3304ac734980e02ba4f1c9";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/karlatamilinclined/KarlaTamilInclined-Bold.ttf?raw=true";
      name = "KarlaTamilInclined-Bold.ttf";
      sha256 = "57788fe46fa9b701cf284104c0946c6f2ef669cb7e39fbca404a41e315eed0e5";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 KarlaTamilInclined-Regular.ttf $out/share/fonts/truetype/KarlaTamilInclined-Regular.ttf
     install -Dm644 KarlaTamilInclined-Bold.ttf $out/share/fonts/truetype/KarlaTamilInclined-Bold.ttf
  '';

  meta = with lib; {
    description = "Karla Tamil Inclined";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
