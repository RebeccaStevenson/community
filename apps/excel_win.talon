app: excel
app: Microsoft Excel
-
# tag(): user.find_and_replace

# save as excel: user.excel_save_as_format("Excel Workbook (.xlsx)")
zoom in: key("ctrl-alt-=")
zoom out: key("ctrl-alt--")

go <user.letter> <user.number_string>:
    key(ctrl-g)
    sleep(25ms)
    insert(letter + number_string)
    key("enter")

password: key(alt-f i p e)

fill down: key(ctrl-d)
fill right: key(ctrl-r)
insert that: key(ctrl-shift-=)
delete that: key(ctrl--)

paste special: key(ctrl-alt-v)

align left: key(alt-h a l)
align center: key(alt-h a c)

# filter: key(cmd-shift-f)
# sort: key(cmd-shift-r)
table: key(ctrl-t)

formula: key(shift-f3)
# reference: key(cmd-t)

edit: key(f2)
complete: key(alt-down)
ditto: key(ctrl-shift-')
bold: key(ctrl-b)
italic: key(ctrl-i)
underline: key(ctrl-u)
# strike through: key(cmd-shift-x)

# format general: key(ctrl-~)
# format currency: key(ctrl-$)
# format (percent | percentage): key(ctrl-%)
# format (decimal | number): key(ctrl-!)
# format exponential: key(ctrl-^)
# format date: key(ctrl-#)
# format time: key(ctrl-@)

# cell border: key(cmd-alt-0)
# cell border left: key(cmd-alt-left)
# cell border right: key(cmd-alt-right)
# cell border top: key(cmd-alt-up)
# cell border bottom: key(cmd-alt-down)
# clear cell border: key(cmd-alt--)

# cell select: key(shift-backspace)
cell note: key(shift-f2)
cell comment: key(ctrl-shift-f2)
cell name: key(alt-f3)
cell menu: key(shift-f10)

# array select: key(ctrl-/)

column hide: key(ctrl-0)
# column unhide: key(ctrl-shift-0)
column select: key(ctrl-space)
column insert: key(ctrl-space ctrl-shift-=)
column delete: key(ctrl-space ctrl--)
column top: key(ctrl-up)
column bottom: key(ctrl-down)
column fit: key(alt-h o i)
column filter: key(ctrl-down ctrl-up alt-down)
column width: key(alt-h o w)

row hide: key(ctrl-9)
# row unhide: key(ctrl-shift-9)
row select: key(shift-space)
row insert: key(shift-space ctrl-shift-=)
row delete: key(shift-space ctrl--)
row start: key(ctrl-left)
row end: key(ctrl-right)
row fit: key(alt-h o a)
row height: key(alt-h o h)

table select: key(ctrl-a)
select all: key(ctrl-a:3)

sheet new: key(shift-f11)
sheet previous: key(ctrl-pageup)
sheet next: key(ctrl-pagedown)
sheet rename: key(alt-h o r)

pivot that: key(alt-n v t)
# mail this: user.menu_select("File|Share|Send Workbook")

ribbon: key(ctrl-f1)

window (new | open): key(alt-w n)

go today: user.go_today()
yes: 
    insert('1')
    key('tab')
no: 
    insert('')
    key('tab')
fail: 
    insert('0')
    key('tab')

# play noise
test script: user.go_to_current_date_row("C:\\Users\\rebec\\Dropbox\\DropboxDocuments\\notes\\habit_tracker.xlsx",'Sheet', 'LegEx')
mark wrist: user.go_column("WristEx")
mark hand: user.go_column("HandEx")
mark top: user.go_column("TopStretch")
mark top move: user.go_column("TopMove")
mark leg: user.go_column("LegEx")
mark ankle: user.go_column("AnkleEx")
mark lower: user.go_column("LowerStretch")
mark lower move: user.go_column("LowerMove")
mark psoas: user.go_column("Psoas")
mark walk: user.go_column("Walk")
mark cardio: user.go_column("Cardio")
mark one: user.go_column("One")
mark wake : user.go_column("WakeTime")
mark work: user.go_column("Work")
mark tired: user.go_column("Tired")
mark stress: user.go_column("Stress")
mark mood: user.go_column("Mood")

select <user.xl_cell>: user.xl_select_cells(user.xl_cell)

bounce <number_small>:
    insert(number_small)
    key(enter)
