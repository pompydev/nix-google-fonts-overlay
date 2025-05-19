{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "host-grotesk-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/hostgrotesk/HostGrotesk%5Bwght%5D.ttf?raw=true";
      name = "HostGrotesk_wght_.ttf";
      sha256 = "74c77b8e850d58dd3d8b22e39111a73bef3450de9fb57018ef99119f2d484f5d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/hostgrotesk/HostGrotesk-Italic%5Bwght%5D.ttf?raw=true";
      name = "HostGrotesk-Italic_wght_.ttf";
      sha256 = "8e16d5b25106332b4330ab02f59bfeb7bb40ba0c060c3053f4c08d4ca8ae4d22";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 HostGrotesk_wght_.ttf $out/share/fonts/truetype/HostGrotesk_wght_.ttf
     install -Dm644 HostGrotesk-Italic_wght_.ttf $out/share/fonts/truetype/HostGrotesk-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "Host Grotesk";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
