#!/usr/bin/env ruby

require 'rubygems'
require 'bluecloth'

def main
  file_names.each do |file_name|
    text = IO.read file_name
    text = transform text
    text = enclose text
    puts text
  end
end

def file_names
  ARGV
end

def transform text
  BlueCloth.new(text, :smartypants => true).to_html
end

def enclose text
  html % text
end

def html
  %[
<html>
  <head>
    <meta content='text/html; charset=UTF-8' http-equiv='Content-Type'>
    <style type='text/css'>
body {
  margin: 0px 10px 0px 150px;
  font-family: Georgia, 'Times New Roman', Times, serif;
  font-size: 15px;
  line-height: 140%%;
}
h1, h2 {
  font-size: 1em;
  line-height: 140%%;
}
h1 {
  margin: 2em 0 0 0;
}
h2 {
  margin: 1em 0 0 0;
  font-weight: normal;
  font-style: italic;
}
p {
  margin: 0px;
  line-height: 140%%;
}
    </style>
  </head>
  <body>
%s
  </body>
</html>]      
end

main