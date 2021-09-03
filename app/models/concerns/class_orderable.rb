module ClassOrderable
  extend ActiveSupport::Concern

  def ordered_newest
    order(created_at: :desc)
  end  
end