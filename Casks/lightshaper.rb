cask "lightshaper" do
  arch arm: "arm64", intel: "x64"

  version "1.2.0"
  sha256 arm:   "c8b3bbbca0fcc67587b3ebf046a60c0346b9a18f7ce5678258c90429d4033999",
         intel: "6c30c6f682072726ac4d7cf0e9257c15d5bb5463bef9ac933145c2b9301e5a00"

  url "https://github.com/hollowbit-dev/lightshaper/releases/download/v#{version}/Lightshaper-#{version}-mac-#{arch}.dmg"
  name "Lightshaper"
  desc "Offline photo editor for RAW and JPEG with masks, looks and batch export"
  homepage "https://hollowbit.dev/lightshaper/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :monterey

  app "Lightshaper.app"

  zap trash: [
    "~/Library/Application Support/Lightshaper",
    "~/Library/Preferences/dev.hollowbit.lightshaper.plist",
    "~/Library/Saved Application State/dev.hollowbit.lightshaper.savedState",
  ]

  caveats <<~EOS
    Lightshaper is free and open source but not yet signed by Apple.
    The first time, right-click Lightshaper in Applications and choose Open.
    If macOS still blocks it: System Settings > Privacy & Security > Open Anyway.
  EOS
end
