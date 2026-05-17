cask "androidfilesync" do
  version "2.1.0"
  sha256 "7b3ec47f39c3d64d5faab9f654e9c450a30a1acd068195f0765b40640673dba8" 
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
