require 'rails_helper'

RSpec.describe "messages/edit", type: :view do
  before(:each) do
    @message = assign(:message, Message.create!(
      body: "MyText",
      sender_id: "MyString",
      receiver_id: "MyString"
    ))
  end

  it "renders the edit message form" do
    render

    assert_select "form[action=?][method=?]", message_path(@message), "post" do

      assert_select "textarea[name=?]", "message[body]"

      assert_select "input[name=?]", "message[sender_id]"

      assert_select "input[name=?]", "message[receiver_id]"
    end
  end
end
