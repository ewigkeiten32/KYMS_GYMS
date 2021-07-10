module ImageHelper
  def photo_for(user)
    if user.photo.attached?
      cl_image_tag(user.photo.key, class: "user-image", alt: user.first_name, width: 100, height: 100)
    else
      image_tag("default.png", class: "user-image", alt: user.first_name, width: 100, height: 100)
    end
  end

  def navbar_photo(user)
    if user.photo.attached?
      cl_image_tag user.photo.key, class: "avatar dropdown-toggle", id: "navbarDropdown",
        data: { toggle: "dropdown" }, 'aria-haspopup': true, 'aria-expanded': false
    else
      image_tag "default.png",class: "avatar dropdown-toggle", id: "navbarDropdown",
        data: { toggle: "dropdown" }, 'aria-haspopup': true, 'aria-expanded': false
    end
  end

  def user_show_image(user)
    if user.photo.attached?
      cl_image_tag user.photo.key, width:"130", class: "img-circle rounded mb-2 img-thumbnail"
    else
      image_tag "default.png", width:"130", class: "img-circle rounded mb-2 img-thumbnail"
    end
  end

  def user_show_image(user)
    if user.photo.attached?
      cl_image_tag user.photo.key, width:130, height: 130, class: "img-responsive img-show"
    else
      image_tag "default.png", width:130, height: 130, class: "img-responsive img-show"
    end
  end
end
