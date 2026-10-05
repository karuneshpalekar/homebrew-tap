cask "devsweep" do
  version "0.9.3"
  sha256 "56fe5058f876696f5f5cb57c8f85d583155783198ee30f5f4db893c9908461f6"

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
