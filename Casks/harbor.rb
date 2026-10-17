cask "harbor" do
  version "1.0.0"
  sha256 "e4ace55fd266f28b3f2881e4c0f956ae2769388aa859d5c89f3051c4fc3373a8"

  url "https://github.com/griffhurt/harbor/releases/download/v#{version}/Harbor-#{version}.zip"
  name "Harbor"
  desc "Folders of apps in the Dock"
  homepage "https://github.com/griffhurt/harbor"

  livecheck do
    url :url
    strategy :github_latest
  end

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
