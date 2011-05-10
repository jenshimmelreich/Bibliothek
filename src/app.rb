require 'rubygems'
require 'sinatra'
require 'haml'
require 'cgi'

require 'lib/excerpt_repository'

EXCERPT_DIR = "#{File.dirname(__FILE__)}/../Texte" 
REPOSITORY = ExcerptRepository.new EXCERPT_DIR
REPOSITORY.build 

set :haml, :format => :html5

set :public, File.dirname(__FILE__) + '/public'
set :views, File.dirname(__FILE__) + '/views'

get '/excerpt/:id' do
  id = CGI.escape params[:id]
  @excerpt = REPOSITORY.find id
  haml :excerpt
end

get '/' do
  @excerpts = REPOSITORY.excerpts 
  haml :excerpts
end
