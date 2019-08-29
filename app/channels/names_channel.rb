class NamesChannel < ApplicationCable::Channel
  def subscribed
    name_list = NameList.find_by!(code: params[:code])
    stream_for name_list
  end
end
