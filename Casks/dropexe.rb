cask "dropexe" do
  version "1.1.0"
  sha256 "7fa1b1801504e753319dd61f5496e3b7afd9c917737fb90ff8540d47f4fa4e76"

  url "https://github.com/hollowbit-dev/dropexe/releases/download/v#{version}/DropExe-#{version}-mac-arm64.dmg"
  name "DropExe"
  desc "Run Windows games and apps on Apple Silicon Macs"
  homepage "https://hollowbit.dev/dropexe/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "DropExe.app"

  zap trash: [
    "~/Applications/DropExe",
    "~/Library/Application Support/DropExe",
    "~/Library/Preferences/dev.hollowbit.dropexe.plist",
    "~/Library/Saved Application State/dev.hollowbit.dropexe.savedState",
  ]

  caveats <<~EOS
    DropExe is free and open source but not yet signed by Apple.
    The first time, right-click DropExe in Applications and choose Open.
    If macOS still blocks it: System Settings > Privacy & Security > Open Anyway.
    Windows games run through Rosetta 2, which macOS installs on first use.
  EOS
end
