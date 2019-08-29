module Api
  module V1
    class NameListsController < ApplicationController
      def show
        render json: NameList.find_by!(code: params[:code]),
               status: :ok
      end

      def create
        render json: NameList.create!,
               status: :created
      end
    end
  end
end
