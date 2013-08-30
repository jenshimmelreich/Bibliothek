require File.dirname(__FILE__) + '/excerpt_repository'

class ExcerptExporter

  def initialize output_file_name
    @output_file_name = output_file_name
  end

  def run
    puts @output_file_name
    File.open(@output_file_name, 'w') do |file|
      file.write '['
      file.write REPOSITORY.excerpts.inject([]) { |acc, excerpt| acc << json_excerpt(excerpt) if excerpt.header.key }.join ','
      file.write ']'
    end
  end

  private

  def json_excerpt excerpt
    excerpt.citations.inject([]) do |lines, cite|
      lines << json_cite(excerpt, cite)
    end
  end

  def json_cite excerpt, cite
    doc = ""
    doc << "{"
    doc << attribute_for('title', excerpt.header.title) << ','
    doc << attribute_for('author', excerpt.header.author) << ','
    doc << attribute_for('key', excerpt.header.key) << ','
    doc << attribute_for('page', cite.reference) << ','
    doc << attribute_for('headline', cite.title) << ','
    doc << attribute_for('text', cite.content) << ','
    doc << attribute_for('uid', excerpt.header.key + cite.reference + cite.title)
    doc << "}"
    doc
  rescue => e
    print e
    print ': '
    puts excerpt.header.key
    ""
  end

  def attribute_for key, value
     "'#{key}':'#{value}'"
  end

end

