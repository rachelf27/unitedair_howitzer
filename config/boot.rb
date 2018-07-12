require 'rubygems'
require 'bundler/setup'

Bundler.require(:default)

Dir[
    File.join(__dir__, '..', 'lib', '**', '*.rb'),
    File.join(File.dirname(File.dirname(File.expand_path('cucumber'))), '/emails/**/*.rb'),
    File.join(File.dirname(File.dirname(File.expand_path('cucumber'))), 'web/sections/**/*.rb'),
    File.join(File.dirname(File.dirname(File.expand_path('cucumber'))), 'web/pages/**/*.rb'),
    File.join(File.dirname(File.dirname(File.expand_path('cucumber'))), 'prerequisites/models/base.rb'),
    File.join(File.dirname(File.dirname(File.expand_path('cucumber'))), 'prerequisites/models/**/*.rb'),
    File.join(File.dirname(File.dirname(File.expand_path('cucumber'))), 'prerequisites/factory_girl.rb')
  # './emails/**/*.rb',
  # './web/sections/**/*.rb',
  # './web/pages/**/*.rb',
  # './prerequisites/models/**/*.rb',
  # './prerequisites/factory_girl.rb'
].each { |f| require f }

String.send(:include, Howitzer::Utils::StringExtensions)
