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

  private

  attr_reader :block

  def results
    @results ||= block.call
  end
end
