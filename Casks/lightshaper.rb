cask "lightshaper" do
  arch arm: "arm64", intel: "x64"

  version "1.1.0"
  sha256 arm:   "3b3953d2dbd8cfb666abb3b1b952b01caed7fcceba4662a152400755d780695e",
         intel: "ac748b9da224b7cc15a8aa090b4efbd68d96fd9e354248732458506648f47809"

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
