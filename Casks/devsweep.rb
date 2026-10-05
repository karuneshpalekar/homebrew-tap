cask "devsweep" do
  version "0.9.1"
  sha256 "40dafa5748ced4d84b61cfa85995d692c60281c46190aa81a550871fb08aa95e"

  url "https://github.com/karuneshpalekar/DevSweep/releases/download/v#{version}/DevSweep-#{version}.dmg"
  name "DevSweep"
  desc "Cleaner for developer Macs that explains every item before it goes"
  homepage "https://github.com/karuneshpalekar/DevSweep"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "DevSweep.app"

  # Builds are ad-hoc signed, not notarized, so macOS would otherwise block the
  # first launch. Clearing the quarantine flag is what the manual steps do.
  # Legacy postflight on purpose: it works on every Homebrew version. Newer
  # releases only warn about it for third-party taps.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/DevSweep.app"]
  end

  zap trash: [
    "~/Library/Application Support/DevSweep",
    "~/Library/Caches/DevSweep",
    "~/Library/Preferences/io.github.karuneshpalekar.devsweep.plist",
  ]
end
