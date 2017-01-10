# frozen_string_literal: true
# dynamic pages insteaf of usual /public/404.html
# used https://mattbrictson.com/dynamic-rails-error-pages
class ErrorsController < ApplicationController
  def not_found
    render status: 404
  end
end
