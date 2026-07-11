cask "androidfilesync" do
  version "2.3.1"
  sha256 "39ef8bbc1aedf4adc8e15e350d5c6e16edf567053f7d6bbcece8e2a25cf1f0ee" 
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
