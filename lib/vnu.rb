require 'open3'

# Ruby wrapper for [vnu](https://validator.github.io/validator/)
class Vnu
  JAR_PATH = File.expand_path('../../vnu.jar', __FILE__)

  attr_reader :command, :target

  def initialize(*options)
    @target = options.shift
    options = options.last
    if target
      @command = vnu_cli_with_options(options)
    else
      fail RuntimeError
    end
  end

  def vnu_cli_with_options(options)
    "#{self.class.cli}#{vnu_options(options)} -"
  end

  def validate
    execute(command)
  end

  class << self
    def cli
      @cli ||= "java -jar #{JAR_PATH}"
    end

    def cli_version
      @cli_version ||= `#{cli} --version`.chomp
    end

    def validate(*options)
      new(*options).validate
    end
  end

  private

  def vnu_options(options)
    return unless options
    return @vnu_options if @vnu_options
    @vnu_options = options.each_with_object('') do |o, str|
      k = o.last.is_a?(String) ? " #{o.last}" : nil
      str << " --#{o.first.to_s.gsub(/_/, '-')}#{k}"
    end
  end

  def execute(command)
    @output = @error = @exit_status = nil
    Open3.popen3(command) do |stdin, stdout, stderr, wait_thr|
      stdin.puts target
      stdin.close
      @output = stdout.read.chomp
      @error = stderr.read.chomp
      @exit_status = wait_thr.value
    end
    @error unless @exit_status.success?
  end
end
