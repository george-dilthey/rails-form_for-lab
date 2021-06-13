class StudentsController < ApplicationController


    def index
        @students = Student.all
    end

    def new
        @student = Student.new
    end

    def create
        @student = Student.create(permit_params)
        redirect_to student_path(@student)
    end

    def show
        @student = Student.find(params[:id])
    end

    def update
        puts params
        @student = Student.find(params[:id])
        @student.update(permit_params)
        redirect_to student_path(@student)
    end

    def edit
        @student = Student.find(params[:id])
    end


    private

    def permit_params
        params.require(:student).permit(:first_name, :last_name)
    end
end
