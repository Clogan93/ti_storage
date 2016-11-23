# frozen_string_literal: true
# :nodoc:
class StaticPagesController < ApplicationController
  def home
  end

  # storage solutions
  before_action -> { render "static_pages/storage_solutions/#{action_name}" }, only: [
    :commercial_storage, :household_storage, :wine_storage,:boat_storage, :car_storage
  ]
  def commercial_storage
  end
  def household_storage
  end
  def wine_storage
  end
  def boat_storage
  end
  def car_storage
  end

end
