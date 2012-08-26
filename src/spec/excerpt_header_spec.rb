require 'lib/excerpt_header'
require 'cgi'


describe ExcerptHeader do

  describe 'for Doerre' do
    before do
      @text = %<Madleine Akrich (et al)

## Die De-Skription technischer Objekte

@incollection{akrich2006deskription,
 author={Madleine Akrich}, 
 title={Die De-Skription technischer Objekte}, 
 crossref={belliger2006anthology},
}
>
      @header = ExcerptHeader.new @text
    end
   
    it 'should extract the author' do
      @header.author.should == 'Madleine Akrich'
    end
   
    it 'should extract the title' do
      @header.title.should == 'Die De-Skription technischer Objekte'
    end
   
    it 'should have a mark' do
      @header.mark.should == 'akrich2006deskription'
    end
   
    it 'should have a text' do
      @header.text.should include('belliger2006anthology')
    end
 
    it 'should use the mark as key' do
      @header.key.should == 'akrich2006deskription'
    end
  end


  describe 'for Ehrenberg' do
    before do
      text = %<Bruno Latour
 
  Eine neue Soziologie für eine neue Gesellschaft
  Einführung in die Akteur-Netzwerk-Theorie
 
 @BOOK{latour2010soziologie, 
 title={Eine neue Soziologie für eine neue Gesellschaft},
 author={Bruno Latour}
}
>
      @header = ExcerptHeader.new text
    end
   
    it 'should extract the author' do
      @header.author.should == 'Bruno Latour'
    end
   
    it 'should extract the title' do
      @header.title.should == 'Eine neue Soziologie für eine neue Gesellschaft'
    end
   
    it 'should have a mark' do
      @header.mark.should == 'latour2010soziologie'
    end
   
    it 'should have a text' do
      @header.text.should include('Einführung in die Akteur-Netzwerk-Theorie')
    end
  end

  describe 'for an validity of an entry' do

    it 'should need author, title and key' do
      text = %<@BOOK{latour2010soziologie, 
 title={Eine neue Soziologie für eine neue Gesellschaft},
 author={Bruno Latour}
}
>
      header = ExcerptHeader.new text
      header.should be_valid
    end
    
    it 'should need author' do
      text = %<@BOOK{latour2010soziologie, 
 title={Eine neue Soziologie für eine neue Gesellschaft},
}
>
      header = ExcerptHeader.new text
      header.should_not be_valid
    end

    it 'should need title' do
      text = %<@BOOK{latour2010soziologie, 
 author={Bruno Latour}
}
>
      header = ExcerptHeader.new text
      header.should_not be_valid
    end

    it 'should need key' do
      text = %<
 title={Eine neue Soziologie für eine neue Gesellschaft},
 author={Bruno Latour}
}
>
      header = ExcerptHeader.new text
      header.should_not be_valid
    end
  end

end
