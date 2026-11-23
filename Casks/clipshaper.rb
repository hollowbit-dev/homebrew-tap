cask "clipshaper" do
  version "1.0.0"
  sha256 "9a239f56549c929beab1846f00d41a0fb86963ba458d48c2c2c5e3c62f22f6d8"

  url "https://github.com/hollowbit-dev/clipshaper/releases/download/v#{version}/Clipshaper-#{version}-mac-arm64.dmg"
  name "Clipshaper"
  desc "Turns long videos into short vertical clips with captions"
  homepage "https://hollowbit.dev/clipshaper/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :monterey

  app "Clipshaper.app"

  zap trash: [
    "~/Library/Application Support/Clipshaper",
    "~/Library/Preferences/dev.hollowbit.clipshaper.plist",
    "~/Library/Saved Application State/dev.hollowbit.clipshaper.savedState",
  ]

  caveats <<~EOS
    Clipshaper is free and open source but not yet signed by Apple.
    The first time, right-click Clipshaper in Applications and choose Open.
    If macOS still blocks it: System Settings > Privacy & Security > Open Anyway.
  EOS
end
