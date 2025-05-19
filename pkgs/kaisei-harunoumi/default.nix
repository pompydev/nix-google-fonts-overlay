{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "kaisei-harunoumi-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/kaiseiharunoumi/KaiseiHarunoUmi-Regular.ttf?raw=true";
      name = "KaiseiHarunoUmi-Regular.ttf";
      sha256 = "176e2dac3ffb1659dd85c90666a3ee19d2bb4fce8a8a2315fe630625ac5ab6a7";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/kaiseiharunoumi/KaiseiHarunoUmi-Medium.ttf?raw=true";
      name = "KaiseiHarunoUmi-Medium.ttf";
      sha256 = "1575519fd0fb06092b4a65d2cd8e9c057e3a4352c6f1cba8562450b074b06980";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/kaiseiharunoumi/KaiseiHarunoUmi-Bold.ttf?raw=true";
      name = "KaiseiHarunoUmi-Bold.ttf";
      sha256 = "a10baa36d587245219269e8400da5c1540463c80236b952d6b6cd0485a337f4a";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 KaiseiHarunoUmi-Regular.ttf $out/share/fonts/truetype/KaiseiHarunoUmi-Regular.ttf
     install -Dm644 KaiseiHarunoUmi-Medium.ttf $out/share/fonts/truetype/KaiseiHarunoUmi-Medium.ttf
     install -Dm644 KaiseiHarunoUmi-Bold.ttf $out/share/fonts/truetype/KaiseiHarunoUmi-Bold.ttf
  '';

  meta = with lib; {
    description = "Kaisei HarunoUmi";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
