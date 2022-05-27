{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-devanagari-ui-${version}";
  version = "2022-05-24-065742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansdevanagariui/NotoSansDevanagariUI-Thin.ttf?raw=true";
      name = "NotoSansDevanagariUI-Thin.ttf";
      sha256 = "74a640dd72785855505332c8e02f2499587f89c6c319c9849590d3ce4f691958";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansdevanagariui/NotoSansDevanagariUI-ExtraLight.ttf?raw=true";
      name = "NotoSansDevanagariUI-ExtraLight.ttf";
      sha256 = "44b9cc07a76aa8c4aac181b93f44b1505f580ce2183b601ecf79b6f6dbe0cdb8";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansdevanagariui/NotoSansDevanagariUI-Light.ttf?raw=true";
      name = "NotoSansDevanagariUI-Light.ttf";
      sha256 = "0f66c249feed1e2d164c7d194b73070dab7159a9a329d1c0215e961233d2993e";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansdevanagariui/NotoSansDevanagariUI-Regular.ttf?raw=true";
      name = "NotoSansDevanagariUI-Regular.ttf";
      sha256 = "c0b105d248337435b876d3a3d19b380c9782e452b15f142a0cf7b10f5d29a280";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansdevanagariui/NotoSansDevanagariUI-Medium.ttf?raw=true";
      name = "NotoSansDevanagariUI-Medium.ttf";
      sha256 = "a3ba715b2822f1b76f23b76238ef4aa5a417d4df49815c1979b56af39e6240ce";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansdevanagariui/NotoSansDevanagariUI-SemiBold.ttf?raw=true";
      name = "NotoSansDevanagariUI-SemiBold.ttf";
      sha256 = "660b369a23914f270a9b73ff7db7d8d73c1d1c854141d8ca10aef17b258768f0";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansdevanagariui/NotoSansDevanagariUI-Bold.ttf?raw=true";
      name = "NotoSansDevanagariUI-Bold.ttf";
      sha256 = "c2a648025d13b35674ce39d886b179ffada7202097b42bd4634bf298f08f654e";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansdevanagariui/NotoSansDevanagariUI-ExtraBold.ttf?raw=true";
      name = "NotoSansDevanagariUI-ExtraBold.ttf";
      sha256 = "fd36245aa8535d950b8a22fa52e161646855b36338cffc4a0333610ee7af1267";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansdevanagariui/NotoSansDevanagariUI-Black.ttf?raw=true";
      name = "NotoSansDevanagariUI-Black.ttf";
      sha256 = "544560061449451446610409e6d3a30fbe6d341313e8f0089839a8c38dc6cbb7";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansDevanagariUI-Thin.ttf $out/share/fonts/truetype/NotoSansDevanagariUI-Thin.ttf
     install -Dm644 NotoSansDevanagariUI-ExtraLight.ttf $out/share/fonts/truetype/NotoSansDevanagariUI-ExtraLight.ttf
     install -Dm644 NotoSansDevanagariUI-Light.ttf $out/share/fonts/truetype/NotoSansDevanagariUI-Light.ttf
     install -Dm644 NotoSansDevanagariUI-Regular.ttf $out/share/fonts/truetype/NotoSansDevanagariUI-Regular.ttf
     install -Dm644 NotoSansDevanagariUI-Medium.ttf $out/share/fonts/truetype/NotoSansDevanagariUI-Medium.ttf
     install -Dm644 NotoSansDevanagariUI-SemiBold.ttf $out/share/fonts/truetype/NotoSansDevanagariUI-SemiBold.ttf
     install -Dm644 NotoSansDevanagariUI-Bold.ttf $out/share/fonts/truetype/NotoSansDevanagariUI-Bold.ttf
     install -Dm644 NotoSansDevanagariUI-ExtraBold.ttf $out/share/fonts/truetype/NotoSansDevanagariUI-ExtraBold.ttf
     install -Dm644 NotoSansDevanagariUI-Black.ttf $out/share/fonts/truetype/NotoSansDevanagariUI-Black.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Devanagari UI";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
