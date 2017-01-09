# frozen_string_literal: true
# :nodoc:
class AdminController < ApplicationController
  http_basic_authenticate_with name: "mmm", password: "t1st0r@g3"
end
