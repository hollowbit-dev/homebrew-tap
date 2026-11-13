cask "startshaper" do
  arch arm: "arm64", intel: "x64"

  version "1.0.0"
  sha256 arm:   "46edb4af20f5b04c12ff69d076276c37561cde6d059938a177c4827763bcd05a",
         intel: "52c812587699bc1c74c9309b1ee2d8106986bdd061f2555e222af1fd09525af3"

  url "https://github.com/hollowbit-dev/startshaper/releases/download/v#{version}/Startshaper-#{version}-mac-#{arch}.dmg"
  name "Startshaper"
  desc "Shows what starts by itself at login and switches it off safely"
  homepage "https://hollowbit.dev/startshaper/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "Startshaper.app"

  zap trash: [
    "~/Library/Application Support/Startshaper",
    "~/Library/Preferences/dev.hollowbit.startshaper.plist",
    "~/Library/Saved Application State/dev.hollowbit.startshaper.savedState",
  ]

  caveats <<~EOS
    Startshaper is free and open source but not yet signed by Apple.
    The first time, right-click Startshaper in Applications and choose Open.
    If macOS still blocks it: System Settings > Privacy & Security > Open Anyway.
  EOS
end
