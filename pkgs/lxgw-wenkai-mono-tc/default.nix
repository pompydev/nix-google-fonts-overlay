{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "lxgw-wenkai-mono-tc-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/lxgwwenkaimonotc/LXGWWenKaiMonoTC-Light.ttf?raw=true";
      name = "LXGWWenKaiMonoTC-Light.ttf";
      sha256 = "b61aa17e05c027cb8ce3768516795ef92a3363f8f537f385797dba7045bc453c";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/lxgwwenkaimonotc/LXGWWenKaiMonoTC-Regular.ttf?raw=true";
      name = "LXGWWenKaiMonoTC-Regular.ttf";
      sha256 = "ea6707f71c862f4f255cbe510148b676ca8f5360872633de88694f8004f3f8b3";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/lxgwwenkaimonotc/LXGWWenKaiMonoTC-Bold.ttf?raw=true";
      name = "LXGWWenKaiMonoTC-Bold.ttf";
      sha256 = "b3c9b93d8074e1ee8ff8b2f49388f26f6528d5cd614ba7d61ea4d45645c9a3e8";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 LXGWWenKaiMonoTC-Light.ttf $out/share/fonts/truetype/LXGWWenKaiMonoTC-Light.ttf
     install -Dm644 LXGWWenKaiMonoTC-Regular.ttf $out/share/fonts/truetype/LXGWWenKaiMonoTC-Regular.ttf
     install -Dm644 LXGWWenKaiMonoTC-Bold.ttf $out/share/fonts/truetype/LXGWWenKaiMonoTC-Bold.ttf
  '';

  meta = with lib; {
    description = "LXGW WenKai Mono TC";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
