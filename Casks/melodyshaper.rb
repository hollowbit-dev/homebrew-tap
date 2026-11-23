cask "melodyshaper" do
  arch arm: "arm64", intel: "x64"

  version "1.1.0"
  sha256 arm:   "118f08cc2029dc3c189e3d48b46ab7044cbeda7cc97578c4623919d7fbb46867",
         intel: "9d7c9b1830148348eb23a46aa98fa26fb30e7134945d14babba012cd2ec3275d"

  url "https://github.com/hollowbit-dev/melodyshaper/releases/download/v#{version}/Melodyshaper-#{version}-mac-#{arch}.dmg"
  name "Melodyshaper"
  desc "Music maker that turns a hummed tune into real instruments"
  homepage "https://hollowbit.dev/melodyshaper/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :monterey

  app "Melodyshaper.app"

  zap trash: [
    "~/Library/Application Support/Melodyshaper",
    "~/Library/Preferences/dev.hollowbit.melodyshaper.plist",
    "~/Library/Saved Application State/dev.hollowbit.melodyshaper.savedState",
  ]

  caveats <<~EOS
    Melodyshaper is free and open source but not yet signed by Apple.
    The first time, right-click Melodyshaper in Applications and choose Open.
    If macOS still blocks it: System Settings > Privacy & Security > Open Anyway.
  EOS
end
