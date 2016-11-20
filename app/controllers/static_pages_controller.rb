# frozen_string_literal: true
# :nodoc:
# rubocop:disable MethodLength
class StaticPagesController < ApplicationController
  def home
    @storages = STORAGES
  end

  def storage_solutions
  end
end
