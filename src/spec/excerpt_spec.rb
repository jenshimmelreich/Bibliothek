require "lib/excerpt"

describe 'An Excerpt' do
  
  before do
    text = %<Madleine Akrich

## Die De-Skription technischer Objekte

@incollection{akrich2006deskription,
 author={Madleine Akrich}, 
 title={Die De-Skription technischer Objekte}, 
 crossref={belliger2006anthology},
}

## Inskribieren - Skript
"Ein großer Teil der Arbeit von Innovationen ... ein 'Skript' oder ein 'Szenario'." (411)

## Zwischentitel

## Skript
"Also definieren technische Objekte wie ein Filmskript." (411)
>
    @excerpt = Excerpt.new text
  end
  
  it 'should create an excerpt from a text and has its raw content' do
    @excerpt.text.should_not be_nil
  end
 
  it 'should create an ExcerptHeader' do
    @excerpt.header.should_not be_nil
    @excerpt.header.text.should include('belliger2006anthology')
  end 

  it 'should use the key of the header' do
    @excerpt.key.should == @excerpt.header.key
  end

  it 'should create a list of citations' do
    @excerpt.citations.should have(3).items
    @excerpt.citations[0].text.should include('Innovationen')
  end

  it 'should render a subtitle as citation without content' do
    citation = @excerpt.citations[1]
    citation.title.should include('Zwischentitel')
    citation.content.should be_empty
  end


  it 'should be valid if the header is valid' do
    @excerpt.header.should be_valid
    @excerpt.should be_valid
  end

end
