cask "fuseduo" do
  arch arm: "arm64", intel: "x64"

  version "1.1.0"
  sha256 arm:   "db1e45f336910d54fb9550b512cfdef5b6206229994632e4991ef5d0e71dcfc0",
         intel: "5122781a4986729b9259931e591cfacf4e6c5a5b219eac8daf3d515870c1340f"

  url "https://github.com/hollowbit-dev/fuseduo/releases/download/v#{version}/Fuseduo-#{version}-mac-#{arch}.dmg"
  name "Fuseduo"
  desc "Drop one app onto another and Claude builds an automation for them"
  homepage "https://fuseduo.com/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "Fuseduo.app"

  zap trash: [
    "~/Library/Application Support/Fuseduo",
    "~/Library/Preferences/dev.hollowbit.fuseduo.plist",
    "~/Library/Saved Application State/dev.hollowbit.fuseduo.savedState",
  ]

  caveats <<~EOS
    Fuseduo is free and open source but not yet signed by Apple.
    The first time, right-click Fuseduo in Applications and choose Open.
    If macOS still blocks it: System Settings > Privacy & Security > Open Anyway.
    It needs Claude Code (signed in) or an Anthropic API key.
  EOS
end
