require 'lib/citation'

describe Citation do

  before do
    text = %<Produktionsmodell
-----------------
"Allgemein läßt sich ein Produktionsmodell als Netzwerk begreifen."
(84)
    >
    @citation = Citation.new text
  end

  it 'has a title' do
    @citation.title.should == 'Produktionsmodell'
  end

  it 'has a content' do
    @citation.content.should include('läßt sich ein Produktions')
  end

  it 'has a reference' do
    @citation.reference.should == '84'
  end
end

