class Content < ApplicationRecord
  enum status: [:published, :draft]

  def time_to_publish
    ttp = published_date.to_time.to_i - Date.today.to_time.to_i
    ttp = ttp > 0 ? ttp : 1
    ttp
  end

  def post!
    update_attribute("status", "published")
  end
end
