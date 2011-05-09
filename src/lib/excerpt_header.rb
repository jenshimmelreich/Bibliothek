require 'cgi'

class ExcerptHeader
  attr_reader :text

  def initialize text
    @text = text
  end

  def author
    @text[/\A.*/]
  end

  def title
    @text[/^\s*(.*)$\s+====/, 1]
  end

  def mark
    @text[/^\s*\((.*)\)\s*$/, 1]
  end

  def source
    @text[/====\s*$(.*)$\s*\(/m, 1]
  end

  def key
    CGI.escape "#{author}_#{title}"
  end
end
