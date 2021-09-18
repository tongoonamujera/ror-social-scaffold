require 'rails_helper'

RSpec.describe "messages/show", type: :view do
  before(:each) do
    @message = assign(:message, Message.create!(
      body: "MyText",
      sender_id: "Sender",
      receiver_id: "Receiver"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Sender/)
    expect(rendered).to match(/Receiver/)
  end
end
