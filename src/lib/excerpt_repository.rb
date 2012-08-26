require 'lib/excerpt'


class ExcerptRepository
  def initialize dir
    @dir = dir
    @excerpts = {}
  end
  
  def find key
    @excerpts[key]
  end

  def excerpts
    @excerpts.values
  end

  def build
    Dir["#{@dir}/*"].each do |file_name|
      add_excerpt Excerpt.new(IO.read file_name)
    end
  end

  def add_excerpt excerpt
    @excerpts[excerpt.key] = excerpt if excerpt.valid?
  end
end
