# Digikala Test Sample

This is an automated test project built using [Robot Framework](https://robotframework.org/) and the [SeleniumLibrary](https://robotframework.org/SeleniumLibrary/). The test covers the login and checkout processes of an online shop.

## 📦 Requirements

Before running the tests, make sure you have the following installed:

- Python 3.7+
- pip

Install required packages by running:

```bash
pip install robotframework selenium
```
You also need to have a WebDriver installed (e.g., ChromeDriver) and make sure it is in your system PATH.

⚙️ Configuration
Before executing the tests, open the config.resource file and fill in the required configuration values such as:

${PHONE} and ${PASSWORD} – valid credentials for login

🚀 Running the Test
To run the test suite, use the following command in your terminal:

```bash
python -m robot digikala_test_sample.robot
```
Make sure you are in the root directory of the project when running this command.

📁 Project Structure
```bash

.
├── config.resource               # Configuration file (must be filled before running)
├── digikala_test_sample.robot   # Main Robot Framework test suite
├── README.md       