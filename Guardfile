group 'game' do
  guard 'rspec', :cli => '--color --format doc' do
    # Regexp watch patterns are matched with Regexp#match

    watch(%r{^lib/(.+)\.rb$})         { |m| "spec/#{m[1]}_spec.rb" }
    watch(%r{^spec/.+_spec\.rb$})
  end

	guard 'cucumber' do
	  watch(%r{^lib/(.+)\.rb$})                             { 'features' }    
	  watch(%r{^features/.+\.feature$})
	  watch(%r{^features/support/.+$})                      { 'features' }
	  watch(%r{^features/step_definitions/(.+)_steps\.rb$}) { |m| Dir[File.join("**/#{m[1]}.feature")][0] || 'features' }
	end

end