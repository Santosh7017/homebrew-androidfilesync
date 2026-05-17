cask "androidfilesync" do
  version "2.1.0"
  sha256 "010158f901372ee13f58bf04d8b0d5374dffed7276cef35b3e2c1807246a802f" 
  url "https://github.com/Santosh7017/AndroidFileSync/releases/download/V#{version}/AndroidFileSync.dmg"
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
