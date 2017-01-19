class TotalDue < CentershiftModel
  def self.where(site_id:, account_id:)
    params = {
      "SiteID" => site_id,
      "AcctID" => account_id
    }
    from_centershift(amount: api.get_total_due(params))
  end
end
