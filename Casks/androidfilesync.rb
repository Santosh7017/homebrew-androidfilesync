cask "androidfilesync" do
  version "2.2.1"
  sha256 "5aac7cebca840afb0a8c71db146b5f109dcfdf65784a6b6970192d3e34aef839" 
  url "https://github.com/Santosh7017/AndroidFileSync/releases/download/v#{version}/AndroidFileSync.dmg"
  name "AndroidFileSync"
  desc "Free, native macOS app to transfer files and manage Android devices over WiFi or USB"
  homepage "https://santosh7017.github.io/AndroidFileSync/"

  app "AndroidFileSync.app"

  # This automatically removes the quarantine flag after installation!
  postflight do
    system_command "xattr",
                   args: ["-cr", "#{appdir}/AndroidFileSync.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Preferences/com.santosh.AndroidFileSync.plist",
    "~/Library/Saved Application State/com.santosh.AndroidFileSync.savedState",
  ]
end
