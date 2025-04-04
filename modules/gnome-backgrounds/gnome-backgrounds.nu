#!/usr/bin/env nu

def main [json: string] {
  let backgrounds = $json | from json | get "backgrounds"

  # The indentation is off here because nushell does not yet provide a way to
  # easily dedent multiline strings, and we want this to be pretty. We *could*
  # use `from xml | to xml` to pretty-print it, except nushell does not permit
  # parsing XML documents with DTDs, and the version of nushell that currently
  # ships with BlueBuild does not support `--allow-dtd`.
  #
  # Pretty-printing this isn't strictly necessary, except that the <?xml?>
  # declaration MUST be at the start of the document for it to parse.
  let xml = $'<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE wallpapers SYSTEM "gnome-wp-list.dtd">
<wallpapers>($backgrounds | each { |background| $"
  <wallpaper deleted=\"false\">
    <name>($background.name)</name>
    <filename>($background.path)</filename>
    <options>zoom</options>
    <shade_type>solid</shade_type>
    <pcolor>#ffffff</pcolor>
    <scolor>#000000</scolor>
  </wallpaper>" } | str join)
</wallpapers>'

  print $xml

  $xml out> /usr/share/gnome-background-properties/pup-os.xml
}
