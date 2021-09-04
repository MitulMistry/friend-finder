module ClassOrderable
  extend ActiveSupport::Concern

  def ordered_newest
    order(created_at: :desc)
  end

  def randomized(count = 1)
    order(Arel.sql("RANDOM()")).first(count)
  end
end