{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "lxgw-wenkai-tc-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/lxgwwenkaitc/LXGWWenKaiTC-Light.ttf?raw=true";
      name = "LXGWWenKaiTC-Light.ttf";
      sha256 = "48cabec60b908f145002192c366d805b674d6e890a98c24f8a39fd33542273fd";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/lxgwwenkaitc/LXGWWenKaiTC-Regular.ttf?raw=true";
      name = "LXGWWenKaiTC-Regular.ttf";
      sha256 = "4fcc5aec11cbbf737b0cfab7b63796f7f280087a7a656b2f13342cd5e5318d95";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/lxgwwenkaitc/LXGWWenKaiTC-Bold.ttf?raw=true";
      name = "LXGWWenKaiTC-Bold.ttf";
      sha256 = "5c9feadfd928f3ae3860e7d001ad3d0d0c55b0157fff08cd4d51b51aca677f23";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 LXGWWenKaiTC-Light.ttf $out/share/fonts/truetype/LXGWWenKaiTC-Light.ttf
     install -Dm644 LXGWWenKaiTC-Regular.ttf $out/share/fonts/truetype/LXGWWenKaiTC-Regular.ttf
     install -Dm644 LXGWWenKaiTC-Bold.ttf $out/share/fonts/truetype/LXGWWenKaiTC-Bold.ttf
  '';

  meta = with lib; {
    description = "LXGW WenKai TC";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
