# ApplicationHelper
# frozen_string_literal: true
module ApplicationHelper
  def storage_image_path(storage)
    "_db/storages/#{storage.slug}.jpg"
  end

  def seo_storage_path(storage)
    sluggable_location_path(
      category_slug: storage.category.slug,
      storage_slug: storage.slug
    )
  end

  def size_class(square_feet)
    square_feet = square_feet.to_i

    return :custom if square_feet.zero?

    case square_feet
    when 0..50 then :small
    when 51..150 then :medium
    when 151..300 then :large
    else
      :'x-large'
    end
  end

  def card_month_options
    (1..12)
  end

  def card_year_options
    start_year = Time.now.year
    (start_year..start_year + 10)
  end
end
