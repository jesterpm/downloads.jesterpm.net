case Rails.env
when "development"
  # Create a few downloads for testing.

  Download.create(name: "FTP Explorer",
                  filename: "ftpexplorer.zip",
                  type: "Win32 Executable",
                  description: "FTP Explorer is my favorite FTP client for windows. This is a fairly old version from before the client became shareware.",
                  hits: 642)

  Download.create(name: "Windows 98 Screensavers",
                  filename: "98screensavers.zip",
                  type: "Win32 Screensavers",
                  description: "This is a collection of screensavers from Windows 98. A lot of these don't come with Windows XP.",
                  hits: 5852)

when "production"
  # Do nothing for now.
end
