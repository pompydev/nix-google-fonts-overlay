{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "m-plus-rounded-1c-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/mplusrounded1c/MPLUSRounded1c-Thin.ttf?raw=true";
      name = "MPLUSRounded1c-Thin.ttf";
      sha256 = "180c0959fff5af21637c3887c0ec47df8164877218ef7e866a7a227f2c1e1a9f";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/mplusrounded1c/MPLUSRounded1c-Light.ttf?raw=true";
      name = "MPLUSRounded1c-Light.ttf";
      sha256 = "ade5c673a5d097b59c7bc5b1a6c1e37d3dd63c3ac98468a647d8ab2392b98b49";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/mplusrounded1c/MPLUSRounded1c-Regular.ttf?raw=true";
      name = "MPLUSRounded1c-Regular.ttf";
      sha256 = "b75708b53e45b06d17d470aeeca5b766e3d1b3999f03f13ec4eb863ca846c14c";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/mplusrounded1c/MPLUSRounded1c-Medium.ttf?raw=true";
      name = "MPLUSRounded1c-Medium.ttf";
      sha256 = "adfde1b6bae58719c4e0144612a94232e72fc5ca655c4722165fe88d06521a70";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/mplusrounded1c/MPLUSRounded1c-Bold.ttf?raw=true";
      name = "MPLUSRounded1c-Bold.ttf";
      sha256 = "c358630584e8e2d8fbd6121d0f4693255ffef6d1e6d4f3441fd6e5a963a11f9e";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/mplusrounded1c/MPLUSRounded1c-ExtraBold.ttf?raw=true";
      name = "MPLUSRounded1c-ExtraBold.ttf";
      sha256 = "8e7c15901dca87f1451b356dda594f7d092ba252a5dcc47da74523a242493c36";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/mplusrounded1c/MPLUSRounded1c-Black.ttf?raw=true";
      name = "MPLUSRounded1c-Black.ttf";
      sha256 = "d5981a59ccc5f00da1bd3ae46750fa95cd165b0e6b3a5fc7a1945f94c59449e3";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 MPLUSRounded1c-Thin.ttf $out/share/fonts/truetype/MPLUSRounded1c-Thin.ttf
     install -Dm644 MPLUSRounded1c-Light.ttf $out/share/fonts/truetype/MPLUSRounded1c-Light.ttf
     install -Dm644 MPLUSRounded1c-Regular.ttf $out/share/fonts/truetype/MPLUSRounded1c-Regular.ttf
     install -Dm644 MPLUSRounded1c-Medium.ttf $out/share/fonts/truetype/MPLUSRounded1c-Medium.ttf
     install -Dm644 MPLUSRounded1c-Bold.ttf $out/share/fonts/truetype/MPLUSRounded1c-Bold.ttf
     install -Dm644 MPLUSRounded1c-ExtraBold.ttf $out/share/fonts/truetype/MPLUSRounded1c-ExtraBold.ttf
     install -Dm644 MPLUSRounded1c-Black.ttf $out/share/fonts/truetype/MPLUSRounded1c-Black.ttf
  '';

  meta = with lib; {
    description = "M PLUS Rounded 1c";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
