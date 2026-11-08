cask "androidfilesync" do
  version "2.3.3"
  sha256 "2b5e3ec171f0a7fdc9b0f581e73b4599504187bd31a256b6cda8279af63cfb3b" 
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
