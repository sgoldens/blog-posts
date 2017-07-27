require 'rails_helper'

RSpec.describe "messages/edit", type: :view do
  before(:each) do
    @message = assign(:message, Message.create!(
      :subject => "MyString",
      :body => "MyText"
    ))
  end

  it "renders the edit message form" do
    render

    assert_select "form[action=?][method=?]", message_path(@message), "post" do

      assert_select "input#message_subject[name=?]", "message[subject]"

      assert_select "textarea#message_body[name=?]", "message[body]"
    end
  end
end
