# frozen_string_literal: true

# -
class DepartmentsController < ApplicationController
  before_action :set_department, only: %i[show edit update destroy]

  # GET /departments or /departments.json
  def index
    @departments = Department.all
  end

  # GET /departments/1 or /departments/1.json
  def show
    # @products_by_dep = Product.where(department: @department)
    @products_by_dep = Product.where("department_id = ?", @department.id)
  end

  # GET /departments/new
  def new
    @department = Department.new
  end

  # GET /departments/1/edit
  # def edit
  # end

  # POST /departments or /departments.json
  def create
    @department = Department.new(department_params)

    respond_to do |format|
      if @department.save
        format.html do
          redirect_to departments_url,
                      notice: "Department was successfully created."
        end
        format.json { render :show, status: :created, location: @department }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json do
          render json: @department.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # PATCH/PUT /departments/1 or /departments/1.json
  def update
    respond_to do |format|
      if @department.update(department_params)
        format.html do
          redirect_to departments_url,
                      notice: "#{@department.name} was successfully updated."
        end
        format.json { render :show, status: :ok, location: @department }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json do
          render json: @department.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # DELETE /departments/1 or /departments/1.json
  def destroy
    if Product.any? { |prod| prod.department_id.to_s == params[:id] }
      msg = "Cannot delete #{@department.name} because it has Products."
    else
      @department.destroy
      msg = "#{@department.name} was successfully deleted."
    end
    respond_to do |format|
      format.html { redirect_to departments_url, notice: msg }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_department
    @department = Department.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def department_params
    params.require(:department).permit(:name)
  end
end
