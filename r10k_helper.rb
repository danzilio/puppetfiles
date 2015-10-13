require 'yaml'
require 'facter'

def envspec
  r10k_env = Facter.value(:r10k_environment) || 'production'

  if File.exist?("./#{r10k_env}.yaml")
    modules = YAML.load_file("./#{r10k_env}.yaml")
  end

  if modules
    modules.each do |name, config|
      mod name, config
    end
  end
end
