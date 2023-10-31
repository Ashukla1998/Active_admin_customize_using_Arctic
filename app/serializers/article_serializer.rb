class ArticleSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :title, :body, :avatars 
  def avatars 
    
    object.avatars.map do |avatar, params|
      {
        url: scope[:host] + rails_blob_url(avatar, only_path: true)
      }
    end
  end
end
