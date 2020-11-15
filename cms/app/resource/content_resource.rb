class ContentResource < JSONAPI::Resource
  attributes :content, :summary, :author, :title, :published_date
end
