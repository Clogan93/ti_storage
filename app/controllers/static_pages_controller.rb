# frozen_string_literal: true
# :nodoc:
class StaticPagesController < ApplicationController
  def home
    @storages = Storage.all
  end

  def storage_solutions
  end
end
