{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "gfs-neohellenic-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/gfsneohellenic/GFSNeohellenic.ttf?raw=true";
      name = "GFSNeohellenic.ttf";
      sha256 = "14d54dd7f36fdd7140d3f6357c99a8ead988a808b298471e02ba2c0992aa110d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/gfsneohellenic/GFSNeohellenicItalic.ttf?raw=true";
      name = "GFSNeohellenicItalic.ttf";
      sha256 = "39214ba27aec72823881bdc967b6b8929079609749db1911eda0f7072e461688";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/gfsneohellenic/GFSNeohellenicBold.ttf?raw=true";
      name = "GFSNeohellenicBold.ttf";
      sha256 = "b1a3900f5f3327ab79d18c762fca17e46c0db37a32fbf34f7dca41458bd46f53";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/gfsneohellenic/GFSNeohellenicBoldItalic.ttf?raw=true";
      name = "GFSNeohellenicBoldItalic.ttf";
      sha256 = "b486c325aadd1c7dc4f5a87c41ae9c8823ea7285de9d7ad8f8fa6e836d41cad1";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 GFSNeohellenic.ttf $out/share/fonts/truetype/GFSNeohellenic.ttf
     install -Dm644 GFSNeohellenicItalic.ttf $out/share/fonts/truetype/GFSNeohellenicItalic.ttf
     install -Dm644 GFSNeohellenicBold.ttf $out/share/fonts/truetype/GFSNeohellenicBold.ttf
     install -Dm644 GFSNeohellenicBoldItalic.ttf $out/share/fonts/truetype/GFSNeohellenicBoldItalic.ttf
  '';

  meta = with lib; {
    description = "GFS Neohellenic";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
