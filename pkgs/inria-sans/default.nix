{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "inria-sans-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/inriasans/InriaSans-Light.ttf?raw=true";
      name = "InriaSans-Light.ttf";
      sha256 = "3fa3c428c58feb7a173eb6b0c36d4b68d8ca6cb8c246e5e24dd3e6baf933864e";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/inriasans/InriaSans-LightItalic.ttf?raw=true";
      name = "InriaSans-LightItalic.ttf";
      sha256 = "c025a4fc153031f1b0737c3411215902d9bee6e2a00843f66343483df8e06ec8";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/inriasans/InriaSans-Regular.ttf?raw=true";
      name = "InriaSans-Regular.ttf";
      sha256 = "e213607deb9cf56875540839a1d97944b2bf9ba49f0a510ef368f1d87848d327";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/inriasans/InriaSans-Italic.ttf?raw=true";
      name = "InriaSans-Italic.ttf";
      sha256 = "482c649c1f6a0e9e6a1f54d5603f89e254c8cd8b20af9edce8db8199bdfa9bc9";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/inriasans/InriaSans-Bold.ttf?raw=true";
      name = "InriaSans-Bold.ttf";
      sha256 = "bb4158187c943e565f20fc1b81d88335ba847dc318b1e12c5d8a24fb0e461bfa";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/inriasans/InriaSans-BoldItalic.ttf?raw=true";
      name = "InriaSans-BoldItalic.ttf";
      sha256 = "1097884c009cfc6f183a4ede46d6b8661c34a3e121b3f7ffd01e1fd17d0f222a";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 InriaSans-Light.ttf $out/share/fonts/truetype/InriaSans-Light.ttf
     install -Dm644 InriaSans-LightItalic.ttf $out/share/fonts/truetype/InriaSans-LightItalic.ttf
     install -Dm644 InriaSans-Regular.ttf $out/share/fonts/truetype/InriaSans-Regular.ttf
     install -Dm644 InriaSans-Italic.ttf $out/share/fonts/truetype/InriaSans-Italic.ttf
     install -Dm644 InriaSans-Bold.ttf $out/share/fonts/truetype/InriaSans-Bold.ttf
     install -Dm644 InriaSans-BoldItalic.ttf $out/share/fonts/truetype/InriaSans-BoldItalic.ttf
  '';

  meta = with lib; {
    description = "Inria Sans";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
