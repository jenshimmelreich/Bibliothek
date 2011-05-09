require 'lib/excerpt_header'
require 'digest/sha1'


describe ExcerptHeader do

  describe 'for Doerre' do
    before do
      @text = %<Klaus Dörre

Gibt es ein nachfordistisches Produktionsmodell
===============================================
in: Mario Candeias & Frank Deppe
Ein neuer Kapitalismus
Hamburg 2001
(Dörre 2001)
>
      @header = ExcerptHeader.new @text
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

    it 'should generate a sha1 of its text as key' do
      sha1 = Digest::SHA1.hexdigest @text
      @header.key.should == sha1
    end
  end


  describe 'for Ehrenberg' do
    before do
      text = %<Alain Ehrenberg

Die Müdigkeit man selbst zu sein
================================
Ehrenberg, Alain: Die Müdigkeit man selbst zu sein.
In: Endstation. Sehnsucht.
Kapitalismus und Depression I.
herausgegeben von Carl Hegemann
Berlin 2000
(Ehrenberg 2000)
>
      @header = ExcerptHeader.new text
    end
   
    it 'should extract the author' do
      @header.author.should == 'Alain Ehrenberg'
    end
   
    it 'should extract the title' do
      @header.title.should == 'Die Müdigkeit man selbst zu sein'
    end
   
    it 'should have a mark' do
      @header.mark.should == 'Ehrenberg 2000'
    end
   
    it 'should have a source' do
      @header.source.should include('Endstation. Sehnsucht')
    end
  end

end
