# This file was generated by nvfetcher, please do not modify it manually.
{ fetchgit, fetchurl, fetchFromGitHub }:
{
  adguardhome-darwin-amd64 = {
    pname = "adguardhome-darwin-amd64";
    version = "0.107.2";
    src = fetchurl {
      url = "https://github.com/AdguardTeam/AdGuardHome/releases/download/v0.107.2/AdGuardHome_darwin_amd64.zip";
      sha256 = "sha256-hfsdiZz6JGFDwkslVmRD6xCxdPygNsZOpX0/frbzgI8=";
    };
  };
  adguardhome-linux-386 = {
    pname = "adguardhome-linux-386";
    version = "0.107.2";
    src = fetchurl {
      url = "https://github.com/AdguardTeam/AdGuardHome/releases/download/v0.107.2/AdGuardHome_linux_386.tar.gz";
      sha256 = "sha256-WnY6JBEbsWUXXaxYPaMPKKJuqnVWR4E+rSLGvTTqRH8=";
    };
  };
  adguardhome-linux-amd64 = {
    pname = "adguardhome-linux-amd64";
    version = "0.107.2";
    src = fetchurl {
      url = "https://github.com/AdguardTeam/AdGuardHome/releases/download/v0.107.2/AdGuardHome_linux_amd64.tar.gz";
      sha256 = "sha256-OW9hAjEUPoiSnC41AFguSRP/HV5F+ZVk2+G85dtZh1I=";
    };
  };
  adguardhome-linux-arm64 = {
    pname = "adguardhome-linux-arm64";
    version = "0.107.2";
    src = fetchurl {
      url = "https://github.com/AdguardTeam/AdGuardHome/releases/download/v0.107.2/AdGuardHome_linux_arm64.tar.gz";
      sha256 = "sha256-YzWRFJ5Pk+iFDSvqrowSqEj0BZ8lgc4nV6+kxPCsb6M=";
    };
  };
  adl = {
    pname = "adl";
    version = "45b1dd4cb9350cde6b1fb8bc03d098c6864efcd5";
    src = fetchFromGitHub ({
      owner = "RaitaroH";
      repo = "adl";
      rev = "45b1dd4cb9350cde6b1fb8bc03d098c6864efcd5";
      fetchSubmodules = false;
      sha256 = "sha256-AgIUMKo2mylkU/5Lhqz0PCmHEqQKQdPHnIZaqo8dr+o=";
    });
  };
  anbox = {
    pname = "anbox";
    version = "84f0268012cbe322ad858d76613f4182074510ac";
    src = fetchFromGitHub ({
      owner = "anbox";
      repo = "anbox";
      rev = "84f0268012cbe322ad858d76613f4182074510ac";
      fetchSubmodules = true;
      sha256 = "sha256-QXWhatewiUDQ93cH1UZsYgbjUxpgB1ajtGFYZnKmabc=";
    });
  };
  anime-downloader = {
    pname = "anime-downloader";
    version = "17fb8fe8bcf0525cc2052b37492c7f6fc2f56454";
    src = fetchFromGitHub ({
      owner = "anime-dl";
      repo = "anime-downloader";
      rev = "17fb8fe8bcf0525cc2052b37492c7f6fc2f56454";
      fetchSubmodules = false;
      sha256 = "sha256-DPA9FB0nk3lruRpFp2oql6GvaESkcao0iWenphD1qes=";
    });
  };
  any-nix-shell = {
    pname = "any-nix-shell";
    version = "ea04f9bd639f175002127ad1b5715bce3d4bd9c5";
    src = fetchFromGitHub ({
      owner = "haslersn";
      repo = "any-nix-shell";
      rev = "ea04f9bd639f175002127ad1b5715bce3d4bd9c5";
      fetchSubmodules = false;
      sha256 = "sha256-E6Q7nVPuoC81aGMYOFkmlRv1i6eoOtbYw2AeCCXMR2A=";
    });
  };
  arkenfox-userjs = {
    pname = "arkenfox-userjs";
    version = "7016c2050d20d53242c30eaf0b3beca947e172f6";
    src = fetchFromGitHub ({
      owner = "arkenfox";
      repo = "user.js";
      rev = "7016c2050d20d53242c30eaf0b3beca947e172f6";
      fetchSubmodules = false;
      sha256 = "sha256-jbeIcYhHWJmbeIMd0hZO/n3aNgxSTv9iMwS65eWob2I=";
    });
  };
  avizo = {
    pname = "avizo";
    version = "4e1f2200d497c8b0e0c372195aee627bcdc89a08";
    src = fetchFromGitHub ({
      owner = "misterdanb";
      repo = "avizo";
      rev = "4e1f2200d497c8b0e0c372195aee627bcdc89a08";
      fetchSubmodules = false;
      sha256 = "sha256-xQLgemNlIcqb47uf3tYiMK1vXyyUHCKUywFJTfEuayo=";
    });
  };
  awesome = {
    pname = "awesome";
    version = "7451c6952e0a24bd54edc0f7ecff6ad46ef65dcb";
    src = fetchFromGitHub ({
      owner = "awesomeWM";
      repo = "awesome";
      rev = "7451c6952e0a24bd54edc0f7ecff6ad46ef65dcb";
      fetchSubmodules = false;
      sha256 = "sha256-5mxa7rid/meFrBUY9GBuJlHGOU9OJJP0hwIRMvSwh58=";
    });
  };
  awestore = {
    pname = "awestore";
    version = "5509786a1d5bc538dcdde027bd07b35bc29b0df1";
    src = fetchFromGitHub ({
      owner = "K4rakara";
      repo = "awestore";
      rev = "5509786a1d5bc538dcdde027bd07b35bc29b0df1";
      fetchSubmodules = false;
      sha256 = "sha256-VuMmEf5bCifXKHerTyFOYW4w4fXA83HM02Oj4VmQOeo=";
    });
  };
  bling = {
    pname = "bling";
    version = "e0423796b075b21cf3252a9d59b6c23dbf2bb46c";
    src = fetchFromGitHub ({
      owner = "BlingCorp";
      repo = "bling";
      rev = "e0423796b075b21cf3252a9d59b6c23dbf2bb46c";
      fetchSubmodules = false;
      sha256 = "sha256-l5FifujhIu1z2aLViwK7c74MZXl3ZauGklQixtFybN0=";
    });
  };
  bottles = {
    pname = "bottles";
    version = "c9cc9258678b3c50916fe9b5376b9f91b73015c7";
    src = fetchFromGitHub ({
      owner = "bottlesdevs";
      repo = "Bottles";
      rev = "c9cc9258678b3c50916fe9b5376b9f91b73015c7";
      fetchSubmodules = false;
      sha256 = "sha256-e+q8ufD8eIPtWn8vjotkksdTXHERbW0AabJlixszBuA=";
    });
  };
  caddy = {
    pname = "caddy";
    version = "5333c3528bd2badf1676efcced322d151e3706c8";
    src = fetchFromGitHub ({
      owner = "caddyserver";
      repo = "caddy";
      rev = "5333c3528bd2badf1676efcced322d151e3706c8";
      fetchSubmodules = false;
      sha256 = "sha256-cF9/xZDAK03LmDQu4fbQkntDmGl6st26ni2rpNreQMo=";
    });
  };
  cups-pdf = {
    pname = "cups-pdf";
    version = "3.0.1";
    src = fetchurl {
      url = "https://www.cups-pdf.de/src/cups-pdf_3.0.1.tar.gz";
      sha256 = "sha256-c4Zp7f9/FGn+XkESAth/k7oltF8zKmI/tgfUnFmqlTE=";
    };
  };
  discord-canary = {
    pname = "discord-canary";
    version = "0.0.131";
    src = fetchurl {
      url = "https://dl-canary.discordapp.net/apps/linux/0.0.131/discord-canary-0.0.131.tar.gz";
      sha256 = "sha256-ZYPdE02Jq79LmvXu7KIJFugJX++Nnj0Og/mBuaP/+SA=";
    };
  };
  dnscrypt-proxy2 = {
    pname = "dnscrypt-proxy2";
    version = "53f3a0e63d45ce90bcb7c36a441f3ceeaffb214a";
    src = fetchFromGitHub ({
      owner = "DNSCrypt";
      repo = "dnscrypt-proxy";
      rev = "53f3a0e63d45ce90bcb7c36a441f3ceeaffb214a";
      fetchSubmodules = false;
      sha256 = "sha256-XefitjRwvXOIL9DsaN4xgkyObBcBWcZSwTuPJmeG734=";
    });
  };
  doggo = {
    pname = "doggo";
    version = "9ae8b0a3f24489da62291cfee0561ae9cf214c15";
    src = fetchFromGitHub ({
      owner = "mr-karan";
      repo = "doggo";
      rev = "9ae8b0a3f24489da62291cfee0561ae9cf214c15";
      fetchSubmodules = false;
      sha256 = "sha256-JiBpocumhdPXDx4sYJaelfm/7UheHB08sEkgi6hwTfs=";
    });
  };
  dribbblish-dynamic-theme = {
    pname = "dribbblish-dynamic-theme";
    version = "13186767e8790a6bfb8502da1846fc800029150e";
    src = fetchFromGitHub ({
      owner = "JulienMaille";
      repo = "dribbblish-dynamic-theme";
      rev = "13186767e8790a6bfb8502da1846fc800029150e";
      fetchSubmodules = false;
      sha256 = "sha256-FgzHcQG7zMuYamrgdMJYCnCB0smHmpSMEDkvErAo7zc=";
    });
  };
  droidcam = {
    pname = "droidcam";
    version = "1a8ac86b5941d7784c73300d63654db7296d4319";
    src = fetchFromGitHub ({
      owner = "aramg";
      repo = "droidcam";
      rev = "1a8ac86b5941d7784c73300d63654db7296d4319";
      fetchSubmodules = false;
      sha256 = "sha256-3iA7GDTiCx5vHawj8ZBFAK0BIfmxEFuQrVfL7Gi6FhM=";
    });
  };
  duf = {
    pname = "duf";
    version = "ca80cac8339e32deba9c79b07c689300025107a4";
    src = fetchFromGitHub ({
      owner = "muesli";
      repo = "duf";
      rev = "ca80cac8339e32deba9c79b07c689300025107a4";
      fetchSubmodules = false;
      sha256 = "sha256-rAXU4IufIfNhpgiJ1NGJRByuVfaycejcu6AYTIGBW1E=";
    });
  };
  eww = {
    pname = "eww";
    version = "106106ade31e7cc669f2ae53f24191cd0a683c39";
    src = fetchFromGitHub ({
      owner = "elkowar";
      repo = "eww";
      rev = "106106ade31e7cc669f2ae53f24191cd0a683c39";
      fetchSubmodules = false;
      sha256 = "sha256-VntDl7JaIfvn3pd+2uDocnXFRkPnQQbRkYDn4XWeC5o=";
    });
    cargoLock = {
      lockFile = ./eww-106106ade31e7cc669f2ae53f24191cd0a683c39/Cargo.lock;
      outputHashes = { };
    };
  };
  fake-background-webcam = {
    pname = "fake-background-webcam";
    version = "ba100796e2ea383de02a59a23c8cd05b917529f7";
    src = fetchFromGitHub ({
      owner = "fangfufu";
      repo = "Linux-Fake-Background-Webcam";
      rev = "ba100796e2ea383de02a59a23c8cd05b917529f7";
      fetchSubmodules = false;
      sha256 = "sha256-JkdY2G6y9zimEdfHxjnJd5M+0OAgL85nABAqBTMZAk8=";
    });
  };
  flameshot = {
    pname = "flameshot";
    version = "fcadc02a293f14a3e88a85744fae45decdf79915";
    src = fetchFromGitHub ({
      owner = "flameshot-org";
      repo = "flameshot";
      rev = "fcadc02a293f14a3e88a85744fae45decdf79915";
      fetchSubmodules = false;
      sha256 = "sha256-gZPgpWoP0TZJllvJ83ksZTHaQJdqm7m3lMLj9EOSKKc=";
    });
  };
  flyingfox = {
    pname = "flyingfox";
    version = "4a6ba46cafc189ad628ee13bb8d3eef3e69fbced";
    src = fetchFromGitHub ({
      owner = "akshat46";
      repo = "FlyingFox";
      rev = "4a6ba46cafc189ad628ee13bb8d3eef3e69fbced";
      fetchSubmodules = false;
      sha256 = "sha256-ZUTQ2VvIAEPbLnEX2AYScAGTM3hWp7vUuGCz2wd8qG0=";
    });
  };
  frece = {
    pname = "frece";
    version = "d4071c6c852e68dda82b7ab0bfb0f141b39d4484";
    src = fetchFromGitHub ({
      owner = "YodaEmbedding";
      repo = "frece";
      rev = "d4071c6c852e68dda82b7ab0bfb0f141b39d4484";
      fetchSubmodules = false;
      sha256 = "sha256-lLSRLcnUJqWCEIJEOVHANzxTI+xR3VegRHtjHHI0gTs=";
    });
    cargoLock = {
      lockFile = ./frece-d4071c6c852e68dda82b7ab0bfb0f141b39d4484/Cargo.lock;
      outputHashes = { };
    };
  };
  guiscrcpy = {
    pname = "guiscrcpy";
    version = "44da9572c84d16345cae776e0a81812779c5e0ee";
    src = fetchFromGitHub ({
      owner = "srevinsaju";
      repo = "guiscrcpy";
      rev = "44da9572c84d16345cae776e0a81812779c5e0ee";
      fetchSubmodules = false;
      sha256 = "sha256-6KjyHc5KuzVhMnmIBvTWbryFFoSNemDL9CpVXbk3CoM=";
    });
  };
  ibus = {
    pname = "ibus";
    version = "675b94f63a2bce5554c9bb28a03462ed70933bec";
    src = fetchFromGitHub ({
      owner = "ibus";
      repo = "ibus";
      rev = "675b94f63a2bce5554c9bb28a03462ed70933bec";
      fetchSubmodules = false;
      sha256 = "sha256-eATfAm9VoNDeYZqtuZrxaqRXrTfoSPCkaAelWaR/t8E=";
    });
  };
  ibus-bamboo = {
    pname = "ibus-bamboo";
    version = "f6406437969b8e40c5e529cad0055d894fad2c7a";
    src = fetchFromGitHub ({
      owner = "BambooEngine";
      repo = "ibus-bamboo";
      rev = "f6406437969b8e40c5e529cad0055d894fad2c7a";
      fetchSubmodules = false;
      sha256 = "sha256-w68I1a1mMEGgF4oCzs5TvYmXTdpQPJog/S42Dz519i4=";
    });
  };
  jibri = {
    pname = "jibri";
    version = "8.0-115-gddb146c";
    src = fetchurl {
      url = "https://download.jitsi.org/unstable/jibri_8.0-115-gddb146c-1_all.deb";
      sha256 = "sha256-/FWaJwuf+d4AVPgYD6tYWeHy0cOjaUHnSiD/7DwjJsU=";
    };
  };
  jicofo = {
    pname = "jicofo";
    version = "1.0-839";
    src = fetchurl {
      url = "https://download.jitsi.org/unstable/jicofo_1.0-839-1_all.deb";
      sha256 = "sha256-1l+jeZ3liT7c9Ol5WJtkAzLXVgPPw0i0kWRELE7JpbY=";
    };
  };
  jitsi-meet = {
    pname = "jitsi-meet";
    version = "1.0.5724";
    src = fetchurl {
      url = "https://download.jitsi.org/jitsi-meet/src/jitsi-meet-1.0.5724.tar.bz2";
      sha256 = "sha256-0Y9pc+o4V2O2zTXIEzcrkQ/R//FarEdMCnNBk4k/H80=";
    };
  };
  jitsi-meet-prosody = {
    pname = "jitsi-meet-prosody";
    version = "1.0.5724";
    src = fetchurl {
      url = "https://download.jitsi.org/unstable/jitsi-meet-prosody_1.0.5724-1_all.deb";
      sha256 = "sha256-XiWoGNAMmfgezl6BITJnItDkNs5B6pKkTJAWw1O3Jl4=";
    };
  };
  jitsi-videobridge2 = {
    pname = "jitsi-videobridge2";
    version = "2.1-602-ga60fdbf4";
    src = fetchurl {
      url = "https://download.jitsi.org/unstable/jitsi-videobridge2_2.1-602-ga60fdbf4-1_all.deb";
      sha256 = "sha256-AI4PfkOPfPLsJ6k5NOw1b76h+Es1/jQ6Juuz4N0UcfE=";
    };
  };
  layout-machi = {
    pname = "layout-machi";
    version = "df15a7b78e929203f4de46348b25f3630ac079c1";
    src = fetchFromGitHub ({
      owner = "xinhaoyuan";
      repo = "layout-machi";
      rev = "df15a7b78e929203f4de46348b25f3630ac079c1";
      fetchSubmodules = false;
      sha256 = "sha256-DHQdWkQTztO/YBh6F2LzfbfK2bHpklhXnAkuw3fAZWM=";
    });
  };
  leonflix = {
    pname = "leonflix";
    version = "1.5.50";
    src = fetchurl {
      url = "https://leonflix.net/downloads/Leonflix.AppImage";
      sha256 = "sha256-Fok8OPP9dWjFyIVWUud+UDLiG/lUBNisuCcI0ipjHi4=";
    };
  };
  libinih = {
    pname = "libinih";
    version = "r53";
    src = fetchFromGitHub ({
      owner = "benhoyt";
      repo = "inih";
      rev = "r53";
      fetchSubmodules = false;
      sha256 = "sha256-hi29V40q3c3IvPH7eH3q3z1PiNN59Y0zMhgSroUsDjc=";
    });
  };
  light = {
    pname = "light";
    version = "33f2316e5512762a5a33a62c78db7a435d9fec9b";
    src = fetchFromGitHub ({
      owner = "haikarainen";
      repo = "light";
      rev = "33f2316e5512762a5a33a62c78db7a435d9fec9b";
      fetchSubmodules = false;
      sha256 = "sha256-d8iBxfHkryy5lM5myWPo0a3zgUZQrklYazCSCyKKDGs=";
    });
  };
  lightcord = {
    pname = "lightcord";
    version = "39fc7f28937029dc7270c0ec2bac11c0b467113c";
    src = fetchFromGitHub ({
      owner = "Lightcord";
      repo = "Lightcord";
      rev = "39fc7f28937029dc7270c0ec2bac11c0b467113c";
      fetchSubmodules = false;
      sha256 = "sha256-BXf8HDzEcTnExwAW6ddjyDc+G0iDitvXV7kVp0Btbg0=";
    });
  };
  lua-pam = {
    pname = "lua-pam";
    version = "482071137257e55dac62a510f792104a9d910ea1";
    src = fetchFromGitHub ({
      owner = "RMTT";
      repo = "lua-pam";
      rev = "482071137257e55dac62a510f792104a9d910ea1";
      fetchSubmodules = false;
      sha256 = "sha256-Kn0ozckmgxs19TmCuSChdiYMch92eif7DTEK+UoBtjw=";
    });
  };
  manix = {
    pname = "manix";
    version = "d08e7ca185445b929f097f8bfb1243a8ef3e10e4";
    src = fetchFromGitHub ({
      owner = "mlvzk";
      repo = "manix";
      rev = "d08e7ca185445b929f097f8bfb1243a8ef3e10e4";
      fetchSubmodules = false;
      sha256 = "sha256-GqPuYscLhkR5E2HnSFV4R48hCWvtM3C++3zlJhiK/aw=";
    });
  };
  microsoft-edge-beta = {
    pname = "microsoft-edge-beta";
    version = "97.0.1072.41";
    src = fetchurl {
      url = "https://packages.microsoft.com/repos/edge/pool/main/m/microsoft-edge-beta/microsoft-edge-beta_97.0.1072.41-1_amd64.deb";
      sha256 = "sha256-5vFTdjwFteB/umTlhhElkY43LwCSzuZEV1cBoyXEbhc=";
    };
  };
  microsoft-edge-dev = {
    pname = "microsoft-edge-dev";
    version = "98.0.1100.3";
    src = fetchurl {
      url = "https://packages.microsoft.com/repos/edge/pool/main/m/microsoft-edge-dev/microsoft-edge-dev_98.0.1100.3-1_amd64.deb";
      sha256 = "sha256-CHFFLqQ0wO/gI77myPDkDX2wGcD4nXhWvy7BOPUOMw8=";
    };
  };
  minecraft-wayland = {
    pname = "minecraft-wayland";
    version = "f1848246d177e17293198b58d1bca67acdfb9fb1";
    src = fetchFromGitHub ({
      owner = "Admicos";
      repo = "minecraft-wayland";
      rev = "f1848246d177e17293198b58d1bca67acdfb9fb1";
      fetchSubmodules = false;
      sha256 = "sha256-v3+G5k2xgt4aGuJ35T52mQCyynVoRmEl4pcx7qsulmg=";
    });
  };
  netdata = {
    pname = "netdata";
    version = "1.32.1";
    src = fetchurl {
      url = "https://github.com/netdata/netdata/archive/refs/tags/v1.32.1.tar.gz";
      sha256 = "sha256-K1RwyhOzp8l5T2sg0UVGzXAYGA/miKt2iC2VuKWTufY=";
    };
  };
  netdata-go-d-plugin = {
    pname = "netdata-go-d-plugin";
    version = "0.31.0";
    src = fetchurl {
      url = "https://github.com/netdata/go.d.plugin/archive/refs/tags/v0.31.0.tar.gz";
      sha256 = "sha256-XTn2Vb04/NDvCUq5sM/XWNAaw+oud/lMWuQM4a+ijsA=";
    };
  };
  nix-zsh-completions = {
    pname = "nix-zsh-completions";
    version = "468d8cf752a62b877eba1a196fbbebb4ce4ebb6f";
    src = fetchFromGitHub ({
      owner = "Ma27";
      repo = "nix-zsh-completions";
      rev = "468d8cf752a62b877eba1a196fbbebb4ce4ebb6f";
      fetchSubmodules = false;
      sha256 = "sha256-TWgo56l+FBXssOYWlAfJ5j4pOHNmontOEolcGdihIJs=";
    });
  };
  ntfs2btrfs = {
    pname = "ntfs2btrfs";
    version = "f97247434ecda2cd2c451da5c73c3af98dfaea35";
    src = fetchFromGitHub ({
      owner = "maharmstone";
      repo = "ntfs2btrfs";
      rev = "f97247434ecda2cd2c451da5c73c3af98dfaea35";
      fetchSubmodules = false;
      sha256 = "sha256-ZJmnUU81hg34JHkA82BfapFGqKrhqFk6wCM2eO2RaVs=";
    });
  };
  nwg-drawer = {
    pname = "nwg-drawer";
    version = "94c94b8b1e125c00c386d52c738b01dded7d4529";
    src = fetchFromGitHub ({
      owner = "nwg-piotr";
      repo = "nwg-drawer";
      rev = "94c94b8b1e125c00c386d52c738b01dded7d4529";
      fetchSubmodules = false;
      sha256 = "sha256-EaMTx5BqhhMc6W+k2PkWG5d1LJ0OKpS9mjWUW6SMyKs=";
    });
  };
  ny-font = {
    pname = "ny-font";
    version = "0.0.0.20210625";
    src = fetchurl {
      url = "https://devimages-cdn.apple.com/design/resources/download/NY.dmg";
      sha256 = "sha256-MAxQkdR40YUDl7z0OYbuwiueOoB2JuYikIu11CqiAto=";
    };
  };
  ouch = {
    pname = "ouch";
    version = "308b8f7e906c57d8da334ae6395aa15ecbdfb2d8";
    src = fetchFromGitHub ({
      owner = "ouch-org";
      repo = "ouch";
      rev = "308b8f7e906c57d8da334ae6395aa15ecbdfb2d8";
      fetchSubmodules = false;
      sha256 = "sha256-65yz5o/sITdk3x9gqHPvcMEDsImrEObJkg/cc3kCD9s=";
    });
    cargoLock = {
      lockFile = ./ouch-308b8f7e906c57d8da334ae6395aa15ecbdfb2d8/Cargo.lock;
      outputHashes = { };
    };
  };
  paper = {
    pname = "paper";
    version = "35ecb75c6776615f1db5dfb861fbe407263d8057";
    src = fetchgit {
      url = "https://gitlab.com/snakedye/paper";
      rev = "35ecb75c6776615f1db5dfb861fbe407263d8057";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "sha256-D0VMUZ7QN4xTcTBulzSlt7IvjRxPYFiTs1AcuhNKrek=";
    };
    cargoLock = {
      lockFile = ./paper-35ecb75c6776615f1db5dfb861fbe407263d8057/Cargo.lock;
      outputHashes = {
        "snui-0.1.0" = "sha256-y61EWKr5qD9OFrMVQs9SVyLCqq5lOwLXCAo2w0AYt7M=";
      };
    };
  };
  picom = {
    pname = "picom";
    version = "31e58712ec11b198340ae217d33a73d8ac73b7fe";
    src = fetchFromGitHub ({
      owner = "yshui";
      repo = "picom";
      rev = "31e58712ec11b198340ae217d33a73d8ac73b7fe";
      fetchSubmodules = false;
      sha256 = "sha256-VBnIzisg/7Xetd/AWVHlnaWXlxX+wqeYTpstO6+T5cE=";
    });
  };
  plymouth-themes = {
    pname = "plymouth-themes";
    version = "bf2f570bee8e84c5c20caac353cbe1d811a4745f";
    src = fetchFromGitHub ({
      owner = "adi1090x";
      repo = "plymouth-themes";
      rev = "bf2f570bee8e84c5c20caac353cbe1d811a4745f";
      fetchSubmodules = false;
      sha256 = "sha256-VNGvA8ujwjpC2rTVZKrXni2GjfiZk7AgAn4ZB4Baj2k=";
    });
  };
  pmbootstrap = {
    pname = "pmbootstrap";
    version = "1.40.0";
    src = fetchurl {
      url = "https://pypi.io/packages/source/p/pmbootstrap/pmbootstrap-1.40.0.tar.gz";
      sha256 = "sha256-b/9NEURp42d/j/Fk8NUS0ZAG99q56eg0pEU/xkFnvrM=";
    };
  };
  pmbootstrap-test = {
    pname = "pmbootstrap-test";
    version = "8a14d366ef6fcd2e5b0a9eb86763960c578260a2";
    src = fetchgit {
      url = "https://gitlab.com/postmarketOS/pmbootstrap";
      rev = "8a14d366ef6fcd2e5b0a9eb86763960c578260a2";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "sha256-8Mb46phfxLKQ5D18wyHuIL04dZv1aJI1OVx5FUvMH2I=";
    };
  };
  pure = {
    pname = "pure";
    version = "90dc9cf908481cc155e1ce5611f684916523fc30";
    src = fetchFromGitHub ({
      owner = "sindresorhus";
      repo = "pure";
      rev = "90dc9cf908481cc155e1ce5611f684916523fc30";
      fetchSubmodules = false;
      sha256 = "sha256-nsmiP1RSG27WtwRJpTZvDi2CvUQExxdBs5my7T5TSKk=";
    });
  };
  pythonPackages-cfscrape = {
    pname = "pythonPackages-cfscrape";
    version = "e510962c608382bcef5de75033d60cc98cb9561d";
    src = fetchurl {
      url = "https://github.com/Anorov/cloudflare-scrape/archive/master.tar.gz";
      sha256 = "sha256-+pFN1Ts23Ggm6YZueyLdQaMJCfox/CRmMelzGvWRtEw=";
    };
  };
  pythonPackages-cmapy = {
    pname = "pythonPackages-cmapy";
    version = "0.6.6";
    src = fetchurl {
      url = "https://pypi.io/packages/source/c/cmapy/cmapy-0.6.6.tar.gz";
      sha256 = "sha256-y1KmswV8SaFG+wlkuDAvL7fWHf5q5t4amLY2qs6AUlU=";
    };
  };
  pythonPackages-mediapipe = {
    pname = "pythonPackages-mediapipe";
    version = "0.8.8";
    src = fetchurl {
      url = "https://files.pythonhosted.org/packages/ed/5f/188b509ab93e740f3fd8d9179de0ef9340852b48f1f5d671cd090a54996f/mediapipe-0.8.8-cp39-cp39-manylinux_2_17_x86_64.manylinux2014_x86_64.whl";
      sha256 = "sha256-qW1D06zrH8HnZiQoO5PC+8mK8z1HcZJxU9hmwyi8FZc=";
    };
  };
  pythonPackages-pySmartDL = {
    pname = "pythonPackages-pySmartDL";
    version = "b93df794e1e60017c42d9520ac097b6fd38c2e8b";
    src = fetchurl {
      url = "https://github.com/iTaybb/pySmartDL/archive/master.tar.gz";
      sha256 = "sha256-26TGmz9eIXm6epKUnvNDQymRBOC3TcpxCXFbhuVfVto=";
    };
  };
  pywalfox = {
    pname = "pywalfox";
    version = "2.7.4";
    src = fetchurl {
      url = "https://pypi.io/packages/source/p/pywalfox/pywalfox-2.7.4.tar.gz";
      sha256 = "sha256-Wec9fic4lXT7gBY04D2EcfCb/gYoZcrYA/aMRWaA7WY=";
    };
  };
  quibble = {
    pname = "quibble";
    version = "f7ac6d55df73a35a730ea73045d9cd623180cb4b";
    src = fetchFromGitHub ({
      owner = "maharmstone";
      repo = "quibble";
      rev = "f7ac6d55df73a35a730ea73045d9cd623180cb4b";
      fetchSubmodules = false;
      sha256 = "sha256-YdXXPT/FlEEWDk8QrymQNFp0bj64E+0z7u0+edcLEhk=";
    });
  };
  rainfox = {
    pname = "rainfox";
    version = "d373dc136b805097f5092d02365a90327dc1de4a";
    src = fetchFromGitHub ({
      owner = "1280px";
      repo = "rainfox";
      rev = "d373dc136b805097f5092d02365a90327dc1de4a";
      fetchSubmodules = false;
      sha256 = "sha256-JX9sdVXjX38RVNUupktBinyGtAPCEj5YfJBg/N+wabw=";
    });
  };
  redshift = {
    pname = "redshift";
    version = "7da875d34854a6a34612d5ce4bd8718c32bec804";
    src = fetchFromGitHub ({
      owner = "minus7";
      repo = "redshift";
      rev = "7da875d34854a6a34612d5ce4bd8718c32bec804";
      fetchSubmodules = false;
      sha256 = "sha256-pyR7xNdi/83NSoC2WIrX8U+A6nU+vZBlePLXrQZnc1k=";
    });
  };
  retroarch = {
    pname = "retroarch";
    version = "d017ce7b03ec2d10346a1ff387b2997fb832e825";
    src = fetchFromGitHub ({
      owner = "libretro";
      repo = "retroarch";
      rev = "d017ce7b03ec2d10346a1ff387b2997fb832e825";
      fetchSubmodules = false;
      sha256 = "sha256-hDDTPxXmKcYWJYdgQS7SsptBmBl2Xpt5XVUO3lz+CIM=";
    });
  };
  rofi-wayland = {
    pname = "rofi-wayland";
    version = "07c801cd2d7a261173030e6297d4014dcaa998b2";
    src = fetchFromGitHub ({
      owner = "lbonn";
      repo = "rofi";
      rev = "07c801cd2d7a261173030e6297d4014dcaa998b2";
      fetchSubmodules = true;
      sha256 = "sha256-96scjlii4pvq3DYRpWk2rQxS0tXo5XeWhJp65Z8lkD0=";
    });
  };
  rustdesk = {
    pname = "rustdesk";
    version = "cb1818ab37ea4f57eb3ecb05cbd67ad59c684b45";
    src = fetchFromGitHub ({
      owner = "rustdesk";
      repo = "rustdesk";
      rev = "cb1818ab37ea4f57eb3ecb05cbd67ad59c684b45";
      fetchSubmodules = false;
      sha256 = "sha256-qrKJngUqN3jQB3MPUbwTX+ZH158VRVsCM40MgWfvRrM=";
    });
    cargoLock = {
      lockFile = ./rustdesk-cb1818ab37ea4f57eb3ecb05cbd67ad59c684b45/Cargo.lock;
      outputHashes = {
        "systray-0.4.1" = "sha256-p1PMr/8oS6zHx4+Ng4zCqt0xZ57cq3wAu6/agyWq5Jw=";
        "parity-tokio-ipc-0.7.3" = "sha256-Ji/q7RQDznFs+m4AHH1IEL1TMqqCtH4Z5DY6sjcu/T0=";
        "libappindicator-0.6.1" = "sha256-JGnnZrcwbh8WJ6+/4bYhfD3HvgF2C7XaaGb6TaMRWdw=";
        "cpal-0.13.4" = "sha256-Gs1cqYJP92Zy8Fnu3wGQ9+p5oIkCkOp9v++8ocFSNiU=";
        "sciter-rs-0.5.57" = "sha256-pF5Rwav78//oqDAv0Nhb7tawhSMnlSuy4sPUOfPd8NU=";
        "psutil-3.2.1" = "sha256-n3LTTDBCW+l0xKFGHdFHePlw998nO6G9K7PCWdukN/0=";
        "confy-0.4.1" = "sha256-5QwA4YfEEE6QqEEUJ3+C37UbUf88NYds38kIthVSo5Y=";
        "magnum-opus-0.4.0" = "sha256-GoCuStsQW/M6PEfdtbJ69ePNAL8bQ9HIJVopv+k93nY=";
        "rust-pulsectl-0.2.11" = "sha256-CZkvii6pQM5jaR9RK9HDrczxIxZwuahpdVM+UsRLw9s=";
      };
    };
  };
  rustdesk-server-oss = {
    pname = "rustdesk-server-oss";
    version = "2e539cf5bfc60b1463519de2566422464877992d";
    src = fetchFromGitHub ({
      owner = "rustdesk";
      repo = "rustdesk-server-demo";
      rev = "2e539cf5bfc60b1463519de2566422464877992d";
      fetchSubmodules = false;
      sha256 = "sha256-MMPmTEMYghf2A+rQF5pJaLTb2NyXpV3HKx20g7o/deg=";
    });
  };
  sddm = {
    pname = "sddm";
    version = "04242833b35748f06b569dc5c8130a66c823e154";
    src = fetchFromGitHub ({
      owner = "sddm";
      repo = "sddm";
      rev = "04242833b35748f06b569dc5c8130a66c823e154";
      fetchSubmodules = false;
      sha256 = "sha256-l7+4pHp3clabT7JO5uNUfAhVO7AbIxVpXMX35fwC2/U=";
    });
  };
  sddm-chili = {
    pname = "sddm-chili";
    version = "6516d50176c3b34df29003726ef9708813d06271";
    src = fetchFromGitHub ({
      owner = "MarianArlt";
      repo = "sddm-chili";
      rev = "6516d50176c3b34df29003726ef9708813d06271";
      fetchSubmodules = false;
      sha256 = "sha256-wxWsdRGC59YzDcSopDRzxg8TfjjmA3LHrdWjepTuzgw=";
    });
  };
  segue-ui-linux = {
    pname = "segue-ui-linux";
    version = "02f6e1e9290581e7fc9bf3beefc0ebc9ec8c1611";
    src = fetchFromGitHub ({
      owner = "mrbvrz";
      repo = "segoe-ui-linux";
      rev = "02f6e1e9290581e7fc9bf3beefc0ebc9ec8c1611";
      fetchSubmodules = false;
      sha256 = "sha256-zmR87N8loBtmi8qVH2kC0XSgydn8Sw570awYi/XAcuM=";
    });
  };
  sf-font-compact = {
    pname = "sf-font-compact";
    version = "0.0.0.20210625";
    src = fetchurl {
      url = "https://devimages-cdn.apple.com/design/resources/download/SF-Compact.dmg";
      sha256 = "sha256-uQAY1yMr9SetN/X6UrY2mvfxmIOmNQ0A3IrJQNvi5jM=";
    };
  };
  sf-font-pro = {
    pname = "sf-font-pro";
    version = "0.0.0.20210625";
    src = fetchurl {
      url = "https://devimages-cdn.apple.com/design/resources/download/SF-Pro.dmg";
      sha256 = "sha256-m0eDv1CYCkkm5qgbLioI9+ahf0OXSYh0Gkp61vgMSFk=";
    };
  };
  sf-mono = {
    pname = "sf-mono";
    version = "0.0.0.20210625";
    src = fetchurl {
      url = "https://devimages-cdn.apple.com/design/resources/download/SF-Mono.dmg";
      sha256 = "sha256-8niJPk3hGfK1USIs9eoxZ6GlM4aZ7ZObmQj2Zomj+Go=";
    };
  };
  snui = {
    pname = "snui";
    version = "a5897d6406dcf501bbe4f29123c963c6f53dfbd8";
    src = fetchgit {
      url = "https://gitlab.com/snakedye/snui";
      rev = "a5897d6406dcf501bbe4f29123c963c6f53dfbd8";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "sha256-gR1/FmqcQYxY6mdUUauKL4DxeuS23jJpm0EGOCglfrM=";
    };
  };
  spicetify-cli = {
    pname = "spicetify-cli";
    version = "079a0dc5210bf373d577e6bc72da27496affb04a";
    src = fetchFromGitHub ({
      owner = "khanhas";
      repo = "spicetify-cli";
      rev = "079a0dc5210bf373d577e6bc72da27496affb04a";
      fetchSubmodules = false;
      sha256 = "sha256-YbAzThgmaxl6vrP2jZnP18e/aY4+lDqg6i9BjJ0SzfY=";
    });
  };
  spicetify-themes = {
    pname = "spicetify-themes";
    version = "1d9ef3902aa79659ce0a6884d0f1249f07174918";
    src = fetchFromGitHub ({
      owner = "morpheusthewhite";
      repo = "spicetify-themes";
      rev = "1d9ef3902aa79659ce0a6884d0f1249f07174918";
      fetchSubmodules = false;
      sha256 = "sha256-LzDn214UuN49u6iSry+EA9m5Fe03IGMFd+87ZKnvES4=";
    });
  };
  spotify = {
    pname = "spotify";
    version = "1.1.72.439.gc253025e";
    src = fetchurl {
      url = "https://api.snapcraft.io/api/v1/snaps/download/pOBIoZ2LrCB3rDohMxoYGnbN14EHOgD7_56.snap";
      sha256 = "sha256-GKQBMPMLlbBZp4YXKPxY03lOJvmsuitiIldg0aLh6RE=";
    };
  };
  spotifyd = {
    pname = "spotifyd";
    version = "603bcc4d802d2b8f45ac517c0513eb4096252d7b";
    src = fetchFromGitHub ({
      owner = "Spotifyd";
      repo = "spotifyd";
      rev = "603bcc4d802d2b8f45ac517c0513eb4096252d7b";
      fetchSubmodules = false;
      sha256 = "sha256-zOyRbeaC+wI0MgJeUksSzS9SR+folKAg6aCzc7mgONI=";
    });
    cargoLock = {
      lockFile = ./spotifyd-603bcc4d802d2b8f45ac517c0513eb4096252d7b/Cargo.lock;
      outputHashes = { };
    };
  };
  steamcompmgr = {
    pname = "steamcompmgr";
    version = "c0b61756ee30f93d296efc32f018eaf5ace37fbe";
    src = fetchFromGitHub ({
      owner = "ChimeraOS";
      repo = "steamos-compositor-plus";
      rev = "c0b61756ee30f93d296efc32f018eaf5ace37fbe";
      fetchSubmodules = false;
      sha256 = "sha256-CybAPCUDHulW54x94F0ZRAnhrT4dK175X55ZPmgYxPc=";
    });
  };
  sway-borders = {
    pname = "sway-borders";
    version = "5f4162f449b19f6d198b365fc6d3dd0febc065e2";
    src = fetchFromGitHub ({
      owner = "fluix-dev";
      repo = "sway-borders";
      rev = "5f4162f449b19f6d198b365fc6d3dd0febc065e2";
      fetchSubmodules = false;
      sha256 = "sha256-gCdnim7excF11GEoni5YbIGTWSIx+wjHc8NO8lVNFts=";
    });
  };
  swaylock-effects = {
    pname = "swaylock-effects";
    version = "a8fc557b86e70f2f7a30ca9ff9b3124f89e7f204";
    src = fetchFromGitHub ({
      owner = "mortie";
      repo = "swaylock-effects";
      rev = "a8fc557b86e70f2f7a30ca9ff9b3124f89e7f204";
      fetchSubmodules = false;
      sha256 = "sha256-GN+cxzC11Dk1nN9wVWIyv+rCrg4yaHnCePRYS1c4JTk=";
    });
  };
  tailscale = {
    pname = "tailscale";
    version = "2c94e3c4adef5730c6c3fb8a65240c61554cea19";
    src = fetchFromGitHub ({
      owner = "tailscale";
      repo = "tailscale";
      rev = "2c94e3c4adef5730c6c3fb8a65240c61554cea19";
      fetchSubmodules = false;
      sha256 = "sha256-omlUih+Kzf+goCZPJZUWB1qEgxZMR071Dd4XfGsSXqM=";
    });
  };
  tailscale-systray = {
    pname = "tailscale-systray";
    version = "20c7e85e3d64602b87699c388185513e112a5a9c";
    src = fetchFromGitHub ({
      owner = "mattn";
      repo = "tailscale-systray";
      rev = "20c7e85e3d64602b87699c388185513e112a5a9c";
      fetchSubmodules = false;
      sha256 = "sha256-XP874ciM4eBrT/rOGqwMzZQ27T0QJ3ggODHB5pIkZzU=";
    });
  };
  teams = {
    pname = "teams";
    version = "1.4.00.26453";
    src = fetchurl {
      url = "https://packages.microsoft.com/repos/ms-teams/pool/main/t/teams/teams_1.4.00.26453_amd64.deb";
      sha256 = "sha256-7hW1d5Oqa3nM2nRNUjLaZwM1q9kxuuKgIPUEOhKauFk=";
    };
  };
  trackma = {
    pname = "trackma";
    version = "2422c23228efc9b72872b69f22f7d25c1d337264";
    src = fetchurl {
      url = "https://github.com/z411/trackma/archive/master.tar.gz";
      sha256 = "sha256-ML1pCEnK+DDHsUmFneqsHrSl05ZLHz1GPydPcurOFbY=";
    };
  };
  ulauncher = {
    pname = "ulauncher";
    version = "44735d8d4c2b4b8a8d28f95ab6a6c6d577c859e5";
    src = fetchFromGitHub ({
      owner = "Ulauncher";
      repo = "Ulauncher";
      rev = "44735d8d4c2b4b8a8d28f95ab6a6c6d577c859e5";
      fetchSubmodules = false;
      sha256 = "sha256-urChMTImmt1oETvIvgpp07TsYxUQ16WUNIxyWILOKqg=";
    });
  };
  ultimmc = {
    pname = "ultimmc";
    version = "66bb7105db93e0977bb64a59a12b001f780e0566";
    src = fetchFromGitHub ({
      owner = "AfoninZ";
      repo = "MultiMC5-Cracked";
      rev = "66bb7105db93e0977bb64a59a12b001f780e0566";
      fetchSubmodules = true;
      sha256 = "sha256-t/R3BBRy2orzUuh537xMPwORHmhQy4aGe96e77CVzZs=";
    });
  };
  uniemoji = {
    pname = "uniemoji";
    version = "40e69ae550f74bd91fa0b87db4f2e303344fd7aa";
    src = fetchFromGitHub ({
      owner = "salty-horse";
      repo = "ibus-uniemoji";
      rev = "40e69ae550f74bd91fa0b87db4f2e303344fd7aa";
      fetchSubmodules = false;
      sha256 = "sha256-aIoAQu4KpaUnSGV8UwPUXzM91Hu9k9eaLj7oP1GRRAw=";
    });
  };
  vaultwarden = {
    pname = "vaultwarden";
    version = "1.23.1";
    src = fetchFromGitHub ({
      owner = "dani-garcia";
      repo = "vaultwarden";
      rev = "1.23.1";
      fetchSubmodules = false;
      sha256 = "sha256-UMeltpuGUPdB5j4NBxA6SuLUqzinrF8USCaJk9SjDJA=";
    });
    cargoLock = {
      lockFile = ./vaultwarden-1.23.1/Cargo.lock;
      outputHashes = {
        "rocket-0.5.0-dev" = "sha256-sZL6GtLrfDy0ePix2UxZTdpFQvvc0G/Q+7qbCLGknqY=";
        "job_scheduler-1.2.1" = "sha256-b0jIKAHVrQNdZdlq+5kfGAOsi8bHu20QDtQaWTuJYtU=";
        "devise-0.3.0" = "sha256-crnEOKK7FiuIs55mOKgNfb3mNzr3QLI0icPPuG+xKVI=";
      };
    };
  };
  vaultwarden-vault = {
    pname = "vaultwarden-vault";
    version = "2.25.0";
    src = fetchurl {
      url = "https://github.com/dani-garcia/bw_web_builds/releases/download/v2.25.0/bw_web_v2.25.0.tar.gz";
      sha256 = "sha256-0uxkHz/oHWl4MdzV7zRVKgkEqOkrl7Fd405TOf472gw=";
    };
  };
  ventoy = {
    pname = "ventoy";
    version = "1.0.46";
    src = fetchurl {
      url = "https://github.com/ventoy/Ventoy/releases/download/v1.0.46/ventoy-1.0.46-linux.tar.gz";
      sha256 = "sha256-FxQy6ZBBjvmce7bCDLKpOs4ZTq37bO3U0Iu7U2RRxL4=";
    };
  };
  vimPlugins-yuck = {
    pname = "vimPlugins-yuck";
    version = "6dc3da77c53820c32648cf67cbdbdfb6994f4e08";
    src = fetchFromGitHub ({
      owner = "elkowar";
      repo = "yuck.vim";
      rev = "6dc3da77c53820c32648cf67cbdbdfb6994f4e08";
      fetchSubmodules = false;
      sha256 = "sha256-lp7qJWkvelVfoLCyI0aAiajTC+0W1BzDhmtta7tnICE=";
    });
  };
  waydroid = {
    pname = "waydroid";
    version = "d03e10c132de8e03dff781868b3e37b7f7c7128a";
    src = fetchFromGitHub ({
      owner = "waydroid";
      repo = "waydroid";
      rev = "d03e10c132de8e03dff781868b3e37b7f7c7128a";
      fetchSubmodules = false;
      sha256 = "sha256-y2+rRwxZ4jrnWDEYruzjOQlLF2ERB4v+sGchPK5mrTU=";
    });
  };
  wgcf = {
    pname = "wgcf";
    version = "ecf3b62ea61eabe483625fd1cbd476a8fd994952";
    src = fetchFromGitHub ({
      owner = "ViRb3";
      repo = "wgcf";
      rev = "ecf3b62ea61eabe483625fd1cbd476a8fd994952";
      fetchSubmodules = false;
      sha256 = "sha256-Dz19SlBTTCn73rnnU4PpZUbwcIpA6j2ODFYVAwTn7wI=";
    });
  };
  whitesur-gtk-theme = {
    pname = "whitesur-gtk-theme";
    version = "b56ce631bde5f0698c7be4287d2a6f94732295c2";
    src = fetchFromGitHub ({
      owner = "vinceliuice";
      repo = "whitesur-gtk-theme";
      rev = "b56ce631bde5f0698c7be4287d2a6f94732295c2";
      fetchSubmodules = false;
      sha256 = "sha256-teBV2413Bk0YFBakaT42HypjhCKsfV4ySGK5do22pYY=";
    });
  };
  whitesur-icon-theme = {
    pname = "whitesur-icon-theme";
    version = "e99fedc45bae0e830a4a31eddb8080a37054fde3";
    src = fetchFromGitHub ({
      owner = "vinceliuice";
      repo = "whitesur-icon-theme";
      rev = "e99fedc45bae0e830a4a31eddb8080a37054fde3";
      fetchSubmodules = false;
      sha256 = "sha256-4CEay1n///ZRKGnzOFF6B8mZ3J1swNSp2pa+PdBIG5g=";
    });
  };
  widevine-cdm = {
    pname = "widevine-cdm";
    version = "4.10.2391.0";
    src = fetchurl {
      url = "https://dl.google.com/widevine-cdm/4.10.2391.0-linux-x64.zip";
      sha256 = "sha256-7gH808C67m/s09e4rQUQHb/t+iGVdzW+YzrB1ZxGIdo=";
    };
  };
  wii-u-gc-adapter = {
    pname = "wii-u-gc-adapter";
    version = "fa098efa7f6b34f8cd82e2c249c81c629901976c";
    src = fetchFromGitHub ({
      owner = "ToadKing";
      repo = "wii-u-gc-adapter";
      rev = "fa098efa7f6b34f8cd82e2c249c81c629901976c";
      fetchSubmodules = false;
      sha256 = "sha256-wm0vDU7QckFvpgI50PG4/elgPEkfr8xTmroz8kE6QMo=";
    });
  };
  xdg-desktop-portal = {
    pname = "xdg-desktop-portal";
    version = "6241c5e8bfb60502ac3c7bc3babede22d35f3b1c";
    src = fetchFromGitHub ({
      owner = "flatpak";
      repo = "xdg-desktop-portal";
      rev = "6241c5e8bfb60502ac3c7bc3babede22d35f3b1c";
      fetchSubmodules = false;
      sha256 = "sha256-1fc3LXN6wp/zQw4HQ0Q99HUvBhynHrQi2p3s/08izuE=";
    });
  };
  xdg-desktop-portal-gtk = {
    pname = "xdg-desktop-portal-gtk";
    version = "b09453a7b580946ad98b10c21a0458c865389e09";
    src = fetchFromGitHub ({
      owner = "flatpak";
      repo = "xdg-desktop-portal-gtk";
      rev = "b09453a7b580946ad98b10c21a0458c865389e09";
      fetchSubmodules = false;
      sha256 = "sha256-QbH/qcYGH/7gQnQY7UuSGImZjVcFIyxtpYayjQYdDm0=";
    });
  };
  xorg-libxcvt = {
    pname = "xorg-libxcvt";
    version = "6fe840b9295cfdc41bd734586c5b8756f6af6f9b";
    src = fetchgit {
      url = "https://gitlab.freedesktop.org/xorg/lib/libxcvt";
      rev = "6fe840b9295cfdc41bd734586c5b8756f6af6f9b";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "sha256-qKKb/i67QY/NxZFkJaVRc3hGPjjnRfgpMqGqZ0YNQE8=";
    };
  };
  xorgproto = {
    pname = "xorgproto";
    version = "914d8f5e0f469cd0416364dd008e9eea752bf703";
    src = fetchFromGitHub ({
      owner = "freedesktop";
      repo = "xorg-xorgproto";
      rev = "914d8f5e0f469cd0416364dd008e9eea752bf703";
      fetchSubmodules = false;
      sha256 = "sha256-XJtYZYbmwCrkbB7a533kkI/CcawkmHHSEu4zSznVvEY=";
    });
  };
  xwayland = {
    pname = "xwayland";
    version = "38291fa86c00e1d3ee37612c9215b0c15da89051";
    src = fetchgit {
      url = "git://anongit.freedesktop.org/xorg/xserver";
      rev = "38291fa86c00e1d3ee37612c9215b0c15da89051";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "sha256-a1xz8MpKKL9yQqwBpafOu4+jgllsafia20S2W77xrbg=";
    };
  };
  ydotool = {
    pname = "ydotool";
    version = "e1334aee314c25a795ed3a60463a1b4b129409b5";
    src = fetchFromGitHub ({
      owner = "ReimuNotMoe";
      repo = "ydotool";
      rev = "e1334aee314c25a795ed3a60463a1b4b129409b5";
      fetchSubmodules = false;
      sha256 = "sha256-/3V2rVMwXi6+qEtPgPK/8mozveEhFtvop9mZAxBf71M=";
    });
  };
  zoom-us = {
    pname = "zoom-us";
    version = "5.9.1.1380";
    src = fetchurl {
      url = "https://cdn.zoom.us/prod/5.9.1.1380/zoom_x86_64.pkg.tar.xz";
      sha256 = "sha256-3HuVCDaOnepGMiRaQ78QcCdgNzI60egbPGfoOfwIPGQ=";
    };
  };
}
