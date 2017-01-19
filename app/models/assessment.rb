class Assessment < CentershiftModel
  def self.where(site_id:, account_id:)
    action = lambda do
      params = {
        "SiteID" => site_id,
        "AcctID" => account_id
      }
      api.get_assessments(params).map do |assessment|
        from_centershift(assessment)
      end
    end
    Relations.new(&action)
  end

  def total
    extended
  end

  def description
    descrip
  end
end
