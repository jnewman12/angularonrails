require 'feedjira'

class ScreencastImporter
	def self.import_railscasts
		Feedjira::Feed.add_common_feed_entry_element(:enclosure, :value => :url, :as => :video_url)
		Feedjira::Feed.add_common_feed_entry_element('itunes:duration', :as => :duration)

		#capture feed and iterate over each entry
		feed = Feedjira::Feed.fetch_and_parse("http://feeds.feedburner.com/railscasts")
		feed.entries.each do |entry|

			#strip out the episode number
			title = entry.title.gsub(/^#\d+\s/, '')

			#find/create screencast data into the db
			Screencast.where(video_url: entry.video_url).first_or_create(
				title: title,
				summary: entry.summary,
				duration: entry.duration,
				link: entry.url,
				published_at: entry.published,
				source: 'railscasts' #manually set
				)
		end

		#return the number of total screencasts for the source
		Screencast.where(source: 'railscasts').count
	end
end