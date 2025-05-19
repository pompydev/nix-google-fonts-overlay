{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "cormorant-unicase-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/cormorantunicase/CormorantUnicase-Light.ttf?raw=true";
      name = "CormorantUnicase-Light.ttf";
      sha256 = "3cf4f15203a8d6ed559c7a3a1ea10910ef049a3b4863b09bda92d955614dc9b5";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/cormorantunicase/CormorantUnicase-Regular.ttf?raw=true";
      name = "CormorantUnicase-Regular.ttf";
      sha256 = "8fadf0a9ddf4b7d20fbc7c330a740378469fe4f4422c225dd23e6fc5dc028921";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/cormorantunicase/CormorantUnicase-Medium.ttf?raw=true";
      name = "CormorantUnicase-Medium.ttf";
      sha256 = "057870894f166505a6587135e7a2586253a0ee96a35332507e2730ae36dca33f";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/cormorantunicase/CormorantUnicase-SemiBold.ttf?raw=true";
      name = "CormorantUnicase-SemiBold.ttf";
      sha256 = "8e74b41f55bc7e0f199b91086916ad64ed83b7284352d5f4bd39d18ef279238b";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/cormorantunicase/CormorantUnicase-Bold.ttf?raw=true";
      name = "CormorantUnicase-Bold.ttf";
      sha256 = "b934e5e865cd0301e0be8ef15f85006d5479fbb2faf875093ddc36493b8ea845";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 CormorantUnicase-Light.ttf $out/share/fonts/truetype/CormorantUnicase-Light.ttf
     install -Dm644 CormorantUnicase-Regular.ttf $out/share/fonts/truetype/CormorantUnicase-Regular.ttf
     install -Dm644 CormorantUnicase-Medium.ttf $out/share/fonts/truetype/CormorantUnicase-Medium.ttf
     install -Dm644 CormorantUnicase-SemiBold.ttf $out/share/fonts/truetype/CormorantUnicase-SemiBold.ttf
     install -Dm644 CormorantUnicase-Bold.ttf $out/share/fonts/truetype/CormorantUnicase-Bold.ttf
  '';

  meta = with lib; {
    description = "Cormorant Unicase";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
