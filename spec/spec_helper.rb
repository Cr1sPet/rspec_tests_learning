# frozen_string_literal: true

require_relative '../lib/exchange_it'

RSpec.configure do |config|
  config.example_status_persistence_file_path = 'spec/examples.txt'

  config.define_derived_metadata(file_path: %r{/exchange_it/utils}) do |metadata|
    metadata[:utils] = true
  end
end
