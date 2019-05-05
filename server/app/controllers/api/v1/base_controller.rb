class Api::V1::BaseController < ActionController::Base
  protected

  def paginate(data)
    {
      data: data,
      page: data.current_page,
      total_pages: data.total_pages
    }
  end
end
