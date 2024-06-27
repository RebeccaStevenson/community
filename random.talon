code edit <user.system_path>:
    key(super-r)
    sleep(150ms)
    insert("code " + system_path)
    key(enter)
direct <user.system_path>:
    user.edit_text_file(system_path)
folder <user.system_path>:
    insert(system_path)
patient info edit:
    user.edit_text_file("C:\\Users\\rebec\\Dropbox\\reversal_learning_shared\\Patient_info\\patient_info_RL.xlsx")
habit edit:
    user.edit_text_file("C:\\Users\\rebec\\Dropbox\\DropboxDocuments\\notes\\habit_tracker.xlsx")
statistics open:
    user.edit_text_file("C:\\Users\\rebec\\Dropbox\\statistics\\gelman_hill2007_data_analysis_using_regression_and_multilevel-hierarchical_models.pdf")
date: user.insert_current_date()
date long: user.insert_current_date("%A, %B %d, %Y")
lower: key(down:12)