cask "fileshaper" do
  arch arm: "arm64", intel: "x64"

  version "1.2.1"
  sha256 arm:   "9b991a76e9c6daa5a2cd8984591c6e0246e0fb8d0d5c71a973560ef93bb0e828",
         intel: "3f6a37b0758c4374f1b41f058b086b52a04aac087a8165b86e6b0f4d47dd0cba"

  url "https://github.com/hollowbit-dev/fileshaper/releases/download/v#{version}/Fileshaper-#{version}-mac-#{arch}.dmg"
  name "Fileshaper"
  desc "Offline file toolbox: compress video, convert photos, merge and sign PDFs"
  homepage "https://fileshaper.app/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :monterey

  app "Fileshaper.app"

  zap trash: [
    "~/Library/Application Support/Fileshaper",
    "~/Library/Application Support/Filesmith",
    "~/Library/Preferences/dev.hollowbit.filesmith.plist",
    "~/Library/Saved Application State/dev.hollowbit.filesmith.savedState",
  ]

  caveats <<~EOS
    Fileshaper is free and open source but not yet signed by Apple.
    The first time, right-click Fileshaper in Applications and choose Open.
    If macOS still blocks it: System Settings > Privacy & Security > Open Anyway.
  EOS
end
