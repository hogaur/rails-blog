require 'rails_helper'

RSpec.describe "welcome route", type: :routing do
  it 'should route / to welcome#index' do
    expect(:get =>"/").to route_to("welcome#index")
  end
end
