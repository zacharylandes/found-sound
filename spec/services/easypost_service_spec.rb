require 'rails_helper'

describe EasypostService do
  let(:easypostservice){EasypostService.new}
  before :each do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  end
end
