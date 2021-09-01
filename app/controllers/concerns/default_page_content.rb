module DefaultPageContent
	extend ActiveSupport::Concern

	included do
		before_action :set_page_defaults
	end

	def set_page_defaults
		@page_title = "CLINIQUE | KHADJIJA"
		@seo_keywords = "CLINIQUE KHADIJA VOTRE SANTÉ, NOTRE FIERTÉ"
	end
end