class DockerLogReformer < Fluent::Output
  Fluent::Plugin.register_output("docker-log-reformer", self)

  config_param :remove_keys, :string, :default => nil,
               :desc => 'Specify record keys to be removed by a string separated by , (comma).'
  config_param :show_time, :bool, :default => false,
               :desc => 'Show fluentd log time'

  def configure(conf)
    super
    if @remove_keys
      @remove_keys = @remove_keys.split(',')
    end
  end

  def emit(tag, es, chain)
    es.each { |time, record|
      new_records = format_record(record)
      new_records = "#{time_value(time)} \t #{new_records}" if @show_time
      puts new_records
    }
    chain.next
  end

  def format_record(record)
    new_record = ""
    @remove_keys.each { |key| record.delete(key) } if @remove_keys
    record.sort.each do |key, value|
      new_record += "#{key}:#{value} \t"
    end
    new_record
  end

  def time_value(time)
    Time.at(time).to_s
  end

end
