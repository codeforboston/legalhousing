# Interface for housing listing sites to scrape. 
# Individual scrapers should override all functions
class ListingScraper

    # Return URL for listing search
    def get_search_url() 
        raise NotImplementedError
    end

    # Returns URLs for individual listings from a serach result HTML
    def get_listing_URLs_from_search_html(search_html)
        raise NotImplementedError
    end

    # Parse individual housing listing. Should return ListingInfo struct
    def parse_listing_html(listing_html)
        raise NotImplementedError
    end 

end