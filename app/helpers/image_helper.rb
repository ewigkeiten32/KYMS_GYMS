module ImageHelper
  def photo_for(user)
    if user.photo.attached?
      cl_image_tag(user.photo.key, alt: user.first_name, width: 150, height: 150)
    else
      image_tag("default.png", alt: user.first_name, width: 150, height: 150)
    end
  end
end

