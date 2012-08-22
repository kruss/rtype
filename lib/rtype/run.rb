require "optparse"
require_relative "core/type_trainer"

options = {}
optparse = OptionParser.new do |opts|
  opts.on("-k", "--key LEVEL", "set key-set level") do |param|
    options[:key_set_level] = param.to_i - 1
  end
  opts.on("-l", "--line SIZE", "set max line-size") do |param|
    options[:line_size_max] = param.to_i
  end
  opts.on("-w", "--word SIZE", "set max word-size") do |param|
    options[:line_size_max] = param.to_i
  end
  opts.on("-h", "--help", "Display this screen") do
    puts opts
    exit(0)
  end
end
optparse.parse!

if options[:key_set_level] == nil then
  options[:key_set_level] = 0
end

if options[:line_size_max] == nil then
  options[:line_size_max] = 80
elsif options[:line_size_max] < 10 then
  options[:line_size_max] = 10
elsif options[:line_size_max] > 160 then
  options[:line_size_max] = 160
end

if options[:word_size_max] == nil then
  options[:word_size_max] = options[:line_size_max] / 10
elsif options[:word_size_max] < 1 then
  options[:word_size_max] = 1
elsif options[:word_size_max] > options[:line_size_max] then
  options[:word_size_max] = options[:line_size_max]
end

trainer = TypeTrainer.new(
  options[:key_set_level],
  options[:line_size_max],
  options[:word_size_max])
trainer.run()