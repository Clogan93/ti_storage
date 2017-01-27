class Admin::QueuesController < ApplicationController
  def show
    @queue = SideQueue.find(params.fetch(:id))
  end
end
