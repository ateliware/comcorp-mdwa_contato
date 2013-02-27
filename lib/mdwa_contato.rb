# -*- encoding : utf-8 -*-
require 'rails/engine'
require "mdwa_contato/version"

module MdwaContato
  class MdwaContato < Rails::Engine
    config.autoload_paths << File.expand_path("../app", __FILE__)
  end
end
