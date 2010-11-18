desc 'git: add all and commit with "----" comment'
task :commit do
  system 'git add .'
  system 'git commit -m "----"'
end

desc 'git: pull changes from the remote server'
task :pull do
  system 'git pull'
end

desc 'git: push changes to the server'
task :push do
  system 'git push'
end

desc 'git: status'
task :status do
  system 'git status'
end

desc 'clear all generated files'
task :clear do
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
