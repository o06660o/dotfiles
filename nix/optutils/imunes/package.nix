{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  makeWrapper,
  bash,
  coreutils,
  gawk,
  gnugrep,
  gnused,
  imagemagick,
  inetutils,
  iproute2,
  iptables,
  jq,
  kmod,
  openssh,
  procps,
  socat,
  tcl,
  tclPackages,
  tcpdump,
  tk,
  util-linux,
  which,
  wireshark,
  xauth,
  xterm,
}:

stdenvNoCC.mkDerivation {
  pname = "imunes";
  version = "3.0.0b-unstable-2026-11-10";

  src = fetchFromGitHub {
    owner = "imunes";
    repo = "imunes";
    rev = "e567ac7f718184e4571a6a6488780264ef7ae134";
    hash = "sha256-a565l/Pjjw8/YXOXMA0j2y5o+c19bTZYqVTJrlJ4T6Q=";
  };

  nativeBuildInputs = [
    makeWrapper
    tcl.tclPackageHook
  ];
  buildInputs = [
    tk
    tclPackages.tcllib
  ];

  # Runtime directories and system services belong to the host, not the store.
  postPatch = ''
    substituteInPlace GNUmakefile \
      --replace-fail 'install: uninstall netgraph' 'install:' \
      --replace-fail 'mkdir -p $(LOGDIR)' ':' \
      --replace-fail '$(MAKE) --no-print-directory service' ':'
  '';

  dontConfigure = true;
  dontBuild = true;
  makeFlags = [ "PREFIX=${placeholder "out"}" ];

  postInstall = ''
    install -Dm644 "$out/lib/imunes/imunes.desktop" \
      "$out/share/applications/imunes.desktop"
    substituteInPlace "$out/share/applications/imunes.desktop" \
      --replace-fail 'Exec=imunes' "Exec=$out/bin/imunes"
  '';

  preFixup = ''
    # Keep Nix tools available under sudo; Docker comes from Fedora's /usr/bin.
    tclWrapperArgs+=(--prefix PATH : "$out/bin:${
      lib.makeBinPath [
        bash
        coreutils
        gawk
        gnugrep
        gnused
        imagemagick
        inetutils
        iproute2
        iptables
        jq
        kmod
        openssh
        procps
        socat
        tcl
        tcpdump
        util-linux
        which
        wireshark
        xauth
        xterm
      ]
    }:/usr/bin:/usr/sbin")
  '';

  meta = {
    description = "Integrated Multiprotocol Network Emulator/Simulator";
    homepage = "https://github.com/imunes/imunes";
    license = lib.licenses.bsd2;
    platforms = lib.platforms.linux;
    mainProgram = "imunes";
  };
}
