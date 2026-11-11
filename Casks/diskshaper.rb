cask "diskshaper" do
  arch arm: "arm64", intel: "x64"

  version "1.0.1"
  sha256 arm:   "9530b82431e4e60f2d3e10ed401043740528e0251f4fb9390ebcf0025b3c7fbd",
         intel: "aa9249293acd3db2eaf0919540e9f88c737a5caae3e4190cc1c809406fd0f34f"

  url "https://github.com/hollowbit-dev/diskshaper/releases/download/v#{version}/Diskshaper-#{version}-mac-#{arch}.dmg"
  name "Diskshaper"
  desc "Storage cleaner that only moves safe items to the Trash"
  homepage "https://hollowbit.dev/diskshaper/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "Diskshaper.app"

  zap trash: [
    "~/Library/Application Support/Diskshaper",
    "~/Library/Preferences/dev.hollowbit.diskshaper.plist",
    "~/Library/Saved Application State/dev.hollowbit.diskshaper.savedState",
  ]

  caveats <<~EOS
    Diskshaper is free and open source but not yet signed by Apple.
    The first time, right-click Diskshaper in Applications and choose Open.
    If macOS still blocks it: System Settings > Privacy & Security > Open Anyway.
  EOS
end
