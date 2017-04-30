class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @estates = policy_scope(Estate).order(created_at: :desc)
    @wines = policy_scope(Wine).order(created_at: :desc)
  end

  def rg_decision

  end
end
