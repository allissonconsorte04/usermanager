# frozen_string_literal: true

require 'simplecov'

# Simplecov
SimpleCov.start 'rails' do
  minimum_coverage 100

  add_group 'Concerns', 'app/concerns'
  add_group 'Observers', 'app/observers'
  add_group 'Serializers', 'app/serializers'
  add_group 'Services', 'app/services'
  add_group 'Queries', 'app/queries'

  add_filter %w[channels jobs mailers uploaders helpers]
end
