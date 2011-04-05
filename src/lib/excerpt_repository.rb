class ExcerptRepository
  def initialize dir
    @dir = dir
  end
  
  def excerpts
    @excerpts ||= built_excerpts
  end

  private

  def built_excerpts
  end
end
