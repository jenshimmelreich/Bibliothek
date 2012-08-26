require "lib/excerpt_repository"

class FakeExcerpt
  attr_reader :key
  def initialize key
    @key = key
  end
  def valid?
    !@key.nil?
  end
end

describe 'An ExcerptRepository' do
  before do
    @excerpt_repository = ExcerptRepository.new nil
    @excerpt_repository.add_excerpt FakeExcerpt.new 'key1'
    @excerpt_repository.add_excerpt FakeExcerpt.new 'key2'
  end

  it 'should have a list of excerpts' do
    @excerpt_repository.excerpts.should have(2).excerpts
  end

  it 'should return an excerpt by its key' do
    excerpt_1 = @excerpt_repository.find 'key1'
    excerpt_1.key.should == 'key1'
    excerpt_2 = @excerpt_repository.find 'key2'
    excerpt_2.key.should == 'key2'
  end

  it 'should only except valid excerpts' do
    @excerpt_repository.add_excerpt FakeExcerpt.new nil
    @excerpt_repository.excerpts.should have(2).excerpts
  end
end
