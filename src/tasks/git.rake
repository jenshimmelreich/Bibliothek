namespace :git do

  desc 'git: add all and commit with "----" comment'
  task :commit do
    puts "=== commit ==="
    system 'git add .'
    system 'git commit -m "----"'
  end

  desc 'git: pull changes from the remote server'
  task :pull do
    puts "=== pull ==="
    system 'git pull'
  end

  desc 'git: push changes to the server'
  task :push do
    puts "=== push ==="
    system 'git push'
  end

  desc 'git: status'
  task :status do
    puts "=== status ==="
    system 'git status'
  end

  desc 'commit, pull, push'
  task :cpp => [:commit, :pull, :push] do
    puts "=== complete ==="
  end

end
