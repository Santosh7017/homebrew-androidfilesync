cask "androidfilesync-beta" do
  version "2.3.3-beta.1"
  sha256 "18fb06524d79b0d6c083209bf32bf4b29bcd0c89f681e91975997075f1b5b29c" 
  url "https://github.com/Santosh7017/AndroidFileSync/releases/download/v#{version}/AndroidFileSync.dmg"
  name "AndroidFileSync Beta"
  desc "Free, native macOS app to transfer files and manage Android devices over WiFi or USB (Beta)"
  homepage "https://santosh7017.github.io/AndroidFileSync/"

  conflicts_with cask: "androidfilesync"

  app "AndroidFileSync.app"

  # This automatically removes the quarantine flag after installation!
  postflight_steps do
    run "xattr",
        args: ["-cr", "AndroidFileSync.app"]
  end

  zap trash: [
    "~/Library/Preferences/com.santosh.AndroidFileSync.plist",
    "~/Library/Saved Application State/com.santosh.AndroidFileSync.savedState",
  ]
end
