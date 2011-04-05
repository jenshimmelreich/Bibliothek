require 'rubygems'
require 'sinatra'
require 'haml'

set :haml, :format => :html5

set :public, File.dirname(__FILE__) + '/public'
set :views, File.dirname(__FILE__) + '/views'

get '/' do
  @excerpts = ExcerptList.new File.dirname(__FILE__) 
  haml :excerpts
end
