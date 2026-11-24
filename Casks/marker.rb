cask "marker" do
  version "0.3.0"
  sha256 "cbb468103f1ddc9f5d77c99584bfe87e354d7b17fc71a4fbd7549850bc2246f8"

  url "https://git.rikki.moe/rikki/Marker/releases/download/v#{version}/Marker-#{version}.zip"
  name "Marker"
  desc "Markdown and Typst editor that exports LaTeX-quality PDFs"
  homepage "https://git.rikki.moe/rikki/Marker"

  livecheck do
    url "https://git.rikki.moe/api/v1/repos/rikki/Marker/releases/latest"
    strategy :json do |json|
      json["tag_name"]&.delete_prefix("v")
    end
  end

  depends_on arch: :arm64
  depends_on macos: :golden_gate

  app "Marker.app"

  # Marker is ad-hoc signed and not notarized, so Gatekeeper would block its
  # first launch.
  postflight_steps do
    run "/usr/bin/xattr",
        args:           ["-dr", "com.apple.quarantine", "{{appdir}}/Marker.app"],
        writable_paths: ["Marker.app"],
        writable_base:  :appdir,
        must_succeed:   false
  end

  # Notes stay in iCloud Drive/Marker (or Documents/Marker); only app data goes.
  zap trash: [
    "~/Library/Application Support/Marker",
    "~/Library/Caches/moe.rikki.Marker",
    "~/Library/HTTPStorages/moe.rikki.Marker",
    "~/Library/Preferences/moe.rikki.Marker.plist",
    "~/Library/Saved Application State/moe.rikki.Marker.savedState",
  ]
end
