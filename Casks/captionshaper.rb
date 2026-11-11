cask "captionshaper" do
  version "1.1.1"
  sha256 "943460e90399344afa84d814eb65419aa628495783f47bab8d18abbae07e33ba"

  url "https://github.com/hollowbit-dev/captionshaper/releases/download/v#{version}/Captionshaper-#{version}-mac-arm64.dmg"
  name "Captionshaper"
  desc "Offline auto subtitles and word-timed captions for any video"
  homepage "https://captionshaper.app/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: ">= :monterey"

  app "Captionshaper.app"

  zap trash: [
    "~/Library/Application Support/Captionshaper",
    "~/Library/Preferences/dev.hollowbit.captionshaper.plist",
    "~/Library/Saved Application State/dev.hollowbit.captionshaper.savedState",
  ]

  caveats <<~EOS
    Captionshaper is free and open source but not yet signed by Apple.
    The first time, right-click Captionshaper in Applications and choose Open.
    If macOS still blocks it: System Settings > Privacy & Security > Open Anyway.
  EOS
end
