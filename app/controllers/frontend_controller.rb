class FrontendController < ApplicationController
  def type024_article
  end

  def type025_article
  end

  def type030_article
    @watasu_params = {
      page_list1: [
        {file: ApplicationController.helpers.image_path("pages/000.png")},
        {file: ApplicationController.helpers.image_path("pages/001.png")},
        {file: ApplicationController.helpers.image_path("pages/002.png")},
      ],
      page_list2: [
        {file: ApplicationController.helpers.image_path("pages/m000.png")},
        {file: ApplicationController.helpers.image_path("pages/m001.png")},
        {file: ApplicationController.helpers.image_path("pages/m002.png")},
      ],
    }
  end
end
