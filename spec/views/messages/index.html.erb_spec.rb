require 'rails_helper'

RSpec.describe "messages/index", type: :view do
  before(:each) do
    assign(:messages, [
      Message.create!(
        body: "MyText",
        sender_id: "Sender",
        receiver_id: "Receiver"
      ),
      Message.create!(
        body: "MyText",
        sender_id: "Sender",
        receiver_id: "Receiver"
      )
    ])
  end

  it "renders a list of messages" do
    render
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "Sender".to_s, count: 2
    assert_select "tr>td", text: "Receiver".to_s, count: 2
  end
end
