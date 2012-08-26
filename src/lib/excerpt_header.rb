require 'cgi'

class ExcerptHeader
  attr_reader :text

  def initialize text
    @text = text
  end

  def author
    @text[/author=\{(.*)\}/, 1]
  end

  def title
    @text[/title=\{(.*)\}/, 1]
  end

  def mark
    @text[/@.*\{(.*),/, 1]
  end

  def key
    mark
  end

  def valid?
    !author.nil? and !title.nil? and !key.nil?
  end
end
