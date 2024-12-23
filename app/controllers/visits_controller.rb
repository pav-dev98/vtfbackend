class VisitsController < ApplicationController
      def index
        @visits = Visit.all
        render json: @visits
      end

      def show
        @visit = Visit.find(params[:id])
        render json: @visit
      end

      def create
        @visit = Visit.new(visit_params)
        if @visit.save
          render json: @visit, status: :created
        else
          render json: @visit.errors, status: :unprocessable_entity
        end
      end

      def update
        @visit = Visit.find(params[:id])
        if @visit.update(visit_params)
          render json: @visit
        else
          render json: @visit.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @visit = Visit.find(params[:id])
        @visit.destroy
        head :no_content
      end

      private

      def visit_params
        params.require(:visit).permit(
          :school,
          :contact_name,
          :email,
          :phone,
          :visit_date,
          :students_count,
          :status,
          :notes
        )
      end
end
