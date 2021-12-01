class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :components]

  def home
    @toys = Toy.all.limit(3)
  end

  def components
  end
end
