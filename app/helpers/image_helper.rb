module ImageHelper
  def photo_for(user)
    if user.photo.attached?
      cl_image_tag(user.photo.key, class: "user-image", alt: user.first_name, width: 50, height: 50)
    else
      image_tag("default.png", class: "user-image", alt: user.first_name, width: 50, height: 50)
    end
  end
end

