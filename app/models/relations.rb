# frozen_string_literal: true
# :nodoc:
class Relations
  include Enumerable

  def initialize(&block)
    @block = block
  end

  def each(&block)
    results.each(&block)
  end

  def execute
    results
  end

  def all
    results
  end

  def where(conditions)
    scope = results.select do |result|
      answers = []
      conditions.each_pair do |attribute, value|
        answers << result.send(attribute).eql?(value)
      end
      !answers.include?(false)
    end
    scope
  end

  private

  attr_reader :block

  def results
    @results ||= block.call
  end
end
