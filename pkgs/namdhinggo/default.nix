{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "namdhinggo-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/namdhinggo/Namdhinggo-Regular.ttf?raw=true";
      name = "Namdhinggo-Regular.ttf";
      sha256 = "fdf20478b42495053869abe4d8a16d273e418e3a343f5261a1e48770912b7e5a";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/namdhinggo/Namdhinggo-Medium.ttf?raw=true";
      name = "Namdhinggo-Medium.ttf";
      sha256 = "c37b90c812c6679eca031d49eab12b499ffd5d66f9845edc0b4ce877a72c69e3";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/namdhinggo/Namdhinggo-SemiBold.ttf?raw=true";
      name = "Namdhinggo-SemiBold.ttf";
      sha256 = "62604448b98a7e364ca1eb321c64b34b28884581cb6d2edf1b6455a58cc8f764";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/namdhinggo/Namdhinggo-Bold.ttf?raw=true";
      name = "Namdhinggo-Bold.ttf";
      sha256 = "69523d079c45e6dbc82f9000c505b7a90b0b804cf705cb8864a5031c46b93c61";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/namdhinggo/Namdhinggo-ExtraBold.ttf?raw=true";
      name = "Namdhinggo-ExtraBold.ttf";
      sha256 = "7a0780a1d6b3df02d13c03427dff4fd518d514b829258cf4146d36e78d9c2178";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Namdhinggo-Regular.ttf $out/share/fonts/truetype/Namdhinggo-Regular.ttf
     install -Dm644 Namdhinggo-Medium.ttf $out/share/fonts/truetype/Namdhinggo-Medium.ttf
     install -Dm644 Namdhinggo-SemiBold.ttf $out/share/fonts/truetype/Namdhinggo-SemiBold.ttf
     install -Dm644 Namdhinggo-Bold.ttf $out/share/fonts/truetype/Namdhinggo-Bold.ttf
     install -Dm644 Namdhinggo-ExtraBold.ttf $out/share/fonts/truetype/Namdhinggo-ExtraBold.ttf
  '';

  meta = with lib; {
    description = "Namdhinggo";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
