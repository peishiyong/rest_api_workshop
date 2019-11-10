require 'yaml'

class LoadConfig
  def self.load
    @@hash ||= begin
                 env_file = File.join(__dir__,'env.yaml')
                 hash = YAML.load(File.read(env_file))
                 hash.each { |k, v| ENV[k] ||= v }
                 hash
               end
  end
end
