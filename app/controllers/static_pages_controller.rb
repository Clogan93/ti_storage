# frozen_string_literal: true
# :nodoc:
class StaticPagesController < ApplicationController
  before_action :render_page, except: :home

  def home
  end

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

  private

  def render_page
    render "static_pages/storage_solutions/#{action_name}"
  end
end
