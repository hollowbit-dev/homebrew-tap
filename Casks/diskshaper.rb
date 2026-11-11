cask "diskshaper" do
  arch arm: "arm64", intel: "x64"

  version "1.0.2"
  sha256 arm:   "e787f08c7aaf9a65ba47e35292e9a1a2e8d651d7be1cfc9148bb7b8bfcedc669",
         intel: "35527ab482d43c52c09c0daf76a1126696ade848e32a5ff4231c77bc50253972"

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
