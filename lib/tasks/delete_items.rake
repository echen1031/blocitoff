task delete_items: :environment do
  ListItem.where("created_at <= ?", Time.now - 7.days).destroy_all
end
