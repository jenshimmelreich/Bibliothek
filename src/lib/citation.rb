class Citation
  attr_reader :text

  def initialize text
    @text = text
  end
  
  def title
    @text[/## (.*)/, 1]
  end

  def content
    @text[/##.*?$(.*)\(\d+\)\s*$/m, 1]
  end 

  def reference
    @text[/\((\d+)\)\s*$/, 1]
  end
end
