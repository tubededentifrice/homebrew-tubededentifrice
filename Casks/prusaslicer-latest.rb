cask "prusaslicer-latest" do
  version "2.5.0-rc1,202208191450"
  sha256 "a20a1edd98b7b23200f0543a0828a06cf7b424b19c75dc8c6880f9711dfd891d"

  url "https://github.com/prusa3d/PrusaSlicer/releases/download/version_#{version.csv.first}/PrusaSlicer-#{version.csv.first}+MacOS-universal-#{version.csv.second}.dmg",
      verified: "github.com/prusa3d/PrusaSlicer/"
  name "PrusaSlicer"
  desc "G-code generator for 3D printers (RepRap, Makerbot, Ultimaker etc.)"
  homepage "https://www.prusa3d.com/slic3r-prusa-edition/"

  livecheck do
    url "https://github.com/prusa3d/PrusaSlicer/releases/"
    strategy :page_match do |page|
      match = page.match(%r{href=.*?/PrusaSlicer-(\d+(?:\.\d+)*)\+universal-(\d+)\.dmg}i)
      next if match.blank?

      "#{match[1]},#{match[2]}"
    end
  end

  app "PrusaSlicer.app"

  zap trash: [
    "~/Library/Application Support/PrusaSlicer",
    "~/Library/Preferences/com.prusa3d.slic3r",
    "~/Library/Saved Application State/com.prusa3d.slic3r.savedState",
  ]
end
