cask "androidfilesync" do
  version "2.3.2"
  sha256 "bcdd3e4051cceb3a792713b7a6a6d28c416aea50efba28c11e98128f33ac9361" 
  url "https://github.com/Santosh7017/AndroidFileSync/releases/download/v#{version}/AndroidFileSync.dmg"
  name "AndroidFileSync"
  desc "Free, native macOS app to transfer files and manage Android devices over WiFi or USB"
  homepage "https://santosh7017.github.io/AndroidFileSync/"

  app "AndroidFileSync.app"

  # This automatically removes the quarantine flag after installation!
  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-cr", "{{appdir}}/AndroidFileSync.app"]
  end

  zap trash: [
    "~/Library/Preferences/com.santosh.AndroidFileSync.plist",
    "~/Library/Saved Application State/com.santosh.AndroidFileSync.savedState",
  ]
end
