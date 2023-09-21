# frozen_string_literal: true

require "rails_helper"

RSpec.describe Metabase::Resources::Card do
  it "should create a card" do
    expect(described_class.new({ "title" => "Star Wars" }).title).to eq("Star Wars")
  end
end
