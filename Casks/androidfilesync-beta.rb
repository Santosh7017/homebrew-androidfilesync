cask "androidfilesync-beta" do
  version "2.3.3-beta.1"
  sha256 "eca000bac3b527a29611dc32f1743c5a4a688711d857b97c90b7f3d28c05d1ea" 
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
