require "spec_helper"

describe "custom error pages", cluster: "live-1" do
  context "404" do
    let(:url) do
      "https://#{random_string}.apps.#{current_cluster}"
    end

    it "gets a 404 status" do
      expect {
        URI.open(url)
      }.to raise_error(OpenURI::HTTPError, "404 Not Found")
    end

    xit "serves a 404 response" do
      URI.open(url)
    rescue OpenURI::HTTPError => e
      body = e.io.string
      expect(body).to eq("404 page not found\n")
    end
  end
end
