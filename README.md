# Github API Fetcher

A Flutter app to fetch github apis.

## The app was developed with the following features in mind

1. First Page : https://api.github.com/users/{userName}
   - Here the user will input a username and after that you go to the home page.
   - Make sure the user can toggle between light and dark themes.
2. Home Page : https://api.github.com/users/{userName}/repos
   - In home page show user all the necessary information.
   - Show the user repository list in a list view and grid view, and give the option to switch between gridview and listview.
   - Implement a filter option where the user can filter the repository list by date, name, start etc.
3. Repository Details:
   - When a user taps on a repository, display detailed information about the repository.

## The following guidelines were followed to write code
- Utilize the GitHub REST API for data retrieval (https://docs.github.com/en/rest).
- Use the latest flutter version.
- Use dio for api calling.
- Use Getx for state management.
- Make sure to commit your progress in git from initial setup.
- Ensure the application has a clean and intuitive user interface.
- Follow best practices for code organisation, readability, and maintainability.
- Implement error handling and provide appropriate feedback to the user.