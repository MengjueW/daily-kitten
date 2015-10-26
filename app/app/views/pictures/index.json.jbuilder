json.array!(@pictures) do |picture|
  json.extract! picture, :id, :description, :image, :cat_id
  json.url picture_url(picture, format: :json)
end
