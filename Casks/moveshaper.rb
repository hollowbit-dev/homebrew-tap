cask "moveshaper" do
  arch arm: "arm64", intel: "x64"

  version "1.0.0"
  sha256 arm:   "34898ffa3ad4f9b4e5fc98df92cff184a817214a8a1406993651fb755b27e0b4",
         intel: "0d93db1362e745643852cca474de291ab32d4a150204443ea504c494cc45f9b5"

  url "https://github.com/hollowbit-dev/moveshaper/releases/download/v#{version}/Moveshaper-#{version}-mac-#{arch}.dmg"
  name "Moveshaper"
  desc "Moves files, apps, bookmarks and Wi-Fi to a new computer"
  homepage "https://hollowbit.dev/moveshaper/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :monterey

  app "Moveshaper.app"

  zap trash: [
    "~/Library/Application Support/Moveshaper",
    "~/Library/Preferences/dev.hollowbit.moveshaper.plist",
    "~/Library/Saved Application State/dev.hollowbit.moveshaper.savedState",
  ]

  caveats <<~EOS
    Moveshaper is free and open source but not yet signed by Apple.
    The first time, right-click Moveshaper in Applications and choose Open.
    If macOS still blocks it: System Settings > Privacy & Security > Open Anyway.
  EOS
end
