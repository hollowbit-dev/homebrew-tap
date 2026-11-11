cask "writeshaper" do
  arch arm: "arm64", intel: "x64"

  version "1.0.0"
  sha256 arm:   "0304ef3c13d84100bf706086ae6ed21ad874f10361e3f52ef6c6ea0a1d13ea24",
         intel: "83d636f1e6b1712a65aa92a8ea331509976d2ee292a96a28f8864231bced7161"

  url "https://github.com/hollowbit-dev/writeshaper/releases/download/v#{version}/Writeshaper-#{version}-mac-#{arch}.dmg"
  name "Writeshaper"
  desc "Private writing assistant that fixes and rewrites text in any app"
  homepage "https://hollowbit.dev/writeshaper/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "Writeshaper.app"

  zap trash: [
    "~/Library/Application Support/Writeshaper",
    "~/Library/Preferences/dev.hollowbit.writeshaper.plist",
    "~/Library/Saved Application State/dev.hollowbit.writeshaper.savedState",
  ]

  caveats <<~EOS
    Writeshaper is free and open source but not yet signed by Apple.
    The first time, right-click Writeshaper in Applications and choose Open.
    If macOS still blocks it: System Settings > Privacy & Security > Open Anyway.
    On first launch it downloads its writing model once (1.9 GB).
  EOS
end
