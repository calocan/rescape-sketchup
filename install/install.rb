#!/usr/bin/ruby

SKETCHUP_PATH='/Applications/Google SketchUp 8/SketchUp.app'
RUBY_FRAMEWORK="#{SKETCHUP_PATH}/Contents/Frameworks/Ruby.framework/Versions/Current"
PLUGIN_DIR = '/Library/Application Support/Google SketchUp 8/SketchUp/plugins'
RESCAPE_DIR = "#{PLUGIN_DIR}/rescape"
RESCAPE_LIB_DIR = "#{PLUGIN_DIR}/rescape/lib"
RUBY_LIB = '/System/Library/Frameworks/Ruby.framework/Versions/1.8'

# Update Sketchup to link to the Darwin Ruby installation
['Resources', 'Ruby'].each {|file_name|
  file = "#{RUBY_FRAMEWORK}/#{file_name}"
  backup_file = "#{file}.back"
  lib_file = "#{RUBY_LIB}/#{file_name}"

  unless (File.exists?(backup_file))
    mv = "mv '#{file}' '#{backup_file}'"
    puts "Backing up file #{file} with command: #{mv}"
    system(mv)

    ln = "ln -s '#{lib_file}' '#{file}'"
    puts "Linking Sketchup ruby reference to system version with command: #{ln}"
    system(ln)
  end
}