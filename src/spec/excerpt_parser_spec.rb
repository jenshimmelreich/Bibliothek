require(File.join(File.dirname(__FILE__), 'spec_helper'))

describe 'An ExcerptParser' do
  
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
  
  it 'should create an excerpt from a text' do
    parser = ExcerptParser.new @text
    parser.excerpt.should_not be_nil
  end
  
end