require 'lib/citation'

describe Citation do

  before do
    text = %<## Definition eines Skripts
"Also definieren technische Objekte wie ein Filmskript.
Und zwar präzise." (411)
>
    @citation = Citation.new text
  end

  it 'has a title' do
    @citation.title.should == 'Definition eines Skripts'
  end

  it 'has a content' do
    @citation.content.should include('definieren technische Objekte')
    @citation.content.should include('präzise')
  end

  it 'has a reference' do
    @citation.reference.should == '411'
  end

  it 'could have the page on a line by its own' do
    text = %<## Definition
"Also
Und
(411)
>
    citation = Citation.new text
    citation.reference.should == '411'
  end
end

