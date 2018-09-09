# Controller for static public pages
class PagesController < ApplicationController
  layout 'pages'
  skip_before_action :authenticate_user!

  def show
    if valid_page?
      render template: "pages/#{params[:page]}"
    else
      render file: 'public/404.html', status: :not_found
    end
  end

  private

  def valid_page?
    File.exist?(Rails.root.join('app/views/pages', "#{params[:page]}.html.erb"))
  end
end
