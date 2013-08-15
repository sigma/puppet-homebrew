# Public: Tap a Homebrew source
#
# Usage: homebrew::tap { 'homebrew/versions': }

define homebrew::tap(
  $ensure = present,
  $source = $title,
) {
  $find = "brew tap | grep ${source}"
  if $ensure == 'present' {
    exec { "homebrew_tap_${source}":
      command => "brew tap ${source}",
      unless  => $find,
    }
  } else {
    exec { "homebrew_untap_${source}":
      command => "brew untap ${source}",
      onlyif  => $find,
    }
  }
}
