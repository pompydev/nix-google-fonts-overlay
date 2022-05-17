{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "sometype-mono-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/3e17ef3a889832d8411a108f40840a5ab1fff289/ofl/sometypemono/SometypeMono-Regular.ttf?raw=true";
      name = "SometypeMono-Regular.ttf";
      sha256 = "132ef3c6539d18538e9dbe2e59340640fa4fbe40e06ed05affa93d461963e0d4";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/3e17ef3a889832d8411a108f40840a5ab1fff289/ofl/sometypemono/SometypeMono-Italic.ttf?raw=true";
      name = "SometypeMono-Italic.ttf";
      sha256 = "92cf6767f7788a38c0e85915cfc9803b6e43b17b90ab217431fb4b13ba0e1775";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/3e17ef3a889832d8411a108f40840a5ab1fff289/ofl/sometypemono/SometypeMono-Medium.ttf?raw=true";
      name = "SometypeMono-Medium.ttf";
      sha256 = "c0b7b30480a9c9db3de8b7840cc47f5930400637c11799b8513b2236f9442ee6";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/3e17ef3a889832d8411a108f40840a5ab1fff289/ofl/sometypemono/SometypeMono-MediumItalic.ttf?raw=true";
      name = "SometypeMono-MediumItalic.ttf";
      sha256 = "6f707ac593ea2e73f5ad44ef4781295ef040a7bd04aaaa78ebb5ca118a35891e";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/3e17ef3a889832d8411a108f40840a5ab1fff289/ofl/sometypemono/SometypeMono-Bold.ttf?raw=true";
      name = "SometypeMono-Bold.ttf";
      sha256 = "26b89672d4af94aec425f118775264c77fd5c42232fa6606bd90f8ce198522c9";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/3e17ef3a889832d8411a108f40840a5ab1fff289/ofl/sometypemono/SometypeMono-BoldItalic.ttf?raw=true";
      name = "SometypeMono-BoldItalic.ttf";
      sha256 = "6ce216d706ddeab3d2dec7b2c3d95b9c5c8b125eb594c97fda9f11a117361180";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 SometypeMono-Regular.ttf $out/share/fonts/truetype/SometypeMono-Regular.ttf
     install -Dm644 SometypeMono-Italic.ttf $out/share/fonts/truetype/SometypeMono-Italic.ttf
     install -Dm644 SometypeMono-Medium.ttf $out/share/fonts/truetype/SometypeMono-Medium.ttf
     install -Dm644 SometypeMono-MediumItalic.ttf $out/share/fonts/truetype/SometypeMono-MediumItalic.ttf
     install -Dm644 SometypeMono-Bold.ttf $out/share/fonts/truetype/SometypeMono-Bold.ttf
     install -Dm644 SometypeMono-BoldItalic.ttf $out/share/fonts/truetype/SometypeMono-BoldItalic.ttf
  '';

  meta = with lib; {
    description = "Sometype Mono";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
