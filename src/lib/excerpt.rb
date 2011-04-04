require 'lib/excerpt_header'
require 'lib/citation'

class Excerpt
  attr_reader :text
  attr_reader :header
  attr_reader :citations

  def initialize text
    @text = text
    parts = text.split(/^\s*$/)
    @header = ExcerptHeader.new parts.shift
    @citations = []
    parts.each do |part|
      @citations << Citation.new(part)
    end
  end
end

