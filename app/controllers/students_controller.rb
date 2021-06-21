class StudentsController < ApplicationController

  def index
    if params[:name]
      
      students = Student.all.select{ |s| s.first_name == params[:name] || s.last_name == params[:name]}
      students = Student.where("first_name == params[:name]").merge(Student.where("last_name == params[:name]"))
      binding.pry
    else
      students = Student.all
    end
    render json: students
  end

  def show
    student = Student.find(params[:id])
    render json: student
  end
end
