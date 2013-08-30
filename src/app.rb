require 'rubygems'
require 'sinatra'
require 'haml'
require 'cgi'
require 'lib/excerpt_repository'

set :haml, :format => :html5

# set :public_folder, File.dirname(__FILE__) + '/public'
set :views, File.dirname(__FILE__) + '/views'

get '/excerpt/:id' do
  id = CGI.escape params[:id]
  @excerpt = REPOSITORY.find id
  haml :excerpt, :layout => :application
end

get '/' do
  @excerpts = REPOSITORY.excerpts 
  haml :excerpts, :layout => :application
end


get '/index' do
  haml :index, :layout => :application
end


post '/index' do
  haml :index, :layout => :application
end
