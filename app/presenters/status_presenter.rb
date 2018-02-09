class StatusPresenter

  def initialize(status)
    @status = status
  end

  def stores
      if  status == "Pending"
         Store.pending_stores
      elsif status == "Active"
        Store.active_stores
      elsif status == "Suspended"
        Store.suspended_stores
    end
  end

  def tab
      if  status == "Pending"
        ["Pending", "Active", "Suspended"]
      elsif status == "Active"
        ["Active", "Pending", "Suspended"]
      elsif status == "Suspended"
        ["Suspended", "Active", "Pending"]
    end
  end
  private

  attr_reader :status
end
