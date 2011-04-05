class Citation
  attr_reader :text

  def initialize text
    @text = text
  end
  
  def title
    @text[/^(.*)/]
  end

  def content
    @text[/----\s*$(.*)$\s*\(/m, 1]
  end 

  def reference
    @text[/^\s*\((.*)\)\s*$/, 1]
  end
end
