require 'rails_helper'

RSpec.describe "messages/index", type: :view do
  before(:each) do
    assign(:messages, [
      Message.create!(
        :subject => "Subject",
        :body => "MyText"
      ),
      Message.create!(
        :subject => "Subject",
        :body => "MyText"
      )
    ])
  end

  it "renders a list of messages" do
    render
    assert_select "tr>td", :text => "Subject".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
