require 'lib/excerpt_header'
require 'lib/citation'

class Excerpt
  attr_reader :text
  attr_reader :header
  attr_reader :citations

  def initialize text
    @text = text
    parts = text.split(/^\s*$/)
    header_text = parts.shift + parts.shift
    @header = ExcerptHeader.new header_text
    @citations = []
    parts.each do |part|
      @citations << Citation.new(part)
    end
  end

  def key
    @header.key
  end
end

