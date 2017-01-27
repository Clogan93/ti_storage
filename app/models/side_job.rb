class SideJob < SimpleDelegator
  def initializer(attributes:)
    super(attributes)
  end

  def self.from_json(json_string)
    new(OpenStruct.new(JSON.parse(json_string)))
  end

  def id
    args.first.fetch("job_id")
  end
end
