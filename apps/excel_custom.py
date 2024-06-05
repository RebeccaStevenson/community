from talon import ui, Module, Context, registry, actions, imgui, cron
from typing import Optional
from datetime import datetime, timedelta

#   testing
mod = Module()
ctx = Context()


@mod.action_class
class Actions:
    def get_column_number(column_name: str):
        """
        Returns the column number for a given column name based on the column headers from the Excel sheet.
        
        :param column_name: The name of the column header.
        :return: The column number (1-based index), or None if the column name is not found.
        """
        # Column headers extracted from the Excel sheet
        column_headers = [
            'Unnamed: 0', 'WristEx', 'HandEx', 'TopStretch', 'TopMove', 'LegEx',
            'AnkleEx', 'LowerStretch', 'LowerMove', 'Psoas', 'Walk', 'Cardio',
            'One', 'WakeTime', 'Work', 'Tired', 'Stress', 'Mood'
        ]
        
        # Attempt to find the column name in the list of headers
        if column_name in column_headers:
            # Excel columns are 1-based, so add 1 to the index
            return column_headers.index(column_name) + 1
        else:
            return None

    def find_current_date_row_number():
        """
        Calculates the row number of the current date in an Excel sheet,
        assuming a fixed start date and no need to skip weekends or other special dates.
        
        The function assumes that the dates are in a sequential daily order without gaps,
        starting from a predefined start date.
        """
        # Define the start date of the Excel sheet (Year, Month, Day)
        start_date = datetime(2024, 3, 1)  # Example: January 1, 2023
        current_date = datetime.now()
        
        # Calculate the difference in days
        delta_days = (current_date - start_date).days

        # Assuming the first date starts at row 2 (considering a header row)
        row_number = 3 + delta_days
        return row_number

    def go_to_cell(column: str):
        """
        Navigates to a specific cell in an Excel sheet based on the column name and row number.
        
        :param column: The name of the column header.
        :param row: The row number (1-based index).
        """
        # Get the column number based on the column name
        column_number = actions.user.get_column_number(column)
        rowNumber = actions.user.find_current_date_row_number()
        actions.key('ctrl-home')
        actions.key("down:" + str(rowNumber - 2))
        actions.key("right:" + str(column_number - 1))
        actions.insert('')
        # actions.key("right", rowNumber)
        # actions.key("right", rowNumber)
    def go_column(column: str):
        """
        Navigates to a specific column in an excel shet based on the column name.
        """
        column_number = actions.user.get_column_number(column)
        actions.key('home')
        actions.key("right:" + str(column_number - 1))
        #actions.insert('1')

    def go_today():
        """
        Navigates to a specific cell in an Excel sheet based on the column name and row number.
        """
        rowNumber = actions.user.find_current_date_row_number()
        actions.key('right')
        actions.key('ctrl-home')
        actions.key('down:' + str(rowNumber -2))
        
    # def go_today(column: str):
    #     """
    #     Navigates to a specific cell in an Excel sheet based on the column name and row number.
        
    #     :param column: The name of the column header.
    #     :param row: The row number (1-based index).
    #     """
    #     # Get the column number based on the column name
    #     column_number = actions.user.get_column_number(column)
    #     rowNumber = actions.user.find_current_date_row_number()
    #     actions.key('ctrl-home')
    #     actions.key("down:" + str(rowNumber - 2))
    #     actions.key("right:" + str(column_number - 1))
    #     actions.insert('1')
    #     # actions.key("right", rowNumber)
    #     # actions.key("right", rowNumber)