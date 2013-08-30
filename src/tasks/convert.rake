namespace :convert do

  desc 'clear all generated files'
  task :clear do
    puts "=== clear ==="
    system 'rm -fr out/*'
  end

  desc 'convert all markdown documents from Texte/* to html in out/*'
  task :md2html do
    Dir['Texte/*.md'].each do |md_file|
      html_file = File.basename(md_file).sub(/\.md/, '.html')
      command = "src/script/md2html.rb #{md_file} > out/#{html_file}"
      puts command
      system command
    end
  end

end

