{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "comic-neue-${version}";
  version = "2022-05-23-211740";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/23bf052eb5d01205102d72cba29580df2a38c422/ofl/comicneue/ComicNeue-Light.ttf?raw=true";
      name = "ComicNeue-Light.ttf";
      sha256 = "efb91c06dccc264f07f800c0691d40c94e8cfce6183daade0709268bec178f76";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/23bf052eb5d01205102d72cba29580df2a38c422/ofl/comicneue/ComicNeue-LightItalic.ttf?raw=true";
      name = "ComicNeue-LightItalic.ttf";
      sha256 = "a6d36baee09c7025916ddb517835458d15ef890291507197a54875ccc096b927";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/23bf052eb5d01205102d72cba29580df2a38c422/ofl/comicneue/ComicNeue-Regular.ttf?raw=true";
      name = "ComicNeue-Regular.ttf";
      sha256 = "a0ee5a37c8b27c4db0700137d928598b1e23b0089e1546a8961909176b779360";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/23bf052eb5d01205102d72cba29580df2a38c422/ofl/comicneue/ComicNeue-Italic.ttf?raw=true";
      name = "ComicNeue-Italic.ttf";
      sha256 = "e06bfd1552f5c9464c5665733ffd69239b0593885dbb9e059688a5900f78cf98";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/23bf052eb5d01205102d72cba29580df2a38c422/ofl/comicneue/ComicNeue-Bold.ttf?raw=true";
      name = "ComicNeue-Bold.ttf";
      sha256 = "3e7e5fccfd7e0788f317b43312151c1bd5cf058c9697a8d83eac3939050bd61e";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/23bf052eb5d01205102d72cba29580df2a38c422/ofl/comicneue/ComicNeue-BoldItalic.ttf?raw=true";
      name = "ComicNeue-BoldItalic.ttf";
      sha256 = "5c312c2a2fa64eee82f3b87fcfab8f3b12a5e59b043124401d322eb323cfbf16";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 ComicNeue-Light.ttf $out/share/fonts/truetype/ComicNeue-Light.ttf
     install -Dm644 ComicNeue-LightItalic.ttf $out/share/fonts/truetype/ComicNeue-LightItalic.ttf
     install -Dm644 ComicNeue-Regular.ttf $out/share/fonts/truetype/ComicNeue-Regular.ttf
     install -Dm644 ComicNeue-Italic.ttf $out/share/fonts/truetype/ComicNeue-Italic.ttf
     install -Dm644 ComicNeue-Bold.ttf $out/share/fonts/truetype/ComicNeue-Bold.ttf
     install -Dm644 ComicNeue-BoldItalic.ttf $out/share/fonts/truetype/ComicNeue-BoldItalic.ttf
  '';

  meta = with lib; {
    description = "Comic Neue";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
