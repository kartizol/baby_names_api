module Api
  module V1
    class NamesController < ApplicationController
      def index
        render json: Name.where(name_list_id: name_list.id), status: :ok
      end

      def create
        new_name = name_list.names.create!(name_params)
        NamesChannel.broadcast_to name_list, NameSerializer.new(new_name)

        render json: new_name, status: :created
      end

      def update
        name.update!(name_crossed_out_param)
        NamesChannel.broadcast_to name_list,  NameSerializer.new(name)

        head :no_content
      end

      private

      def name_list
        @_name_list ||= NameList.find_by!(code: params[:name_list_code])
      end

      def name
        @_name ||= name_list.names.find(params[:id]) if name_list
      end

      def name_params
        params.permit(:name, :crossed_out)
      end

      def name_crossed_out_param
        params.permit(:crossed_out)
      end
    end
  end
end
