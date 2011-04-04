require "lib/excerpt"

describe 'An Excerpt' do
  
  before do
    @text = %<Klaus Dörre
    Gibt es ein nachfordistisches Produktionsmodell
    ===============================================
    in: Mario Candeias & Frank Deppe
    Ein neuer Kapitalismus
    Hamburg 2001
    (Dörre 2001)

    Kein überlegenes Rationalitätsprinzip
    -------------------------------------
    "Anders als Gramsci für die fordistische Produktion behauptete."
    (83)

    Produktionsmodell
    -----------------
    "Allgemein läßt sich ein Produktionsmodell als Netzwerk begreifen."
    (84)
    >
  end
  
  it 'should create an excerpt from a text and has its raw content' do
    excerpt = Excerpt.new @text
    excerpt.text.should_not be_nil
  end
 
  it 'should create an ExcerptHeader' do
    excerpt = Excerpt.new @text
    excerpt.header.should_not be_nil
    excerpt.header.text.should include('Mario Candeias')
  end 

  it 'should create a list of citations' do
    excerpt = Excerpt.new @text
    excerpt.citations.should have(2).items
    excerpt.citations[0].text.should include('fordistische')
  end
end
