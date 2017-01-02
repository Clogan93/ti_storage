# storages are divided into categories (Brooklyn, Queens)
# frozen_string_literal: true
class Category < ApplicationRecord
  validates_presence_of :title, :slug
  validates_uniqueness_of :slug

  has_many :storages

  def url
    "/" + slug
  end

  def serializable_hash(options = {})
    options = {
      methods: [
        :url
      ]
    }.update(options)
    super(options)
  end
end
