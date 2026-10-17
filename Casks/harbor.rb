cask "harbor" do
  version "1.1.0"
  sha256 "87c96704ae36089ea61ffe9d33ad8dda2da413e539cdae99962125acbd5ac654"

  url "https://github.com/griffhurt/harbor/releases/download/v#{version}/Harbor-#{version}.zip"
  name "Harbor"
  desc "Folders of apps in the Dock"
  homepage "https://github.com/griffhurt/harbor"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :tahoe

  app "Harbor.app"

  uninstall quit: "com.griffhurt.harbor"

  zap trash: [
    "~/Applications/Harbor Folders",
    "~/Library/Application Support/Harbor",
    "~/Library/Preferences/com.griffhurt.harbor.plist",
    "~/Library/Saved Application State/com.griffhurt.harbor.savedState",
  ]

  caveats <<~EOS
    Before uninstalling, click Remove from Dock for each folder in Harbor,
    or its tile stays in the Dock after the folder apps are deleted.
  EOS
end
