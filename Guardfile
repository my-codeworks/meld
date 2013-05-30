guard 'rspec', cli: '--drb --color', rspec: true, cucumber: false, test_unit: false do
  # run every updated spec file
  watch(%r{^spec/.+_spec\.rb$})
  # run the lib specs when a file in lib/ changes
  watch(%r{^lib/(.+)\.rb$}) { |m| "spec/models/#{m[1]}_spec.rb" }
end