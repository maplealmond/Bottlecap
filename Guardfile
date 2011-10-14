group 'game' do
  guard 'rspec', :cli => '--color --format doc' do
    # Regexp watch patterns are matched with Regexp#match
    watch(%r{^spec/.+_spec\.rb$})
    watch(%r{^lib/(.+)\.rb$})         { |m| "spec/#{m[1]}_spec.rb" }
  end
end