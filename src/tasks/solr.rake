require "#{File.dirname(__FILE__)}/../lib/excerpt_exporter"

APP_DIR = '$HOME/Documents/Bibliothek'
JSON_FILE_PATH = 'out/excerts.json'
SOLR_DIR = "#{APP_DIR}/src/solr"

namespace :solr do

  desc 'start the solr-server'
  task :start do
    system "cd #{SOLR_DIR}/develop; java -Dsolr.appName=solr  -Dsolr.solr.home=#{SOLR_DIR}/solrhome -jar start.jar"
  end

  desc 'generate a new solr index'
  task :generate => :create_json do
    puts 'generate'
    # delete_documents
    import_documents
  end

  desc 'create json-file with all texts for sending to solr'
  task :create_json do
    # generate_json
  end

  def generate_json
    exporter = ExcerptExporter.new JSON_FILE_PATH
    exporter.run
  end

  def delete_documents
    system "curl http://localhost:8983/solr/bib/update?commit=true -H 'Content-Type: text/xml' --data-binary '<delete><query>*:*</query></delete>' --silent --show-error" 
  end

  def import_documents
    system "curl http://localhost:8983/solr/bib/update?commit=true @#{APP_DIR}/#{JSON_FILE_PATH} -H 'Content-type:application/json' --data-binary --silent --show-error" 
  end

end
