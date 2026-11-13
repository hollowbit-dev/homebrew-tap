cask "diskshaper" do
  arch arm: "arm64", intel: "x64"

  version "1.1.0"
  sha256 arm:   "dcb0b8bff8b79b2be601bfac51ced44cedc6034158dbff8a130c33f79b979c9a",
         intel: "2067498653c4268f68708849acb07e4869f4f072235d9f902a3879bbe91553d9"

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
