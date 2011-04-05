require 'lib/excerpt'
require 'lib/excerpt'


class ExcerptRepository
  def initialize dir
    @dir = dir
  end
  
  def excerpts
    @excerpts ||= built_excerpts
  end

  private

  def built_excerpts
    excerpts = []
    Dir["#{@dir}/*"].each do |file_name|
      excerpts << Excerpt.new(IO.read file_name)
    end
    excerpts
  end
end
