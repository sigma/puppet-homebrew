# Public: Tap a Homebrew source
#
# Usage: homebrew::tap { 'homebrew/versions': }

define homebrew::tap(
  $ensure = present,
  $source = $title,
) {

  if $ensure == 'present' {
    exec { "homebrew_tap_${source}":
      command => "brew tap ${source}",
      unless  => "brew tap | grep ${source}",
    }
  } else {
    exec { "homebrew_untap_${source}":
      command => "brew untap ${source}",
      onlyif  => "brew tap | grep ${source}",
    }
  }
}
