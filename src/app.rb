require 'rubygems'
require 'sinatra'
require 'haml'

require 'lib/excerpt_repository'

EXCERPT_DIR = "#{File.dirname(__FILE__)}/../Texte" 
set :haml, :format => :html5

set :public, File.dirname(__FILE__) + '/public'
set :views, File.dirname(__FILE__) + '/views'

get '/' do
  @excerpts = ExcerptRepository.new(EXCERPT_DIR).excerpts 
  haml :excerpts
end
