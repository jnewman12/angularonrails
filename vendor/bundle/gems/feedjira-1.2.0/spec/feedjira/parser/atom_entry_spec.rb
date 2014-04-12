require File.join(File.dirname(__FILE__), %w[.. .. spec_helper])

describe Feedjira::Parser::AtomEntry do
  before(:each) do
    # I don't really like doing it this way because these unit test should only rely on AtomEntry,
    # but this is actually how it should work. You would never just pass entry xml straight to the AtomEnry
    @entry = Feedjira::Parser::Atom.parse(sample_atom_feed).entries.first
  end

  it "should parse the title" do
    @entry.title.should == "AWS Job: Architect & Designer Position in Turkey"
  end

  it "should parse the url" do
    @entry.url.should == "http://aws.typepad.com/aws/2009/01/aws-job-architect-designer-position-in-turkey.html"
  end

  it "should parse the url even when" do
    Feedjira::Parser::Atom.parse(load_sample("atom_with_link_tag_for_url_unmarked.xml")).entries.first.url.should == "http://www.innoq.com/blog/phaus/2009/07/ja.html"
  end

  it "should parse the author" do
    @entry.author.should == "AWS Editor"
  end

  it "should parse the content" do
    @entry.content.should == sample_atom_entry_content
  end

  it "should provide a summary" do
    @entry.summary.should == "Late last year an entrepreneur from Turkey visited me at Amazon HQ in Seattle. We talked about his plans to use AWS as part of his new social video portal startup. I won't spill any beans before he's ready to..."
  end

  it "should parse the published date" do
    @entry.published.should == Time.parse_safely("Fri Jan 16 18:21:00 UTC 2009")
  end

  it "should parse the categories" do
    @entry.categories.should == ['Turkey', 'Seattle']
  end

  it "should parse the updated date" do
    @entry.updated.should == Time.parse_safely("Fri Jan 16 18:21:00 UTC 2009")
  end

  it "should parse the id" do
    @entry.id.should == "tag:typepad.com,2003:post-61484736"
  end

  it "should support each" do
    @entry.respond_to? :each
  end

  it "should be able to list out all fields with each" do
    all_fields = []
    @entry.each do |field, value|
      all_fields << field
    end
    all_fields.sort == ['author', 'categories', 'content', 'id', 'published', 'summary', 'title', 'url']
  end

  it "should be able to list out all values with each" do
    title_value = ''
    @entry.each do |field, value|
      title_value = value if field == 'title'
    end
    title_value.should == "AWS Job: Architect & Designer Position in Turkey"
  end

  it "should support checking if a field exists in the entry" do
    @entry.include?('title') && @entry.include?('author')
  end

  it "should allow access to fields with hash syntax" do
    @entry['title'] == @entry.title
    @entry['title'].should == "AWS Job: Architect & Designer Position in Turkey"
    @entry['author'] == @entry.author
    @entry['author'].should == "AWS Editor"
  end

  it "should allow setting field values with hash syntax" do
    @entry['title'] = "Foobar"
    @entry.title.should == "Foobar"
  end

end
