#! /usr/bin/ruby

ARGF.inplace_mode = '.bak'
ARGF.lines do |line|
  line.gsub! /"a/, 'ä'
  line.gsub! /"o/, 'ö'
  line.gsub! /"u/, 'ü'
  line.gsub! /›/, "'"
  line.gsub! /‹/, "'"
  print line
end