require 'spec_helper'

describe Idobata::Message do
  describe ".label_writer" do
    context "when do not specify :label" do
      let(:params) {
        {
          source: "hello idobata",
          format: :html
        }
      }
      subject(:formatting_params) { Idobata::Message.label_writer(params) }
      it "should not change params" do
        expect(formatting_params).to eq(params)
      end
    end

    context "when spicify label" do
      let(:params) {
        {
          source: "hello idobata",
          format: :html,
          label: { type: :success, text: "DEPLOY" }
        }
      }
      subject(:formatting_params) { Idobata::Message.label_writer(params) }
      it "should include span tag" do
        expect(formatting_params[:source]).to match("<span class='label label-success'>DEPLOY</span>")
      end
    end

    context "when spicify label and exclude format key" do
      let(:params) {
        {
          source: "hello idobata",
          label: { type: :success, text: "DEPLOY" }
        }
      }
      subject(:formatting_params) { Idobata::Message.label_writer(params) }
      it "should include html" do
        expect(formatting_params[:source]).to match("<span class='label label-success'>DEPLOY</span>")
      end
    end

    context "when specify multiple labels" do
      let(:params) {
        {
          source: "hello idobata",
          format: :html,
          label: [
            { type: :inverse, text: "Inverse" },
            { type: :warning, text: "Warning" }
          ]
        }
      }
      subject(:formatting_params) { Idobata::Message.label_writer(params) }
      it "should include span tags" do
        expect(formatting_params[:source]).to match("<span class='label label-inverse'>Inverse</span> <span class='label label-warning'>Warning</span>")
      end
    end
  end
end
