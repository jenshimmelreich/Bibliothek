# watch( 'a regexp pattern matching paths to observe' )  {|match_data_object| command_to_run }

watch( 'spec/.*_spec\.rb' )  {|md| system("spec #{md[0]}") }
watch( 'lib/(.*)\.rb' )      {|md| system("spec spec/#{md[1]}_spec.rb") }
