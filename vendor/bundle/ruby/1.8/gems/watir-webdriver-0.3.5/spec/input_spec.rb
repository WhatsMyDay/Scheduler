require File.expand_path('watirspec/spec_helper', File.dirname(__FILE__))

describe Watir::Input do

  before do
    browser.goto(WatirSpec.files + "/forms_with_input_elements.html")
  end

  describe "#to_subtype" do
    it "returns a CheckBox instance" do
      e = browser.input(:xpath => "//input[@type='checkbox']").to_subtype
      e.should be_kind_of(Watir::CheckBox)
    end

    it "returns a Radio instance" do
      e = browser.input(:xpath => "//input[@type='radio']").to_subtype
      e.should be_kind_of(Watir::Radio)
    end

    it "returns a Button instance" do
      es = [
        browser.input(:xpath => "//input[@type='button']").to_subtype,
        browser.input(:xpath => "//input[@type='submit']").to_subtype
      ]

      es.all? { |e| e.should be_kind_of(Watir::Button) }
    end

    it "returns a TextField instance" do
      e = browser.input(:xpath => "//input[@type='text']").to_subtype
      e.should be_kind_of(Watir::TextField)
    end

    it "returns a TextField instance" do
      e = browser.input(:xpath => "//input[@type='file']").to_subtype
      e.should be_kind_of(Watir::FileField)
    end
  end
end
