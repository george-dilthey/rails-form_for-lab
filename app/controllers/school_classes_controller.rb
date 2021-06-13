class SchoolClassesController < ApplicationController


    def index
        @classes = SchoolClass.all
    end

    def new
        @class = SchoolClass.new
    end

    def create
        @class = SchoolClass.create(permit_params)
        redirect_to school_class_path(@class)
    end

    def show
        @class = SchoolClass.find(params[:id])
    end

    def update
        puts params
        @class = SchoolClass.find(params[:id])
        @class.update(permit_params)
        redirect_to school_class_path(@class)
    end

    def edit
        @class = SchoolClass.find(params[:id])
    end


    private

    def permit_params
        params.require(:school_class).permit(:title, :room_number)
    end
end
