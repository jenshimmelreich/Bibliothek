#!/usr/bin/env ruby

def main
  ARGV.each do |file_name|
    text = `bluecloth #{file_name}`
    add_css text
    puts text
  end
end

def add_css text
  text.gsub!(/<head>/, "<head><style type='text/css'>#{css}</style>")
end

def css
  %[
    body {
      font-family: Georgia, 'Times New Roman', Times, serif;
      font-size: 17px;
    }
  ]      
end

main