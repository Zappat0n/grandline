require 'rails_helper'

RSpec.describe QueryAiJob, type: :job do
  describe "#perform" do
    it "calls Messages::Create with the right parameters" do
      stub_request(:post, DeepInfra::Client::URL)
        .to_return(body: '{ "choices": [ { "message": { "content": "Hello, I am your AI" }}]}')

      message = create(:message)
      query_ai_job = QueryAiJob.new

      expect(Messages::Create).to receive(:new).with(
        user: message.receiver,
        message_params: {
          receiver: message.user,
          content: "Hello, I am your AI",
        },
        broadcast: true
      ).and_call_original

      query_ai_job.perform(message)
    end
  end
end
