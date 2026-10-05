cask "devsweep" do
  version "0.8.2"
  sha256 "e03505ef7d47bee18d61ef3497cb04ebc50bd7acf2916412b0c2362bc96040ec"

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
