import webbrowser
import http.client
from urllib.parse import quote_plus, urlencode
from html.parser import HTMLParser

from talon import Context, Module

from ..user_settings import get_list_from_csv

# Define a parser to extract the top search result
class GoogleSearchParser(HTMLParser):
    def __init__(self):
        super().__init__()
        self.top_result = None

    def handle_starttag(self, tag, attrs):
        if tag == 'a' and not self.top_result:
            href = dict(attrs).get('href', '')
            if href.startswith('/url?q='):
                self.top_result = href.split('&')[0].replace('/url?q=', '')
                print(f"Found potential link: {self.top_result}")

# Function to perform a Google search and open the top result in Chrome
def open_top_google_search(query):
    try:
        # Perform a Google search
        print(f"Performing Google search for query: {query}")
        conn = http.client.HTTPSConnection('www.google.com')
        params = urlencode({'q': query})
        headers = {
            'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'
        }
        conn.request('GET', '/search?' + params, headers=headers)
        response = conn.getresponse()
        html = response.read().decode()

        # Save HTML to a file for debugging purposes
        with open('google_search_results.html', 'w', encoding='utf-8') as file:
            file.write(html)
        print("Saved HTML response to 'google_search_results.html'")

        # Parse the HTML to find the top result
        parser = GoogleSearchParser()
        parser.feed(html)
        top_result = parser.top_result

        if top_result:
            # Open the top result in Chrome
            print(f"Top result found: {top_result}")
            chrome_path = r'open -a /Applications/Google\ Chrome.app %s'
            webbrowser.get(chrome_path).open(top_result)
            print(f"Opening {top_result} in Chrome.")
        else:
            print("No search results found.")
    except Exception as e:
        print(f"An error occurred: {e}")

mod = Module()
mod.list("website", desc="A website.")
mod.list(
    "search_engine",
    desc="A search engine.  Any instance of %s will be replaced by query text",
)

# Please do not edit these defaults.  Instead, add / edit your own entries in
# settings/websites.csv in your user directory.
website_defaults = {
    "talon home page": "http://talonvoice.com",
    "talon slack": "http://talonvoice.slack.com/messages/help",
    "talon wiki": "https://talon.wiki/",
    "talon practice": "https://chaosparrot.github.io/talon_practice/",
    "talon repository search": "https://search.talonvoice.com/search/",
    "amazon": "https://www.amazon.com/",
    "dropbox": "https://dropbox.com/",
    "google": "https://www.google.com/",
    "google calendar": "https://calendar.google.com",
    "google maps": "https://maps.google.com/",
    "google scholar": "https://scholar.google.com/",
    "gmail": "https://mail.google.com/",
    "github": "https://github.com/",
    "gist": "https://gist.github.com/",
    "wikipedia": "https://en.wikipedia.org/",
    "youtube": "https://www.youtube.com/",
}

# Please do not edit these defaults.  Instead, add / edit your own entries in
# settings/search_engines.csv in your user directory.
_search_engine_defaults = {
    "amazon": "https://www.amazon.com/s/?field-keywords=%s",
    "google": "https://www.google.com/search?q=%s",
    "map": "https://maps.google.com/maps?q=%s",
    "scholar": "https://scholar.google.com/scholar?q=%s",
    "wiki": "https://en.wikipedia.org/w/index.php?search=%s",
}

ctx = Context()
ctx.lists["self.website"] = get_list_from_csv(
    "websites.csv",
    headers=("URL", "Spoken name"),
    default=website_defaults,
)
ctx.lists["self.search_engine"] = get_list_from_csv(
    "search_engines.csv",
    headers=("URL Template", "Name"),
    default=_search_engine_defaults,
)

@mod.action_class
class Actions:
    def open_url(url: str):
        """Visit the given URL."""
        webbrowser.open(url)

    def search_with_search_engine(search_template: str, search_text: str):
        """Search a search engine for given text"""
        url = search_template.replace("%s", quote_plus(search_text))
        webbrowser.open(url)

    def open_top_google_search(query: str):
        """Perform a Google search and open the top result in Chrome"""
        open_top_google_search(query)
