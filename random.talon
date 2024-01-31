community edit:
    key(super-r)
    sleep(50ms)
    insert("C:\\Users\\rebec\\AppData\\Roaming\\talon\\user\\community")
    # user.open_in_code("C:\\Users\\rebec\\AppData\\Roaming\\talon\\user\\community")
direct community:
    user.edit_text_file("C:\\Users\\rebec\\AppData\\Roaming\\talon\\user\\community")
    %% set paths
direct local:
    user.edit_text_file("C:\\Users\\rebec\\localFiles\\iEEG_large\\")
direct data:
    user.edit_text_file("C:\\Users\\rebec\\Dropbox\\iEEG\\Analysis\\reversalLearning\\DATA\\")
direct figures:
    user.edit_text_file("C:\\Users\\rebec\\Dropbox\\reversal_learning_shared\\FIGURES\\")
direct shared:
    user.edit_text_file("C:\\Users\\rebec\\Dropbox\\reversal_learning_shared\\")
direct localization:
    user.edit_text_file("C:\\Users\\rebec\\Dropbox\\reversal_learning_shared\\Electrode_localization\\reversal_localizations\\")
reversal edit:
    key(super-r)
    sleep(100ms)
    insert("code C:\\Users\\rebec\\Dropbox\\iEEG\\Analysis\\reversalLearning\\CODE")
    key(enter)
    # user.open_in_code  ..#    ("C:\\Users\\rebec\\Dropbox\\iEEG\\Analysis\\reversalLearning\\CODE")
patient info edit:
    user.edit_text_file("C:\\Users\\rebec\\Dropbox\\reversal_learning_shared\\Patient_info\\patient_info_RL.xlsx")
