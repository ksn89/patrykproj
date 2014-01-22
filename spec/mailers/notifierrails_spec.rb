require "spec_helper"

describe Notifierrails do
  describe "generate" do
    let(:mail) { Notifierrails.generate }

    it "renders the headers" do
      mail.subject.should eq("Generate")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

  describe "mailer" do
    let(:mail) { Notifierrails.mailer }

    it "renders the headers" do
      mail.subject.should eq("Mailer")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

  describe "Notifierts/devi$" do
    let(:mail) { Notifierrails.Notifierts/devi$ }

    it "renders the headers" do
      mail.subject.should eq("Notifierts/devi$")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

  describe "rails" do
    let(:mail) { Notifierrails.rails }

    it "renders the headers" do
      mail.subject.should eq("Rails")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

  describe "generate" do
    let(:mail) { Notifierrails.generate }

    it "renders the headers" do
      mail.subject.should eq("Generate")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

  describe "mailer" do
    let(:mail) { Notifierrails.mailer }

    it "renders the headers" do
      mail.subject.should eq("Mailer")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

  describe "Notifierrails" do
    let(:mail) { Notifierrails.Notifierrails }

    it "renders the headers" do
      mail.subject.should eq("Notifierrails")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

  describe "generate" do
    let(:mail) { Notifierrails.generate }

    it "renders the headers" do
      mail.subject.should eq("Generate")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

  describe "mailer" do
    let(:mail) { Notifierrails.mailer }

    it "renders the headers" do
      mail.subject.should eq("Mailer")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

  describe "Notifier" do
    let(:mail) { Notifierrails.Notifier }

    it "renders the headers" do
      mail.subject.should eq("Notifier")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

end
