# Written by Diver's release workflow on every release — an edit here is
# overwritten by the next one.
cask "diver" do
  version "1.0.0,333"
  sha256 "d613a4b47b44aef29fdd3796a4ae8aa21266e42e1def5a1e1205a8179cc15fca"

  url "https://github.com/SaaS-To-Bentley/homebrew-diver/releases/download/v#{version.csv.first}-#{version.csv.second}/Diver-#{version.csv.first}-#{version.csv.second}.dmg"
  name "Diver"
  desc "Build, launch and document deeplinks"
  homepage "https://usediver.com/"

  # Tags are v<version>-<build>; the build alone moves on every release.
  livecheck do
    url :url
    regex(/^v?(\d+(?:\.\d+)+)-(\d+)$/i)
    strategy :github_latest do |json, regex|
      match = json["tag_name"]&.match(regex)
      next if match.blank?

      "#{match[1]},#{match[2]}"
    end
  end

  depends_on macos: ">= :monterey"

  app "Diver.app"

  zap trash: [
    "~/Documents/diver_db.sqlite*",
    "~/Library/Application Support/com.usediver.app",
    "~/Library/Caches/com.usediver.app",
    "~/Library/HTTPStorages/com.usediver.app",
    "~/Library/Preferences/com.usediver.app.plist",
    "~/Library/Saved Application State/com.usediver.app.savedState",
  ]
end
