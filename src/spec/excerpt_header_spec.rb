require 'lib/excerpt_header'

describe ExcerptHeader do
  before do
    text = %<Klaus Dörre
Gibt es ein nachfordistisches Produktionsmodell
===============================================
in: Mario Candeias & Frank Deppe
Ein neuer Kapitalismus
Hamburg 2001
(Dörre 2001)
>
    @header = ExcerptHeader.new text
  end

  it 'should extract the author' do
    @header.author.should == 'Klaus Dörre'
  end

  it 'should extract the title' do
    @header.title.should == 'Gibt es ein nachfordistisches Produktionsmodell'
  end

  it 'should have a mark' do
    @header.mark.should == 'Dörre 2001'
  end

  it 'should have a source' do
    @header.source.should include('& Frank Deppe')
  end

end
