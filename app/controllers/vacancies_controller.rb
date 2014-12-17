class VacanciesController < ApplicationController
  layout false
  def index
    @vacancies = Vacancy.all
  end
end
