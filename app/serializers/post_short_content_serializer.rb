class PostShortContentSerializer < ActiveModel::Serializer
  attributes :title, :short_content

  def short_content

    "#{self.Object.content.first(40)}..."

  end

  #belongs_to :author
  has_many :tags
end
