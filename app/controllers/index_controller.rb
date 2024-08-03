class IndexController < ApplicationController
  def index
    @index = Index.all
  end
end
