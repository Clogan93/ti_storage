# frozen_string_literal: true
# :nodoc:
class Promotion < CentershiftModel
  def description
    pcd_desc
  end

  def id
    pcd_id.to_i
  end
end
