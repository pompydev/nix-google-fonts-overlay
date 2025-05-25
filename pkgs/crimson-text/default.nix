{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "crimson-text-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/crimsontext/CrimsonText-Regular.ttf?raw=true";
      name = "CrimsonText-Regular.ttf";
      sha256 = "48e6c5d5ad1d01599d374ecb817e15890d1feb3b8a3a88e527d44c90389e1f06";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/crimsontext/CrimsonText-Italic.ttf?raw=true";
      name = "CrimsonText-Italic.ttf";
      sha256 = "4ed1699ac7c64e8b3d33f6bb8323c3d7206b0d7bacb9ee2d65c697e6014d29de";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/crimsontext/CrimsonText-SemiBold.ttf?raw=true";
      name = "CrimsonText-SemiBold.ttf";
      sha256 = "802e84000740fec2a9fbe0ae09b6b6811bd86a78a0173b15d44450a1530e9410";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/crimsontext/CrimsonText-SemiBoldItalic.ttf?raw=true";
      name = "CrimsonText-SemiBoldItalic.ttf";
      sha256 = "8f4a0db2d181ba4493a4ad53042edc3b57ab50fedd8fa32c7b2ad57173208543";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/crimsontext/CrimsonText-Bold.ttf?raw=true";
      name = "CrimsonText-Bold.ttf";
      sha256 = "a3a0765fc5e8d0b49b540a23aefe0184887dd79f06a0bdf4db7035cea6befa93";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/crimsontext/CrimsonText-BoldItalic.ttf?raw=true";
      name = "CrimsonText-BoldItalic.ttf";
      sha256 = "467013e913e46304760461c46661c994b2aa1769e3fbd31371026300315181b4";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 CrimsonText-Regular.ttf $out/share/fonts/truetype/CrimsonText-Regular.ttf
     install -Dm644 CrimsonText-Italic.ttf $out/share/fonts/truetype/CrimsonText-Italic.ttf
     install -Dm644 CrimsonText-SemiBold.ttf $out/share/fonts/truetype/CrimsonText-SemiBold.ttf
     install -Dm644 CrimsonText-SemiBoldItalic.ttf $out/share/fonts/truetype/CrimsonText-SemiBoldItalic.ttf
     install -Dm644 CrimsonText-Bold.ttf $out/share/fonts/truetype/CrimsonText-Bold.ttf
     install -Dm644 CrimsonText-BoldItalic.ttf $out/share/fonts/truetype/CrimsonText-BoldItalic.ttf
  '';

  meta = with lib; {
    description = "Crimson Text";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
