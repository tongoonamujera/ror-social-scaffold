require 'rails_helper'

RSpec.describe "messages/new", type: :view do
  before(:each) do
    assign(:message, Message.new(
      body: "MyText",
      sender_id: "MyString",
      receiver_id: "MyString"
    ))
  end

  it "renders new message form" do
    render

    assert_select "form[action=?][method=?]", messages_path, "post" do

      assert_select "textarea[name=?]", "message[body]"

      assert_select "input[name=?]", "message[sender_id]"

      assert_select "input[name=?]", "message[receiver_id]"
    end
  end
end
