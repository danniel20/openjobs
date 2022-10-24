class CompaniesController < ApplicationController
  def new
    @company = current_user.build_company
  end

  def create
    @company = current_user.build_company(company_params)
    if @company.save
      flash[:notice] = 'Empresa cadastrada com sucesso.'
      redirect_to root_path
    else
      flash[:alert] = 'Erro ao cadastrar empresa'
      render :new
    end
  end

  def edit
    @company = current_user.company
  end

  def update
  end

  private

  def company_params
    params.require(:company).permit(:name, :url, :logo)
  end
end
