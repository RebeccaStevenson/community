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

bounce <number_small>:
    insert(number_small)
    key(enter)