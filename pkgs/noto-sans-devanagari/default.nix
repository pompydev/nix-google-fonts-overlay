{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-devanagari-${version}";
  version = "2022-03-09-183858";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansdevanagari/NotoSansDevanagari-Thin.ttf?raw=true";
      name = "NotoSansDevanagari-Thin.ttf";
      sha256 = "047e9e850ee0cd43f744d472c697be3e43a476766316b16952ff1c7bba374b14";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansdevanagari/NotoSansDevanagari-ExtraLight.ttf?raw=true";
      name = "NotoSansDevanagari-ExtraLight.ttf";
      sha256 = "6df9b6a0ce6ecbccc3c04d8b5d0c36629a668bfc5fdd58c16be55aac0016fb20";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansdevanagari/NotoSansDevanagari-Light.ttf?raw=true";
      name = "NotoSansDevanagari-Light.ttf";
      sha256 = "99b05b08fe100e1fd16b15583aabb4b7ef04e089251df8b7938e8233b3af1a60";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansdevanagari/NotoSansDevanagari-Regular.ttf?raw=true";
      name = "NotoSansDevanagari-Regular.ttf";
      sha256 = "79a470365ccb210fa3c7d8d8ff2e005ef9d983cfd067f735a0caf7e15070ca9f";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansdevanagari/NotoSansDevanagari-Medium.ttf?raw=true";
      name = "NotoSansDevanagari-Medium.ttf";
      sha256 = "b7b74f20a507d6f7b74951a62beb9751afe17b4ef2b8760ecb512aaae5ecfa87";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansdevanagari/NotoSansDevanagari-SemiBold.ttf?raw=true";
      name = "NotoSansDevanagari-SemiBold.ttf";
      sha256 = "bc93fbd30162530914c11f3ebc4745573ff012652b41ce9c39c6c819c7aeceda";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansdevanagari/NotoSansDevanagari-Bold.ttf?raw=true";
      name = "NotoSansDevanagari-Bold.ttf";
      sha256 = "77ad688cfe1dc55185bf4edb4db3c614202c65dd23a1463ad0e23fc52bcc9a5c";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansdevanagari/NotoSansDevanagari-ExtraBold.ttf?raw=true";
      name = "NotoSansDevanagari-ExtraBold.ttf";
      sha256 = "58cfbbb10190c8bdadb67202cee77da2a92ec9278189b99cf1a1e0eb9a9ec22e";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansdevanagari/NotoSansDevanagari-Black.ttf?raw=true";
      name = "NotoSansDevanagari-Black.ttf";
      sha256 = "eba89957d1ecb0f49631ae0ac2ccd05098a7a83eb3c71a02aa46950ff1c9c3b2";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansDevanagari-Thin.ttf $out/share/fonts/truetype/NotoSansDevanagari-Thin.ttf
     install -Dm644 NotoSansDevanagari-ExtraLight.ttf $out/share/fonts/truetype/NotoSansDevanagari-ExtraLight.ttf
     install -Dm644 NotoSansDevanagari-Light.ttf $out/share/fonts/truetype/NotoSansDevanagari-Light.ttf
     install -Dm644 NotoSansDevanagari-Regular.ttf $out/share/fonts/truetype/NotoSansDevanagari-Regular.ttf
     install -Dm644 NotoSansDevanagari-Medium.ttf $out/share/fonts/truetype/NotoSansDevanagari-Medium.ttf
     install -Dm644 NotoSansDevanagari-SemiBold.ttf $out/share/fonts/truetype/NotoSansDevanagari-SemiBold.ttf
     install -Dm644 NotoSansDevanagari-Bold.ttf $out/share/fonts/truetype/NotoSansDevanagari-Bold.ttf
     install -Dm644 NotoSansDevanagari-ExtraBold.ttf $out/share/fonts/truetype/NotoSansDevanagari-ExtraBold.ttf
     install -Dm644 NotoSansDevanagari-Black.ttf $out/share/fonts/truetype/NotoSansDevanagari-Black.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Devanagari";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
