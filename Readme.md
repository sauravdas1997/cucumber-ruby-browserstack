# Flipkart Automation
Automated test on flipkart with Ruby, Cucumber, Selenium and Browserstack Automate

### Get this repository
```
git clone <url>
```
### How to Run?
To run this test move to parent folder.

```sh
cd cucumber-ruby-browserstack
```

Install bundler

```sh
gem install bundler
```

Install required dependencies
```
bundle install
```
Enter your credentials in ```config.yml```
```
BS_USERNAME: <Your User Name>
BS_AUTHKEY: <Your access key>
```
Run rest
```
cucumber
```