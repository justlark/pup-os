#!/usr/bin/env nu

def main [json: string] {
  let backgrounds = $json | from json | get "backgrounds"

  let xml = $'
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE wallpapers SYSTEM "gnome-wp-list.dtd">
    <wallpapers>
      ($backgrounds | each { |background| $"
          <wallpaper deleted=\"false\">
            <name>($background.name)</name>
            <filename>($background.path)</filename>
            <options>zoom</options>
            <shade_type>solid</shade_type>
            <pcolor>#ffffff</pcolor>
            <scolor>#000000</scolor>
          </wallpaper>
        " } | str join)
    </wallpapers>
  '

  # Pretty-print the XML document. The <?xml?> declaration MUST be at the start
  # of the document for this to parse.
  let xml = $xml | str trim | from xml --allow-dtd | to xml --indent 2

  print $xml

  $xml out> /usr/share/gnome-background-properties/pup-os.xml
}
