module ApplicationHelper
  def profile_img(user)
    return image_tag(user.avatar, alt: user.name) if user.avatar?

    unless user.provider.blank?
      image_url = user.image_url
    else
      image_url = "no_image_wh50.jpg"
    end
      image_tag(image_url, alt: user.name)
  end
end
