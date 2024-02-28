I have a zip file containing several spreadsheets from an intracranial EEG study, with each spreadsheet detailing neuro-anatomical localizations for different electrodes. There are three columns of interest:  localization, localizationAmnon, and localizationNew. Each of these columns contains a string that describes the localization of the electrode Following different procedures.Additionally, there is a column called regionCode that contains a code for the region that the electrode is localized to. 
I also have a mapping of  these three localization procedures to various region codes contained in the column regionCode. I would like to create a new column in the localization spreadsheet, called autoLocalization, that maps the values found in the localization column to the regionCode column in the mapping file. If a localization string starts with 'wm', I would like to assign the auto regions as 77.  

, localizationAmnon, and localizationNew columns to the regionCode column in the mapping file. If a localization string starts with 'wm', I would like to assign the auto regions as 77. Please ensure that each entry in the auto regions column is unique within the spreadsheet. The values found in localizationAmnon should override those found in localizationNew, which should override those found in localization. If a localization string is not found in the mapping file, please leave the auto regions column blank. Can you please help me with this?
attached is an example of one of these spreadsheets that we can start with. also attached is a mapping of various localization procedures two various region codes contained in the column regionCode. Can you please create a new column in the localization spreadsheet, called auto regions, that maps the values found in the localization, localizationAmnon, and localizationNew columns to the regionCode column in the mapping file. If a localization string starts with 'wm', please assign the auto regions as 77. Please ensure that each entry in the auto regions column is unique within the spreadsheet. the values found in localizationAmnon should override those found in localizationNew, which should override those found in localization. If a localization string is not found in the mapping file, please leave the auto regions column blank. Please let me know if you have any questions.



6. **Update Spreadsheets**
   - Add a new column 'autoRegions' to each spreadsheet.
   - Update 'autoRegions' based on the created mappings, with special conditions:
     - If a localization string starts with 'wm', assign 'autoRegions' as 77.
     - Ensure each entry in 'autoRegions' is unique within its spreadsheet.

    - The protocol must account for the possibility that not all spreadsheets contain the mentioned columns ("localizationAmnon", "localization", and "regions1"). in such cases please work with what you have.
    