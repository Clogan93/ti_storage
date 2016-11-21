# frozen_string_literal: true
# :nodoc:
class StaticPagesController < ApplicationController
  def home
    @storages = STORAGES
  end

  def storage_solutions
  end
end
