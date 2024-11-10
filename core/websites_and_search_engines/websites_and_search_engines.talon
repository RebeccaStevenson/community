(open | bring me) {user.website}: user.open_url(website)
open that: user.open_url(edit.selected_text())
open paste: user.open_url(clip.text())

{user.search_engine} hunt <user.text>$:
    user.search_with_search_engine(search_engine, user.text)
{user.search_engine} (that | this):
    text = edit.selected_text()
    user.search_with_search_engine(search_engine, text)
{user.search_engine} paste: user.search_with_search_engine(search_engine, clip.text())
# This .talon file defines a voice command to perform a Google search and open the top result

#! does not work
#open top result for <user.text>:
    #user.open_top_google_search(text)

# chat <user.text>:
#    user.open_url("https://chatgpt.com/")
#     sleep(500ms)
#    user.switcher_focus("chrome")
#    sleep(500ms)
    #key(shift-esc)
    #sleep(500ms)
    #insert(text)
