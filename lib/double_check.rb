require "double_check/version"

module DoubleCheck
  # Configuration defaults
  @config = { tasks_to_protect: Rake::Task::tasks }
  @valid_config_keys = @config.keys

  # Configure through hash
  def self.configure(opts = {})
    opts.each {|k,v| @config[k.to_sym] = v if @valid_config_keys.include? k.to_sym}
  end

  # Configure through yaml file
  def self.configure_with(path_to_yaml_file)
    begin
      config = YAML::load(IO.read(path_to_yaml_file))
    rescue Errno::ENOENT
      log(:warning, "YAML configuration file couldn't be found. Using defaults."); return
    rescue Psych::SyntaxError
      log(:warning, "YAML configuration file contains invalid syntax. Using defaults."); return
    end

    configure(config)
  end

  def self.config
    @config
  end

  def self.double_check
    puts "Are you sure you want to execute this in a #{Rails.env} environment? (YES/NO)"
    case STDIN.gets.chomp
      when 'YES'
        puts 'Proceeding'
      when 'NO'
        puts 'Exiting'
        exit(0)
      else
        puts 'You must answer YES or NO'
        double_check
    end
  end
end
