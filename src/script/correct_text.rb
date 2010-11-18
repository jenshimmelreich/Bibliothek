#!/usr/bin/env ruby -i

ARGF.lines do |line|
  line.gsub! /ä/, 'ä'
  line.gsub! /ö/, 'ö'
  line.gsub! /ü/, 'ü'
  line.gsub! /Ä/, 'Ä'
  line.gsub! /Ö/, 'Ö'
  line.gsub! /Ü/, 'Ü'
  line.gsub! /›/, "'"
  line.gsub! /‹/, "'"
  line.gsub! /»/, '"'
  line.gsub! /«/, '"'
  line = %<"#{$1.gsub(/\"/, "'")}"\n> if line =~ /^"(.+)"$/
  print line
end