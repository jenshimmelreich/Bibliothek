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
end
