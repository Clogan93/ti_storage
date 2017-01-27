class SideQueue
  def self.find(name)
    new(name: name)
  end

  def initialize(name:)
    @name = name
  end

  def jobs
    $redis.lrange("queue:#{name}", start_index, end_index).map { |job| SideJob.from_json(job) }
  end

  private

  attr_reader :name

  def start_index
    0
  end

  def end_index
    100
  end
end
