{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "narnoor-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/narnoor/Narnoor-Regular.ttf?raw=true";
      name = "Narnoor-Regular.ttf";
      sha256 = "6681a857f121a01544c1c0d7a77513b9af0031e92a5087332e9fc924e013acc4";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/narnoor/Narnoor-Medium.ttf?raw=true";
      name = "Narnoor-Medium.ttf";
      sha256 = "ebe19c61409fa6b751a8b9d54282d3927478715b21feae6e2b4ef1deaf0ea729";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/narnoor/Narnoor-SemiBold.ttf?raw=true";
      name = "Narnoor-SemiBold.ttf";
      sha256 = "0ed1c48efff373273f6c857868cb605e10405c13f97f45945d5a4008b78c3d73";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/narnoor/Narnoor-Bold.ttf?raw=true";
      name = "Narnoor-Bold.ttf";
      sha256 = "25217d506f2aa15cd55ee64d3463a85a9767d6bebfd38ac2d08eab6636838a11";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/narnoor/Narnoor-ExtraBold.ttf?raw=true";
      name = "Narnoor-ExtraBold.ttf";
      sha256 = "8a160ae753c3becc1f5ecd36a025f3d415e94505ccbbb080732e15597c1fd3c6";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Narnoor-Regular.ttf $out/share/fonts/truetype/Narnoor-Regular.ttf
     install -Dm644 Narnoor-Medium.ttf $out/share/fonts/truetype/Narnoor-Medium.ttf
     install -Dm644 Narnoor-SemiBold.ttf $out/share/fonts/truetype/Narnoor-SemiBold.ttf
     install -Dm644 Narnoor-Bold.ttf $out/share/fonts/truetype/Narnoor-Bold.ttf
     install -Dm644 Narnoor-ExtraBold.ttf $out/share/fonts/truetype/Narnoor-ExtraBold.ttf
  '';

  meta = with lib; {
    description = "Narnoor";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
