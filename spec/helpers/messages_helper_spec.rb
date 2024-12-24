require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the MessagesHelper. For example:
#
# describe MessagesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe MessagesHelper, type: :helper do
  describe "time_to_display" do
    it "renders the right string for today" do
      time = Time.zone.now

      expect(helper.time_to_display(time)).to eq(time.strftime("%H:%M"))
    end

    it "renders the right string for yesterday" do
      time = Time.zone.now - 1.day

      expect(helper.time_to_display(time)).to eq(time.strftime("%Y-%m-%d %H:%M"))
    end
  end
end
