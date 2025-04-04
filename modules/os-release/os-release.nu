#!/usr/bin/env nu

def main [json: string] {
  let input = $json | from json

  let name = $input | get "name"
  let id = $input | get "id"
  let id_like = $input | get "id_like" | str join " "
  let version_id = $env.OS_VERSION
  let version = $version_id
  let pretty_name = $"($name) ($version)"
  let extra = $input | get "extra"

  let lines = {
    NAME: $name
    PRETTY_NAME: $pretty_name
    ID: $id
    ID_LIKE: $id_like
    VERSION: $version
    VERSION_ID: $version_id
    ...$extra
  }

  let os_release = $lines | transpose key value | each { |kv| $'($kv.key)="($kv.value)"' } | str join "\n"

  print $os_release

  $os_release out> /etc/os-release
}
