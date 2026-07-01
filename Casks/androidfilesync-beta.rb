cask "androidfilesync-beta" do
  version "2.3.1-beta"
  sha256 "48a4ecfc3f2b2da52815eccafd6502b8a7821d4fa13bbdbae5b568e941c54494" 
  url "https://github.com/Santosh7017/AndroidFileSync/releases/download/v#{version}/AndroidFileSync.dmg"
  name "AndroidFileSync Beta"
  desc "Free, native macOS app to transfer files and manage Android devices over WiFi or USB (Beta)"
  homepage "https://santosh7017.github.io/AndroidFileSync/"

  conflicts_with cask: "androidfilesync"

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
