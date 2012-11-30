module Configurate; module Provider
  # This provides a basic {#lookup} method for other providers to build
  # upon. Childs are expected to define +lookup_path(path, *args)+ where
  # +path+ will be passed an array of settings generated by splitting the
  # called setting at the dots. The method should return nil if the setting
  # wasn't found and {#lookup} will raise an {SettingNotFoundError} in that
  # case.
  class Base
    def lookup(setting, *args)
      result = lookup_path(setting.split("."), *args)
      return result unless result.nil?
      raise Configurate::SettingNotFoundError, "The setting #{setting} was not found"
    end
  end
end; end

require 'configurate/provider/yaml'
require 'configurate/provider/env'
require 'configurate/provider/dynamic'
