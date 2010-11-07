#! /usr/bin/ruby -i

ARGF.lines do |line|
  line.gsub! /ä/, 'ä'
  line.gsub! /ö/, 'ö'
  line.gsub! /ü/, 'ü'
  line.gsub! /›/, "'"
  line.gsub! /‹/, "'"
  print line
end