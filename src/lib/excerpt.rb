require File.dirname(__FILE__) + '/excerpt_header'
require File.dirname(__FILE__) + '/citation'

class Excerpt
  attr_reader :text
  attr_reader :header
  attr_reader :citations

  def initialize text
    @text = text
    parts = text.split(/^\s*$/)
    header_text = parts.shift + parts.shift + parts.shift
    @header = ExcerptHeader.new header_text
    @citations = []
    parts.each do |part|
      @citations << Citation.new(part)
    end
  end

  def key
    @header.key
  end

  def valid?
    @header.valid?
  end
end

