class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @estates = policy_scope(Estate).order(created_at: :desc)
  end
end
