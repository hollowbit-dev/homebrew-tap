cask "fuseduo" do
  arch arm: "arm64", intel: "x64"

  version "1.0.0"
  sha256 arm:   "0489f554d5b5a6f259f98159f31c935a14d1354b90095aff7d6832d20f626737",
         intel: "1064b397da68cff42ed6222ef2e6dd19bdeaefd5fd01b7441277440e385f3d94"

  url "https://github.com/hollowbit-dev/fuseduo/releases/download/v#{version}/Fuseduo-#{version}-mac-#{arch}.dmg"
  name "Fuseduo"
  desc "Drop one app onto another and Claude builds an automation for them"
  homepage "https://hollowbit.dev/fuseduo/"

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
