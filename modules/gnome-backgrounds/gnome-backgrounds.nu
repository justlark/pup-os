#!/usr/bin/env nu

def main [json: string] {
  let backgrounds = $json | from json | get "backgrounds"

  let xml = $'
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE wallpapers SYSTEM "gnome-wp-list.dtd">
    <wallpapers>
      ($backgrounds | each { |background| $"
          <wallpaper>
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

  print $xml

  $xml out> /usr/share/gnome-background-properties/pup-os.xml
}
