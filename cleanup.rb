#!/usr/bin/env ruby
#

# Location of casks
CASKROOM = '/usr/local/Caskroom/'

# Go through installed casks.
Dir.foreach(CASKROOM) do |cask_name|
  # Ignore hidden files/directories (i.e. '..' and '.', although someone could
  # potentially have others, such as ".DS_Store" if they've trashed anything
  # there).
  next if cask_name.chr == '.'

  # Get the info for the cask and find the newest version.
  cask_location  = File.join(CASKROOM, cask_name)
  version_line   = %x(brew cask info #{cask_name} | grep #{cask_name}:).split
  newest_version = version_line.map(&:strip).last

  # Get the list of installed versions from cask directory. As before, ignore
  # any hidden files.
  cask_dir_contents  = %x(ls #{cask_location}).split.map(&:strip)
  installed_versions = cask_dir_contents
  installed_versions.reject! { |file_or_dir| file_or_dir.chr == '.' }

  # Remove any old versions.
  installed_versions.each do |version|
    next if version == newest_version
	$stdout.print "Deleting ", cask_location, version, "\n"
    %x(mv #{File.join(cask_location, version)} ~/.Trash)
  end

  next if installed_versions.include?(newest_version)
end
